# 오디오 파일 업로드 필요

## 문제
데이터베이스에는 오디오 URL이 저장되어 있지만, Supabase Storage에 실제 파일이 업로드되지 않았습니다.

## 해결 방법

### 방법 1: Supabase Dashboard에서 직접 업로드

1. [Supabase Dashboard](https://supabase.com/dashboard) 로그인
2. 프로젝트 선택
3. 왼쪽 메뉴에서 **Storage** 클릭
4. **devotional-audio** 버킷 선택
5. 다음 폴더 구조로 파일 업로드:

```
devotional-audio/
├── hymns/
│   ├── hymn-258.mp3
│   ├── hymn-XXX.mp3
│   └── ...
└── gospel/
    ├── song-03.mp3
    ├── song-08.mp3
    └── ...
```

### 방법 2: AudioUploader 컴포넌트 사용

애플리케이션 내에서 관리자 권한으로 로그인한 후 AudioUploader 컴포넌트를 통해 파일을 업로드할 수 있습니다.

## 필요한 파일 목록

데이터베이스를 확인하여 필요한 모든 오디오 파일 목록을 추출하세요:

```sql
-- 찬송가 목록
SELECT DISTINCT today_hymn->>'audio_url' as url
FROM devotionals
WHERE today_hymn->>'audio_url' IS NOT NULL;

-- 복음성가 목록
SELECT DISTINCT today_gospel_song->>'audio_url' as url
FROM devotionals
WHERE today_gospel_song->>'audio_url' IS NOT NULL;
```

## 파일 형식 요구사항

- **형식**: MP3 (audio/mpeg)
- **권장 품질**: 128-192 kbps
- **파일명**: 영문과 숫자, 하이픈만 사용 (예: `hymn-258.mp3`)

## 확인 방법

파일 업로드 후 브라우저에서 URL에 직접 접근하여 다운로드되는지 확인:

```
https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-258.mp3
```

정상적으로 다운로드되면 애플리케이션에서 재생됩니다.
