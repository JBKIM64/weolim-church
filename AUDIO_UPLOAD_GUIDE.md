# 오디오 파일 업로드 가이드

## 개요
이 가이드는 사순절 묵상 앱에 찬송가와 복음송 오디오 파일을 업로드하는 방법을 설명합니다.

## Supabase Storage 설정

### 1. Storage 버킷 확인
- Supabase Dashboard에서 Storage 섹션으로 이동
- `devotional-audio` 버킷이 이미 생성되어 있습니다
- 공개(Public) 버킷으로 설정되어 있어 URL을 통해 직접 접근 가능합니다

### 2. 폴더 구조
다음과 같은 폴더를 만들어 오디오 파일을 정리하세요:

```
devotional-audio/
├── hymns/          # 찬송가
├── gospels/        # 복음송
└── blood-hymns/    # 보혈찬송 (고난 주간용)
```

## 오디오 파일 업로드 방법

### 방법 1: Supabase Dashboard 사용 (권장)

1. **Supabase Dashboard 접속**
   - https://supabase.com/dashboard
   - 프로젝트 선택

2. **Storage로 이동**
   - 왼쪽 메뉴에서 "Storage" 클릭
   - `devotional-audio` 버킷 선택

3. **폴더 생성**
   - "Create folder" 클릭
   - 폴더명 입력: `hymns`, `gospels`, `blood-hymns`

4. **파일 업로드**
   - 해당 폴더로 이동
   - "Upload files" 클릭
   - MP3 파일 선택 및 업로드

5. **URL 복사**
   - 업로드된 파일 옆의 "Copy URL" 클릭
   - 이 URL을 데이터베이스에 저장

### 방법 2: 앱 내 Audio Manager 사용

앱에 내장된 AudioManager 컴포넌트를 사용할 수 있습니다:
- 개발자 모드에서 AudioManager 페이지 접속
- 폴더 선택 (hymns/gospels/blood-hymns)
- 파일 업로드

## 파일 명명 규칙

### 찬송가 (Hymns)
- 형식: `hymn-[번호].mp3`
- 예시:
  - `hymn-88.mp3` (찬송가 88장)
  - `hymn-147.mp3` (찬송가 147장)
  - `hymn-246.mp3` (찬송가 246장)

### 복음송 (Gospel Songs)
- 형식: `song-[번호].mp3`
- 예시:
  - `song-1.mp3`
  - `song-32.mp3` (부활주일용)
  - `song-45.mp3`

### 보혈찬송 (Blood Hymns)
- 형식: `blood-hymn-[번호].mp3`
- 예시:
  - `blood-hymn-144.mp3` (찬송가 144장 - 예수 나를 위하여)
  - `blood-hymn-145.mp3` (찬송가 145장 - 무엇이나 예수 예수)

## 파일 요구사항

- **파일 형식**: MP3 (권장), WAV, M4A, OGG
- **비트레이트**: 128-320kbps (192kbps 권장)
- **샘플레이트**: 44.1kHz 또는 48kHz
- **최대 파일 크기**: 10MB
- **MIME 타입**: audio/mpeg, audio/mp3, audio/wav, audio/m4a

## 데이터베이스에 오디오 추가

업로드한 오디오 파일을 묵상에 연결하려면 다음 SQL 쿼리를 실행하세요:

### 일반 묵상에 찬송가 추가
```sql
UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 88장 - 내 주 하나님 넓고 큰 은혜',
  'audio_url', 'https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-88.mp3'
)
WHERE date = '2026-02-18';
```

### 일반 묵상에 복음송 추가
```sql
UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '주의 음성을 내가 들으니',
  'audio_url', 'https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/gospels/song-1.mp3'
)
WHERE date = '2026-02-19';
```

### 고난 주간에 보혈찬송 추가
```sql
UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 144장 - 예수 나를 위하여',
  'audio_url', 'https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/blood-hymns/blood-hymn-144.mp3'
)
WHERE date = '2026-03-30' AND is_holy_week = true;
```

### 부활주일에 song-32 추가
```sql
UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '부활의 노래 - Song 32',
  'audio_url', 'https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/gospels/song-32.mp3'
)
WHERE date = '2026-04-05' AND is_holy_week = true;
```

## 모든 묵상에 일괄 적용

모든 사순절 묵상에 찬양을 추가하려면:

```sql
-- 1주차 묵상에 찬송가 추가
UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 88장',
  'audio_url', 'https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-88.mp3'
)
WHERE week_number = 1 AND is_holy_week = false;

-- 고난 주간 묵상에 보혈찬송 추가
UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 144장 - 예수 나를 위하여',
  'audio_url', 'https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/blood-hymns/blood-hymn-144.mp3'
)
WHERE is_holy_week = true AND date < '2026-04-05';

-- 부활주일에 song-32 추가
UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '부활의 노래',
  'audio_url', 'https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/gospels/song-32.mp3'
)
WHERE date = '2026-04-05';
```

## URL 형식

Supabase Storage의 공개 URL 형식:
```
https://[YOUR_PROJECT_ID].supabase.co/storage/v1/object/public/devotional-audio/[folder]/[filename]
```

예시:
```
https://abcdefgh.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-88.mp3
https://abcdefgh.supabase.co/storage/v1/object/public/devotional-audio/gospels/song-32.mp3
https://abcdefgh.supabase.co/storage/v1/object/public/devotional-audio/blood-hymns/blood-hymn-144.mp3
```

## 추천 찬송가

### 일반 사순절 기간
- 찬송가 88장 - 내 주 하나님 넓고 큰 은혜
- 찬송가 147장 - 주 크신 사랙을 내가 노래함은
- 찬송가 246장 - 슬프다 나의 마음
- 찬송가 369장 - 죄에서 자유를 얻게 함은

### 고난 주간 (보혈찬송)
- 찬송가 143장 - 성자의 귀한 몸
- 찬송가 144장 - 예수 나를 위하여
- 찬송가 145장 - 무엇이나 예수 예수
- 찬송가 146장 - 갈보리산 위에
- 찬송가 147장 - 주 크신 사랑을 내가 노래함은

### 부활주일
- 찬송가 150장 - 갈보리산 위에
- 찬송가 151장 - 만세의 주 독생자
- 찬송가 152장 - 주 달려 죽은 십자가
- 복음송 - song-32 (지정된 노래)

## 문제 해결

### 파일이 재생되지 않을 때
1. URL이 정확한지 확인
2. 파일이 실제로 업로드되었는지 확인
3. 버킷이 Public으로 설정되어 있는지 확인
4. 브라우저 콘솔에서 CORS 에러 확인

### CORS 에러 해결
Supabase Dashboard에서:
1. Storage → devotional-audio 버킷
2. Settings
3. "Make public" 옵션 확인

## 지원

문제가 발생하면:
1. Supabase Dashboard에서 Storage 로그 확인
2. 브라우저 개발자 도구 콘솔 확인
3. 파일 형식과 크기 확인
