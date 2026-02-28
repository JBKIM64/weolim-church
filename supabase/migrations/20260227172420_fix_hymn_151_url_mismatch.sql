/*
  # Fix Hymn 151 URL Mismatch

  1. Changes
    - Update day 1 hymn URL from hymn-150.mp3 to hymn-151.mp3 to match the title "찬송가 151장"

  2. Security
    - No changes to RLS policies
*/

UPDATE devotionals 
SET hymns = jsonb_set(
  hymns, 
  '{0,audio_url}', 
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-151.mp3"'
) 
WHERE day_number = 1;
