/*
  # 45일차, 47일차 복음송 제목 추가

  1. 변경 사항
    - 45일차 (성금요일): 복음송 제목 추가
    - 47일차 (부활주일): 복음송 제목 추가
*/

-- 45일차: 복음송 제목 추가
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 십자가의 길',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-33.mp3'
) WHERE day_number = 45;

-- 47일차: 복음송 제목 추가
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 부활의 아침',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-32.mp3'
) WHERE day_number = 47;
