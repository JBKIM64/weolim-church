# 로컬 음원 파일 사용 설정 가이드

이 가이드는 `public/audio/` 폴더에 음원 파일을 업로드하고 사용하는 방법을 설명합니다.

## 빠른 시작

### 1단계: 음원 파일 준비

먼저 사용할 음원 파일을 준비합니다:

- 찬송가 MP3 파일들
- 복음성가 MP3 파일들

### 2단계: 파일 업로드

프로젝트의 `public/audio/` 폴더에 파일을 복사합니다:

```bash
# 찬송가 업로드
cp 찬송가-88장.mp3 public/audio/hymns/hymn-88.mp3
cp 찬송가-147장.mp3 public/audio/hymns/hymn-147.mp3

# 복음성가 업로드
cp 주의음성을.mp3 public/audio/gospel/song-1.mp3
```

### 3단계: 데이터베이스 업데이트

Supabase Dashboard → SQL Editor에서 다음 쿼리를 실행합니다:

```sql
-- 3월 3일 묵상에 찬송가 88장 음원 추가
UPDATE devotionals
SET hymns = '[
  {
    "title": "찬송가 88장 - 내 주 하나님 넓고 큰 은혜",
    "youtube_url": "https://www.youtube.com/watch?v=OVf3oRr_Nag",
    "audio_url": "/audio/hymns/hymn-88.mp3"
  }
]'::jsonb
WHERE date = '2026-03-03';

-- 복음성가도 추가
UPDATE devotionals
SET gospel_songs = '[
  {
    "title": "주의 음성을 내가 들으니",
    "youtube_url": "https://www.youtube.com/watch?v=example",
    "audio_url": "/audio/gospel/song-1.mp3"
  }
]'::jsonb
WHERE date = '2026-03-03';
```

### 4단계: 확인

앱을 실행하고 해당 날짜의 묵상을 열면 음원 플레이어가 표시됩니다.

---

## 상세 가이드

### 폴더 구조

```
project/
└── public/
    └── audio/
        ├── hymns/           # 찬송가 음원
        │   ├── hymn-88.mp3
        │   ├── hymn-147.mp3
        │   └── ...
        ├── gospel/          # 복음성가 음원
        │   ├── song-1.mp3
        │   ├── song-2.mp3
        │   └── ...
        └── README.md
```

### 파일 명명 규칙

**찬송가**:
- `hymn-[번호].mp3`
- 예: `hymn-88.mp3`, `hymn-147.mp3`, `hymn-410.mp3`

**복음성가**:
- `song-[번호].mp3` 또는 의미있는 이름
- 예: `song-1.mp3`, `song-amazing-grace.mp3`

### 음원 파일 요구사항

- **형식**: MP3 (권장), WAV, M4A, OGG
- **비트레이트**: 128-320kbps (192kbps 권장)
- **샘플레이트**: 44.1kHz 또는 48kHz
- **파일 크기**: 가급적 5MB 이하

### 경로 규칙

데이터베이스에 저장할 때는 다음 형식을 사용합니다:

- 찬송가: `/audio/hymns/hymn-88.mp3`
- 복음성가: `/audio/gospel/song-1.mp3`

**중요**: 경로는 항상 `/`로 시작해야 합니다 (절대 경로).

---

## 데이터베이스 업데이트 방법

### 방법 1: 전체 교체

기존 데이터를 완전히 교체하려면:

```sql
UPDATE devotionals
SET hymns = '[
  {
    "title": "찬송가 88장 - 내 주 하나님 넓고 큰 은혜",
    "youtube_url": "https://www.youtube.com/watch?v=OVf3oRr_Nag",
    "audio_url": "/audio/hymns/hymn-88.mp3"
  }
]'::jsonb
WHERE date = '2026-03-03';
```

### 방법 2: audio_url만 추가

기존 데이터에 `audio_url`만 추가하려면:

```sql
UPDATE devotionals
SET hymns = jsonb_set(
  hymns,
  '{0,audio_url}',
  '"/audio/hymns/hymn-88.mp3"'
)
WHERE date = '2026-03-03';
```

### 방법 3: 여러 찬송가/복음성가가 있는 경우

```sql
UPDATE devotionals
SET hymns = '[
  {
    "title": "찬송가 88장 - 내 주 하나님 넓고 큰 은혜",
    "audio_url": "/audio/hymns/hymn-88.mp3"
  },
  {
    "title": "찬송가 147장 - 주님의 마음을",
    "audio_url": "/audio/hymns/hymn-147.mp3"
  }
]'::jsonb
WHERE date = '2026-03-03';
```

---

## 일괄 업데이트 스크립트 예시

여러 날짜의 묵상에 음원을 한 번에 추가하려면:

