/*
  # Add Music and Video Fields to Devotionals

  1. Changes
    - Add `hymns` JSONB column to store hymn information (title, youtube_url)
    - Add `gospel_songs` JSONB column to store gospel song information (title, youtube_url)
    - Add `special_video_url` text column for special videos (e.g., Easter Saturday resurrection hope video)
    - Add `special_video_title` text column for video title

  2. Data Structure
    - hymns: Array of objects [{ title: string, youtube_url: string }]
    - gospel_songs: Array of objects [{ title: string, youtube_url: string }]
    - special_video_url: YouTube video URL for special occasions
    - special_video_title: Title/description of the special video

  3. Notes
    - These fields are optional and can be null
    - Holy Week (고난주간) devotionals will have cross and blood-related hymns/songs
    - Easter Saturday will have a resurrection hope video
    - Easter Sunday will have glorious resurrection praise music
*/

DO $$
BEGIN
  -- Add hymns column if it doesn't exist
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'devotionals' AND column_name = 'hymns'
  ) THEN
    ALTER TABLE devotionals ADD COLUMN hymns JSONB DEFAULT '[]'::jsonb;
  END IF;

  -- Add gospel_songs column if it doesn't exist
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'devotionals' AND column_name = 'gospel_songs'
  ) THEN
    ALTER TABLE devotionals ADD COLUMN gospel_songs JSONB DEFAULT '[]'::jsonb;
  END IF;

  -- Add special_video_url column if it doesn't exist
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'devotionals' AND column_name = 'special_video_url'
  ) THEN
    ALTER TABLE devotionals ADD COLUMN special_video_url TEXT;
  END IF;

  -- Add special_video_title column if it doesn't exist
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'devotionals' AND column_name = 'special_video_title'
  ) THEN
    ALTER TABLE devotionals ADD COLUMN special_video_title TEXT;
  END IF;
END $$;