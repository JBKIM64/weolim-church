/*
  # Add Second Hymn Field to Devotionals

  1. Purpose
    - Allow each day to have two hymns/songs for more variety
    - Add `today_hymn_2` field to store the second hymn
  
  2. Changes
    - Add `today_hymn_2` JSONB column to devotionals table
    - Column is nullable as not all days need a second hymn
  
  3. Schema
    - today_hymn_2: { title: string, audio_url?: string, youtube_url?: string, spotify_embed?: string }
*/

-- Add today_hymn_2 column to store second hymn
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'devotionals' AND column_name = 'today_hymn_2'
  ) THEN
    ALTER TABLE devotionals ADD COLUMN today_hymn_2 jsonb;
  END IF;
END $$;