```sql
-- 3월 3일 ~ 3월 10일까지의 묵상에 찬송가 추가
UPDATE devotionals
SET hymns = jsonb_set(
  hymns,
  '{0,audio_url}',
  '"/audio/hymns/hymn-88.mp3"'
)
WHERE date BETWEEN '2026-03-03' AND '2026-03-10'
  AND hymns @> '[{"title": "찬송가 88장 - 내 주 하나님 넓고 큰 은혜"}]'::jsonb;
```

---

## MusicPlayer 동작 방식

`MusicPlayer` 컴포넌트는 다음 우선순위로 음악을 표시합니다:

1. **audio_url이 있는 경우**:
   - 인앱 플레이어로 재생 (재생/일시정지, 탐색 바 포함)
   - 가장 좋은 사용자 경험 제공

2. **spotify_embed가 있는 경우**:
   - Spotify 임베드 플레이어 표시

3. **youtube_url만 있는 경우**:
   - YouTube 링크 버튼 표시 (새 탭에서 열림)

---

## 테스트 방법

### 1. 로컬에서 테스트

```bash
# 개발 서버 실행 (자동으로 실행됨)
npm run dev
```

브라우저에서:
1. 해당 날짜의 묵상 열기
2. 음원 플레이어가 보이는지 확인
3. 재생 버튼 클릭하여 음원이 재생되는지 확인

### 2. 브라우저 개발자 도구로 디버깅

문제가 발생하면 F12를 눌러 개발자 도구를 열고:

- **Console 탭**: 에러 메시지 확인
- **Network 탭**: 음원 파일이 로드되는지 확인 (404 에러 등)
- **Elements 탭**: `<audio>` 태그가 올바른 경로를 가지고 있는지 확인

---

## 배포 시 주의사항

### Vercel/Netlify 배포

`public/` 폴더의 모든 파일은 자동으로 배포됩니다. 다음을 확인하세요:

1. **파일 크기 제한**:
   - Vercel 무료 플랜: 프로젝트당 100MB
   - 음원 파일이 너무 많으면 제한에 걸릴 수 있음

2. **Git 저장소**:
   - 음원 파일을 Git에 커밋할지 결정
   - 큰 파일은 Git LFS 사용 권장
   - 또는 `.gitignore`에 `public/audio/*.mp3` 추가

3. **대안**:
   - 음원이 많으면 Supabase Storage 사용 권장
   - CDN 사용도 고려

---

## .gitignore 설정 (선택사항)

음원 파일을 Git에 커밋하지 않으려면 `.gitignore`에 추가:

```gitignore
# Audio files (too large for git)
public/audio/**/*.mp3
public/audio/**/*.wav
public/audio/**/*.m4a

# Keep the directory structure
!public/audio/.gitkeep
!public/audio/README.md
```

---

## 예제 데이터

테스트용 예제 데이터:

```sql
-- 완전한 예제 (찬송가 + 복음성가)
UPDATE devotionals
SET
  hymns = '[
    {
      "title": "찬송가 88장 - 내 주 하나님 넓고 큰 은혜",
      "youtube_url": "https://www.youtube.com/watch?v=OVf3oRr_Nag",
      "audio_url": "/audio/hymns/hymn-88.mp3"
    }
  ]'::jsonb,
  gospel_songs = '[
    {
      "title": "주의 음성을 내가 들으니",
      "youtube_url": "https://www.youtube.com/watch?v=example",
      "audio_url": "/audio/gospel/song-1.mp3"
    }
  ]'::jsonb
WHERE date = '2026-03-03';
```

---

## 트러블슈팅

### 음원이 재생되지 않음

**증상**: 플레이어는 보이지만 재생되지 않음

**해결방법**:
1. 파일 경로 확인: `/audio/hymns/hymn-88.mp3`
2. 파일이 실제로 존재하는지 확인
3. 파일 형식 확인 (MP3 권장)
4. 브라우저 콘솔에서 에러 확인

### 404 에러

**증상**: Network 탭에서 404 Not Found

**해결방법**:
1. 파일명 확인 (대소문자 구분)
2. 경로가 `/audio/`로 시작하는지 확인
3. `public/audio/` 폴더에 파일이 있는지 확인

### 플레이어가 아예 안 보임

**증상**: 음악 섹션이 비어있음

**해결방법**:
1. 데이터베이스 쿼리 확인
2. `hymns` 또는 `gospel_songs` 필드가 비어있는지 확인
3. JSON 형식이 올바른지 확인

---

## 추가 리소스

- `public/audio/README.md` - 폴더 구조 및 기본 안내
- `AUDIO_UPLOAD_GUIDE.md` - Supabase Storage 사용 가이드 (대안)
- MusicPlayer 컴포넌트: `src/components/MusicPlayer.tsx`

---

## 도움말

문제가 계속되면 다음 정보를 확인하세요:

1. 브라우저 개발자 도구의 Console 탭 에러 메시지
2. Network 탭에서 음원 파일 로드 상태
3. Supabase SQL Editor에서 데이터 확인:
   ```sql
   SELECT date, hymns, gospel_songs
   FROM devotionals
   WHERE date = '2026-03-03';
   ```
