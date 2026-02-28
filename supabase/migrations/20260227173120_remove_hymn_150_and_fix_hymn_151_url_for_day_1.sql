/*
  # 1일차 찬송가 수정

  1. 변경사항
    - 1일차(2월 18일)에서 찬송가 150장 제거
    - 찬송가 151장 URL을 올바른 URL로 수정
    - today_hymn_2 필드를 null로 설정하여 찬송가 151장을 today_hymn으로 이동
*/

UPDATE devotionals
SET 
  today_hymn = jsonb_build_object(
    'title', '찬송가 151장 - 만왕의 왕 내 주께서',
    'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-151.mp3'
  ),
  today_hymn_2 = NULL
WHERE day_number = 1;
