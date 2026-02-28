/*
  # Update Day 11 (February 28) Hymns
  
  1. Changes
    - Remove existing hymn "예수 십자가에 흘린 피로써"
    - Add 찬송가 215장 - 내 죄 속해 주신 주께
    - Add 찬송가 260장 - 우리를 죄에서 구하시려
    - Both hymns will appear in the "오늘의 찬양" section
    
  2. Notes
    - Audio files need to be uploaded to Supabase Storage:
      - hymn-215.mp3
      - hymn-260.mp3
    - Location: devotional-audio/hymns/
*/

UPDATE devotionals
SET today_hymn = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 215장 - 내 죄 속해 주신 주께',
    'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-215.mp3'
  ),
  jsonb_build_object(
    'title', '찬송가 260장 - 우리를 죄에서 구하시려',
    'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-260.mp3'
  )
)
WHERE day_number = 11;
