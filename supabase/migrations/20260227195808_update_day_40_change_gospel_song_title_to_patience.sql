/*
  # Update Day 40 (March 29) - Change Gospel Song Title
  
  1. Changes
    - Update today_hymn title from "복음송 - 십자가를 지고" to "복음송 - 인내"
    - Keep the same audio URL
  
  2. Details
    - Day 40: March 29, 2026
    - Audio URL remains: song-20.mp3
*/

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{title}',
  '"복음송 - 인내"'
)
WHERE day_number = 40;
