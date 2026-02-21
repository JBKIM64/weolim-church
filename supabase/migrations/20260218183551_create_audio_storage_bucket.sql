/*
  # Create Audio Storage Bucket

  1. Storage Setup
    - Create public 'audio-files' bucket for hymn audio files
    - Enable public access for audio playback
  
  2. Security
    - Allow public read access to audio files
    - Restrict upload/delete to authenticated users only
*/

-- Create the audio-files bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('audio-files', 'audio-files', true)
ON CONFLICT (id) DO NOTHING;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Public can read audio files" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload audio files" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete audio files" ON storage.objects;

-- Allow public access to read audio files
CREATE POLICY "Public can read audio files"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'audio-files');

-- Only authenticated users can upload
CREATE POLICY "Authenticated users can upload audio files"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'audio-files');

-- Only authenticated users can delete
CREATE POLICY "Authenticated users can delete audio files"
ON storage.objects FOR DELETE
TO authenticated
USING (bucket_id = 'audio-files');