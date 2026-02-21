/*
  # Fix Audio Storage Bucket Policies

  1. Changes
    - Update storage policies to use correct bucket name 'devotional-audio'
    - Ensure public read access is properly configured
    - Fix RLS policies for the devotional-audio bucket
  
  2. Security
    - Public can read audio files
    - Only authenticated users can upload/delete
*/

-- Drop old policies if they exist
DROP POLICY IF EXISTS "Public can read audio files" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload audio files" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete audio files" ON storage.objects;

-- Create policies for devotional-audio bucket
CREATE POLICY "Public can read devotional audio files"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'devotional-audio');

CREATE POLICY "Authenticated users can upload devotional audio"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'devotional-audio');

CREATE POLICY "Authenticated users can delete devotional audio"
ON storage.objects FOR DELETE
TO authenticated
USING (bucket_id = 'devotional-audio');

CREATE POLICY "Authenticated users can update devotional audio"
ON storage.objects FOR UPDATE
TO authenticated
USING (bucket_id = 'devotional-audio')
WITH CHECK (bucket_id = 'devotional-audio');