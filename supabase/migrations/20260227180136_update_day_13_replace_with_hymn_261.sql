/*
  # Update Day 13 (March 2) Hymn
  
  1. Changes
    - Remove existing hymn "찬송가 - 목마른 사슴"
    - Add 찬송가 261장 - 이 세상의 모든 죄를
    - Audio URL: https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-261.mp3
    
  2. Notes
    - Day 13 corresponds to March 2, 2026
    - Audio file hymn-261.mp3 should be uploaded to devotional-audio/hymns/
*/

UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 261장 - 이 세상의 모든 죄를',
  'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-261.mp3'
)
WHERE day_number = 13;
