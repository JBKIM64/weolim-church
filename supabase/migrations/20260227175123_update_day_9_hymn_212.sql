/*
  # Update Day 9 with Hymn 212
  
  1. Changes
    - Update day 9 (February 26) devotional
    - Set today_hymn to 찬송가 212장 - 겸손히 주를 섬길 때
    - Audio URL points to hymn-212.mp3 in Supabase Storage
    
  2. Notes
    - The audio file hymn-212.mp3 needs to be uploaded to:
      Supabase Storage bucket: devotional-audio/hymns/
    - Until the file is uploaded, the audio will show an error
*/

UPDATE devotionals
SET today_hymn = jsonb_build_object(
  'title', '찬송가 212장 - 겸손히 주를 섬길 때',
  'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-212.mp3'
)
WHERE day_number = 9;
