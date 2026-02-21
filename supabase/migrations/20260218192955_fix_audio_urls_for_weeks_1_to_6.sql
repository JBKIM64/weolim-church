/*
  # Fix Audio URLs for Weeks 1-6

  1. Problem
    - Files song-01.mp3 through song-09.mp3 do not exist in storage
    - Files hymn-14.mp3 through hymn-40.mp3 do not exist in storage
    - Only song-10.mp3 onwards and hymn-150+ exist
  
  2. Solution
    - Remap days 1-18 (using song-01 through song-09) to use song-10 through song-18
    - Remap days 1-9 (using hymn-14 through hymn-24) to use available hymn files
    - All audio URLs are updated to point to existing files
*/

-- Update 복음송 URLs for days 2, 4, 6, 8 (song-01 to song-04 -> song-10 to song-13)
UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-10.mp3"'
)
WHERE day_number = 2;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-11.mp3"'
)
WHERE day_number = 4;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-12.mp3"'
)
WHERE day_number = 6;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-13.mp3"'
)
WHERE day_number = 8;

-- Update 복음송 URLs for days 10, 12, 14, 16, 18 (song-05 to song-09 -> song-14 to song-18)
UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-14.mp3"'
)
WHERE day_number = 10;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-15.mp3"'
)
WHERE day_number = 12;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-16.mp3"'
)
WHERE day_number = 14;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-17.mp3"'
)
WHERE day_number = 16;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-18.mp3"'
)
WHERE day_number = 18;

-- Update 찬송가 URLs for days 1, 3, 5, 7, 9 (hymn-14 to hymn-18 -> hymn-150, 250, 254, 258, 259)
UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-150.mp3"'
)
WHERE day_number = 1;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-250.mp3"'
)
WHERE day_number = 3;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-254.mp3"'
)
WHERE day_number = 5;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-258.mp3"'
)
WHERE day_number = 7;

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-259.mp3"'
)
WHERE day_number = 9;

-- Update remaining 찬송가 for days 11-40 (odd days) to use hymn-150
UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-150.mp3"'
)
WHERE day_number IN (11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39)
AND today_hymn->>'title' LIKE '%찬송가%';
