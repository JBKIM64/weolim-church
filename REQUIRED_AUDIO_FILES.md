# 업로드 필요한 오디오 파일 목록

## Supabase Storage 업로드 경로
버킷: `devotional-audio`
폴더: `hymns/`

## 필요한 파일 (총 48개)

### 찬송가 파일
- `hymn-01.mp3` - 죄에서 자유를 얻게 함은
- `hymn-02.mp3` - 주님의 성전에
- `hymn-03.mp3` - 나의 기도
- `hymn-14.mp3` - 내 주를 가까이
- `hymn-16.mp3` - 예수 사랑하심은
- `hymn-17.mp3` - 주의 음성을
- `hymn-18.mp3` - 나의 갈 길
- `hymn-19.mp3` - 거룩 거룩 거룩
- `hymn-20.mp3` - 예수 십자가에 흘린 피로써
- `hymn-21.mp3` - 목마른 사슴
- `hymn-22.mp3` - 주의 친절한 팔에 안기세
- `hymn-23.mp3` - 주 하나님 지으신
- `hymn-24.mp3` - 주님의 마음을 본받는 자
- `hymn-25.mp3` - 주는 나를 기르시는 목자
- `hymn-26.mp3` - 섬기는 자가 되려네
- `hymn-27.mp3` - 평화의 하나님
- `hymn-28.mp3` - 생명의 주님
- `hymn-29.mp3` - 믿음의 사람들
- `hymn-30.mp3` - 주의 일을 하는 일꾼
- `hymn-31.mp3` - 그 날이 오면
- `hymn-150.mp3` - 찬송가 150장: 갈보리 산 위에
- `hymn-250.mp3` - 찬송가 250장: 구주의 십자가 보혈로
- `hymn-254.mp3` - 찬송가 254장: 내 주 예수 하신 일
- `hymn-258.mp3` - 찬송가 258장: 샘물과 같은 보혈은
- `hymn-259.mp3` - 찬송가 259장: 예수 십자가에 흘린 피로써

### 복음성가 파일
- `song-01.mp3` - 주님께 나아가
- `song-02.mp3` - 주의 사랑
- `song-03.mp3` - 나의 힘이 되신 주
- `song-04.mp3` - 주께서 전하라 하신 말씀
- `song-05.mp3` - 믿음으로
- `song-06.mp3` - 주님의 마음
- `song-07.mp3` - 예배합니다
- `song-08.mp3` - 나의 영혼이
- `song-09.mp3` - 주의 시간에
- `song-10.mp3` - 빛이 되신 주
- `song-11.mp3` - 부활의 주님
- `song-12.mp3` - 사랑해요 주님을
- `song-13.mp3` - 주와 함께
- `song-14.mp3` - 주의 나라가 임하시네
- `song-15.mp3` - 주님이 주신 복음
- `song-16.mp3` - 주님의 초대
- `song-17.mp3` - 주님을 따라
- `song-18.mp3` - 호산나
- `song-19.mp3` - 사랑이 가장 큰 것
- `song-20.mp3` - 십자가를 지고
- `song-32.mp3` - 부활의 아침
- `song-33.mp3` - 십자가의 길

## 업로드 방법

### Supabase Dashboard 사용
1. https://supabase.com/dashboard 접속
2. 프로젝트 선택
3. Storage → devotional-audio 버킷 선택
4. hymns 폴더에 모든 파일 업로드

### 파일 형식
- 확장자: `.mp3`
- 권장 품질: 128-192 kbps
- Content-Type: `audio/mpeg`

## 업로드 후 확인
아래 URL로 직접 접근하여 다운로드 테스트:
```
https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-01.mp3
```

정상 다운로드되면 애플리케이션에서 재생 가능합니다.
