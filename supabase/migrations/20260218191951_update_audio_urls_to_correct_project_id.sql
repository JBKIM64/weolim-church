/*
  # Update Audio URLs to Correct Supabase Project ID

  1. Changes
    - Replace all audio URLs from old project (nylvruiqkbdfsflzqibp)
    - Update to correct project ID (yjgbxalpvnzdpagwzuxz)
    - Affects today_hymn->>'audio_url' in all devotionals
  
  2. Tables Modified
    - `devotionals`: Update audio_url in today_hymn JSONB field
*/

-- Update all audio URLs in today_hymn field
UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{audio_url}',
  to_jsonb(replace(
    today_hymn->>'audio_url',
    'https://nylvruiqkbdfsflzqibp.supabase.co',
    'https://yjgbxalpvnzdpagwzuxz.supabase.co'
  ))
)
WHERE today_hymn->>'audio_url' LIKE '%nylvruiqkbdfsflzqibp%';