/*
  # Migrate hymns and gospel_songs to today_hymn field

  1. Changes
    - Copy data from hymns field to today_hymn for all days with hymns
    - Copy data from gospel_songs field to today_hymn for all days with gospel songs
    - This ensures the app can read the audio files from the correct field
    
  2. Notes
    - Days with hymns: Use hymns[0] as today_hymn
    - Days with gospel_songs: Use gospel_songs[0] as today_hymn
    - Preserves all existing data in hymns and gospel_songs fields
*/

-- Copy hymns to today_hymn for days that have hymns
UPDATE devotionals
SET today_hymn = hymns->0
WHERE hymns IS NOT NULL 
  AND jsonb_array_length(hymns) > 0;

-- Copy gospel_songs to today_hymn for days that have gospel_songs but no hymns
UPDATE devotionals
SET today_hymn = gospel_songs->0
WHERE gospel_songs IS NOT NULL 
  AND jsonb_array_length(gospel_songs) > 0
  AND (hymns IS NULL OR jsonb_array_length(hymns) = 0);
