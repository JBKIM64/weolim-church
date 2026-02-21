# 음원 파일 업로드 가이드

이 폴더는 사순절 묵상 앱에서 사용할 음원 파일을 저장하는 곳입니다.

## 폴더 구조

```
public/audio/
├── hymns/          # 찬송가 음원 파일
│   ├── hymn-88.mp3
│   ├── hymn-147.mp3
│   └── ...
├── gospel/         # 복음성가 음원 파일
│   ├── song-1.mp3
│   ├── song-2.mp3
│   └── ...
└── README.md       # 이 파일
```

## 음원 파일 업로드 방법

### 1. 음원 파일 준비

- **지원 형식**: MP3, WAV, M4A, OGG
- **권장 설정**:
  - MP3: 128-320kbps
  - 샘플레이트: 44.1kHz 또는 48kHz
  - 모노 또는 스테레오

### 2. 파일 명명 규칙

#### 찬송가:
- `hymn-[번호].mp3` (예: `hymn-88.mp3`, `hymn-147.mp3`)
- 또는 한글명: `찬송가-88장.mp3`

#### 복음성가:
- `gospel-[제목].mp3` (예: `gospel-amazing-grace.mp3`)
- 또는 한글명: `복음성가-놀라운은혜.mp3`

### 3. 파일 업로드

이 폴더에 음원 파일을 직접 복사하거나 이동합니다:

```bash
# 찬송가 업로드 예시
cp ~/Downloads/hymn-88.mp3 public/audio/hymns/

# 복음성가 업로드 예시
cp ~/Downloads/gospel-song.mp3 public/audio/gospel/
```

### 4. 데이터베이스 업데이트

음원 파일을 업로드한 후, Supabase SQL Editor에서 다음과 같이 업데이트:

```sql
-- 찬송가 음원 추가
UPDATE devotionals
SET hymns = jsonb_set(
  hymns,
  '{0,audio_url}',
  '"/audio/hymns/hymn-88.mp3"'
)
WHERE date = '2026-03-03';

-- 복음성가 음원 추가
UPDATE devotionals
SET gospel_songs = jsonb_set(
  gospel_songs,
  '{0,audio_url}',
  '"/audio/gospel/gospel-song-1.mp3"'
)
WHERE date = '2026-03-03';
```

## 경로 규칙

- 모든 경로는 `/audio/`로 시작합니다
- 찬송가: `/audio/hymns/파일명.mp3`
- 복음성가: `/audio/gospel/파일명.mp3`

## 예시 데이터 구조

```json
{
  "hymns": [
    {
      "title": "찬송가 88장 - 내 주 하나님 넓고 큰 은혜",
      "youtube_url": "https://www.youtube.com/watch?v=OVf3oRr_Nag",
      "audio_url": "/audio/hymns/hymn-88.mp3"
    }
  ],
  "gospel_songs": [
    {
      "title": "주의 음성을 내가 들으니",
      "youtube_url": "https://www.youtube.com/watch?v=example",
      "audio_url": "/audio/gospel/gospel-song-1.mp3"
    }
  ]
}
```

## 자동 재생

MusicPlayer 컴포넌트는 다음 순서로 음악을 표시합니다:

1. **audio_url**: 로컬 음원 파일이 있으면 플레이어로 재생
2. **spotify_embed**: Spotify 임베드 URL이 있으면 Spotify 플레이어 표시
3. **youtube_url**: YouTube URL만 있으면 링크로 표시

## 주의사항

### 저작권
- 저작권이 있는 음원은 적절한 권한을 확보해야 합니다
- 교회 내부용으로만 사용하는 경우에도 저작권 확인이 필요합니다

### 파일 크기
- 대용량 파일은 로딩 시간이 길어질 수 있습니다
- 적절한 압축률(128-192kbps)로 인코딩을 권장합니다

### Git 저장소
- 음원 파일은 용량이 크므로 Git에 커밋하지 않는 것을 권장합니다
- `.gitignore`에 `public/audio/*.mp3` 추가를 고려하세요

### 배포
- 호스팅 서비스에 배포할 때 음원 파일도 함께 업로드되어야 합니다
- Vercel, Netlify 등의 무료 플랜은 용량 제한이 있으니 확인하세요

## 트러블슈팅

### 음원이 재생되지 않을 때:

1. **파일 경로 확인**:
   - 브라우저 개발자 도구(F12) → Console 탭에서 404 에러 확인
   - 경로가 `/audio/hymns/...`로 올바른지 확인

2. **파일 형식 확인**:
   - MP3 형식이 가장 호환성이 좋습니다
   - 브라우저에서 지원하는 형식인지 확인

3. **파일 크기 확인**:
   - 너무 큰 파일은 로딩에 시간이 걸립니다
   - 네트워크 탭에서 로딩 상태 확인

4. **데이터베이스 확인**:
   - SQL Editor에서 `SELECT hymns, gospel_songs FROM devotionals` 실행
   - `audio_url` 필드가 올바르게 저장되었는지 확인

## 도움이 필요하신가요?

문제가 발생하면 브라우저 개발자 도구의 Console과 Network 탭을 확인하여 구체적인 에러 메시지를 찾아보세요.
