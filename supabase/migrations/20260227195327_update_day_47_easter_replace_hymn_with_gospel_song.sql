/*
  # Update Day 47 (Easter) - Replace Hymn with Gospel Song
  
  1. Changes
    - Remove "찬송가 - 부활의 주님" from today_hymn field
    - Add "복음송 - 부활의 아침" as the gospel song with the provided audio URL
  
  2. Details
    - Day 47 is Easter Sunday (April 5)
    - New gospel song: "복음송 - 부활의 아침"
    - Audio URL: https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-32.mp3
*/

UPDATE devotionals
SET 
  today_hymn = NULL,
  gospel_songs = jsonb_build_array(
    jsonb_build_object(
      'title', '복음송 - 부활의 아침',
      'audio_url', 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-32.mp3'
    )
  )
WHERE day_number = 47;
