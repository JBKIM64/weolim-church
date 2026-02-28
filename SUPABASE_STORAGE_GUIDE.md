# Supabase Storage를 이용한 음원 파일 관리 가이드

## 왜 Supabase Storage를 사용해야 하나?

### 장점
- ✅ **무제한 용량**: 무료 플랜도 1GB 제공 (충분함)
- ✅ **배포 용량 절약**: Vercel 100MB 제한 우회
- ✅ **CDN 지원**: 빠른 로딩 속도
- ✅ **쉬운 관리**: 웹 대시보드에서 파일 업로드/삭제
- ✅ **보안**: 접근 제어 정책 설정 가능

### 로컬 파일 vs Supabase Storage

| 항목 | 로컬 파일 (public/) | Supabase Storage |
|------|---------------------|------------------|
| 용량 제한 | Vercel 100MB | 1GB (무료) |
| 업로드 방법 | 파일 시스템 복사 | 웹 대시보드 |
| 배포 속도 | 느림 (파일 포함) | 빠름 |
| 관리 | Git 커밋 필요 | 대시보드에서 즉시 |

---

## 설정 방법

### 1단계: Storage 버킷 생성

1. [Supabase Dashboard](https://supabase.com/dashboard) 접속
2. 프로젝트 선택
3. 왼쪽 메뉴에서 **Storage** 클릭
4. **New bucket** 버튼 클릭
5. 버킷 설정:
   - **Name**: `devotional-audio`
   - **Public bucket**: ✅ 체크 (누구나 재생 가능하도록)
   - **File size limit**: 10 MB (음원 파일당 제한)
   - **Allowed MIME types**: `audio/mpeg, audio/mp3, audio/wav, audio/m4a`

6. **Create bucket** 클릭

### 2단계: 폴더 구조 생성

Storage 버킷에서:

1. `devotional-audio` 버킷 클릭
2. **Upload** 버튼 옆의 **Create folder** 클릭
3. 폴더 생성:
   - `hymns` (찬송가)
   - `gospel` (복음성가)

### 3단계: 파일 업로드

각 폴더로 들어가서:

1. **Upload** 버튼 클릭
2. MP3 파일 선택 (여러 개 동시 선택 가능)
3. 업로드 완료 대기

**파일명 규칙**:
- 찬송가: `hymn-88.mp3`, `hymn-147.mp3`
- 복음성가: `gospel-1.mp3`, `gospel-amazing-grace.mp3`

---

## 코드 수정

업로드된 파일의 공개 URL을 가져오는 방식으로 변경해야 합니다.

### 데이터베이스 업데이트 방법

Supabase Storage의 파일 URL 형식:
```
https://[PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-88.mp3
```

**SQL 예시**:

```sql
-- Supabase Storage URL로 업데이트
UPDATE devotionals
SET hymns = '[
  {
    "title": "찬송가 88장 - 내 주 하나님 넓고 큰 은혜",
    "youtube_url": "https://www.youtube.com/watch?v=OVf3oRr_Nag",
    "audio_url": "https://YOUR_PROJECT_ID.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-88.mp3"
  }
]'::jsonb
WHERE date = '2026-03-03';
```

**YOUR_PROJECT_ID 찾기**:
1. Supabase Dashboard → Settings → API
2. **Project URL** 복사: `https://xxxxx.supabase.co`
3. `xxxxx` 부분이 PROJECT_ID

---

## 자동화: URL 헬퍼 함수

매번 긴 URL을 입력하기 번거로우므로, PostgreSQL 함수를 만들어 사용할 수 있습니다:

```sql
-- URL 생성 헬퍼 함수
CREATE OR REPLACE FUNCTION get_audio_url(file_path TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
  project_url TEXT;
BEGIN
  -- 프로젝트 URL 가져오기 (한 번만 설정)
  project_url := 'https://YOUR_PROJECT_ID.supabase.co';

  RETURN project_url || '/storage/v1/object/public/devotional-audio/' || file_path;
END;
$$;

-- 사용 예시
UPDATE devotionals
SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 88장 - 내 주 하나님 넓고 큰 은혜',
    'audio_url', get_audio_url('hymns/hymn-88.mp3')
  )
)
WHERE date = '2026-03-03';
```

---

## 일괄 업데이트 스크립트

여러 날짜의 데이터를 한 번에 업데이트:

```sql
-- 사순절 첫째 주 (3월 3일 ~ 3월 8일)
WITH audio_data AS (
  SELECT
    '2026-03-03'::date as date,
    'hymns/hymn-88.mp3' as hymn_file,
    'gospel/gospel-1.mp3' as gospel_file
  UNION ALL
  SELECT '2026-03-04', 'hymns/hymn-147.mp3', 'gospel/gospel-2.mp3'
  UNION ALL
  SELECT '2026-03-05', 'hymns/hymn-310.mp3', 'gospel/gospel-3.mp3'
  UNION ALL
  SELECT '2026-03-06', 'hymns/hymn-140.mp3', 'gospel/gospel-4.mp3'
  UNION ALL
  SELECT '2026-03-07', 'hymns/hymn-150.mp3', 'gospel/gospel-5.mp3'
  UNION ALL
  SELECT '2026-03-08', 'hymns/hymn-1.mp3', 'gospel/gospel-6.mp3'
)
UPDATE devotionals d
SET
  hymns = jsonb_set(
    COALESCE(d.hymns, '[]'::jsonb),
    '{0,audio_url}',
    to_jsonb(get_audio_url(a.hymn_file))
  ),
  gospel_songs = jsonb_set(
    COALESCE(d.gospel_songs, '[]'::jsonb),
    '{0,audio_url}',
    to_jsonb(get_audio_url(a.gospel_file))
  )
FROM audio_data a
WHERE d.date = a.date;
```

---

## 프론트엔드 코드 (변경 불필요)

현재 `MusicPlayer` 컴포넌트는 이미 완전한 URL을 지원합니다:

```typescript
// 현재 코드 - 수정 불필요
<audio src={music.audio_url} />
```

`audio_url`이 다음 중 하나여도 모두 작동합니다:
- ✅ 로컬 경로: `/audio/hymns/hymn-88.mp3`
- ✅ 완전한 URL: `https://xxxxx.supabase.co/storage/v1/object/public/...`

---

## 파일 관리

### 파일 삭제
1. Supabase Dashboard → Storage → `devotional-audio` 버킷
2. 파일 체크박스 선택
3. **Delete** 버튼 클릭

### 파일 교체
1. 기존 파일 삭제
2. 같은 이름으로 새 파일 업로드
3. 데이터베이스 업데이트 불필요 (같은 URL 사용)

### 파일 URL 확인
1. 파일 클릭
2. **Copy URL** 버튼 클릭
3. 브라우저에서 열어서 재생 테스트

---

## 마이그레이션 가이드

### 로컬 파일 → Supabase Storage 전환

**1. 로컬 파일 백업**
```bash
# 현재 로컬 파일 목록 저장
ls -1 public/audio/hymns/*.mp3 > local-hymns.txt
ls -1 public/audio/gospel/*.mp3 > local-gospel.txt
```

**2. Supabase Storage에 업로드**
- 각 파일을 대시보드에서 수동 업로드
- 또는 Supabase CLI 사용 (대량 업로드)

**3. 데이터베이스 URL 업데이트**
```sql
-- 모든 로컬 경로를 Supabase Storage URL로 변경
UPDATE devotionals
SET hymns = replace(
  hymns::text,
  '/audio/',
  'https://YOUR_PROJECT_ID.supabase.co/storage/v1/object/public/devotional-audio/'
)::jsonb
WHERE hymns::text LIKE '%/audio/%';

UPDATE devotionals
SET gospel_songs = replace(
  gospel_songs::text,
  '/audio/',
  'https://YOUR_PROJECT_ID.supabase.co/storage/v1/object/public/devotional-audio/'
)::jsonb
WHERE gospel_songs::text LIKE '%/audio/%';
```

**4. 로컬 파일 제거 (선택사항)**
```bash
# Git에서 추적 제거
git rm -r public/audio/hymns/*.mp3
git rm -r public/audio/gospel/*.mp3

# .gitkeep 파일은 유지
git add public/audio/**/.gitkeep
```

---

## 성능 최적화

### CDN 캐싱
Supabase Storage는 자동으로 CDN을 사용하므로 전 세계 어디서든 빠른 로딩이 가능합니다.

### 프리로딩
자주 재생되는 음원은 프리로드할 수 있습니다:

```typescript
// MusicPlayer.tsx에 추가 (선택사항)
useEffect(() => {
  if (music.audio_url) {
    const audio = new Audio(music.audio_url);
    audio.preload = 'metadata'; // 또는 'auto'
  }
}, [music.audio_url]);
```

---

## 트러블슈팅

### 파일이 재생되지 않음

**증상**: 404 에러 또는 재생 불가

**해결방법**:
1. Supabase Dashboard에서 버킷이 **Public**인지 확인
2. 파일 URL을 브라우저에서 직접 열어보기
3. CORS 설정 확인 (자동으로 설정됨)

### 업로드 실패

**증상**: 파일 업로드 시 에러

**해결방법**:
1. 파일 크기 확인 (10MB 이하로 설정했는지)
2. 파일 형식 확인 (MP3, WAV, M4A 등)
3. 버킷 설정에서 MIME 타입 추가

### URL이 너무 길어요

**해결방법**:
PostgreSQL 함수 `get_audio_url()` 사용 (위 참조)

---

## 비용

### Supabase Storage 무료 플랜
- **용량**: 1GB
- **대역폭**: 2GB/월
- **파일 수**: 무제한

### 예상 사용량
- 평균 MP3 파일: 3-5MB
- 사순절 46일 × 2곡 = 92곡
- 총 용량: 약 400MB (충분히 여유 있음)

### 업그레이드가 필요한 경우
- Pro 플랜: $25/월 (100GB 스토리지)
- 대부분의 교회 앱은 무료 플랜으로 충분합니다

---

## 요약

1. **Supabase Dashboard**에서 `devotional-audio` 버킷 생성
2. `hymns`, `gospel` 폴더 생성
3. MP3 파일 업로드
4. SQL로 데이터베이스 URL 업데이트
5. 완료! 코드 수정 불필요

**장점**: 용량 걱정 없음, 관리 편리, 배포 빠름, CDN 지원
