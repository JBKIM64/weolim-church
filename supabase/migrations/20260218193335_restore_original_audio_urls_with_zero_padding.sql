/*
  # Restore Original Audio URLs with Zero-Padded Filenames

  1. Problem
    - Previous migration incorrectly assumed song-01.mp3 to song-09.mp3 did not exist
    - Files actually exist with zero-padded names (song-01.mp3, song-02.mp3, etc.)
  
  2. Solution
    - Restore original audio URLs for days 2, 4, 6, 8, 10, 12, 14, 16, 18
    - Use correct zero-padded filenames: song-01.mp3 through song-09.mp3
*/

-- Restore 복음송 URLs for days 2, 4, 6, 8 (back to song-01 through song-04)
UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-01.mp3"'
)
WHERE day_number = 2;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-02.mp3"'
)
WHERE day_number = 4;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-03.mp3"'
)
WHERE day_number = 6;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-04.mp3"'
)
WHERE day_number = 8;

-- Restore 복음송 URLs for days 10, 12, 14, 16, 18 (back to song-05 through song-09)
UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-05.mp3"'
)
WHERE day_number = 10;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-06.mp3"'
)
WHERE day_number = 12;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-07.mp3"'
)
WHERE day_number = 14;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-08.mp3"'
)
WHERE day_number = 16;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-09.mp3"'
)
WHERE day_number = 18;
