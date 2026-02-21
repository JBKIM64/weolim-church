/*
  # Add Today's Hymn Section to Devotionals

  1. Changes
    - Add `today_hymn` column to store a single hymn/gospel song for the "오늘의 찬양" (Today's Hymn) section
    - This will be displayed after the prayer topics section
    - For Holy Week devotionals, this should contain a blood hymn (보혈찬송) or gospel song
    - For Easter Sunday, this should contain song-32 from the gospels folder
  
  2. Structure
    - `today_hymn` (jsonb) - Stores title and audio_url
      Example: {"title": "찬송가 88장", "audio_url": "https://..."}
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'devotionals' AND column_name = 'today_hymn'
  ) THEN
    ALTER TABLE devotionals ADD COLUMN today_hymn jsonb DEFAULT NULL;
  END IF;
END $$;