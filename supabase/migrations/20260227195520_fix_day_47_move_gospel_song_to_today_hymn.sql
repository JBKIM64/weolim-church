/*
  # Fix Day 47 (Easter) - Move Gospel Song to Today's Hymn Section
  
  1. Changes
    - Move "복음송 - 부활의 아침" from gospel_songs to today_hymn field
    - This ensures the song appears in the "오늘의 찬양" section
  
  2. Details
    - Day 47 is Easter Sunday (April 5)
    - Gospel song: "복음송 - 부활의 아침"
    - Audio URL: https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-32.mp3
*/

UPDATE devotionals
SET 
  today_hymn = jsonb_build_object(
    'title', '복음송 - 부활의 아침',
    'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-32.mp3'
  ),
  gospel_songs = '[]'::jsonb
WHERE day_number = 47;
