/*
  # Update Day 17 (March 6) Hymn
  
  1. Changes
    - Remove existing hymn "찬송가 - 주 하나님 지으신"
    - Add 찬송가 267장 - 주의 확실한 약속의 말씀 듣고
    - Audio URL: https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-267.mp3
    
  2. Notes
    - Day 17 corresponds to March 6, 2026
*/

UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 267장 - 주의 확실한 약속의 말씀 듣고',
  'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-267.mp3'
)
WHERE day_number = 17;
