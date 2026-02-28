/*
  # Update Day 15 (March 4) Hymn
  
  1. Changes
    - Remove existing hymn "찬송가 - 주의 친절한 팔에 안기세"
    - Add 찬송가 265장 - 주 십자가를 지심으로
    - Audio URL: https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-265.mp3
    
  2. Notes
    - Day 15 corresponds to March 4, 2026
*/

UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 265장 - 주 십자가를 지심으로',
  'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-265.mp3'
)
WHERE day_number = 15;
