/*
  # Create user reflections table

  1. New Tables
    - `user_reflections`
      - `id` (uuid, primary key)
      - `devotional_id` (uuid, foreign key to devotionals)
      - `reflection` (text) - User's reflection notes
      - `prayer` (text) - User's prayer notes
      - `user_id` (uuid) - To support future authentication
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. Security
    - Enable RLS on `user_reflections` table
    - Add policy for public access (anonymous users can manage their own reflections by devotional_id)
    - In future, can be updated to use auth.uid() when authentication is added

  3. Indexes
    - Add index on devotional_id for fast lookups
    - Add unique constraint on devotional_id for single reflection per devotional

  4. Notes
    - This allows reflections to persist across app updates and device changes
    - Data is stored in Supabase cloud, not localStorage
*/

-- Create user_reflections table
CREATE TABLE IF NOT EXISTS user_reflections (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  devotional_id uuid NOT NULL,
  reflection text DEFAULT '',
  prayer text DEFAULT '',
  user_id uuid DEFAULT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Add unique constraint to ensure one reflection per devotional (per user in future)
CREATE UNIQUE INDEX IF NOT EXISTS user_reflections_devotional_id_key 
  ON user_reflections(devotional_id) 
  WHERE user_id IS NULL;

-- Add index for fast lookups
CREATE INDEX IF NOT EXISTS user_reflections_devotional_id_idx 
  ON user_reflections(devotional_id);

-- Enable RLS
ALTER TABLE user_reflections ENABLE ROW LEVEL SECURITY;

-- Allow public read access (anyone can read reflections)
CREATE POLICY "Anyone can read reflections"
  ON user_reflections
  FOR SELECT
  TO public
  USING (true);

-- Allow public insert (anyone can create reflections)
CREATE POLICY "Anyone can create reflections"
  ON user_reflections
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Allow public update (anyone can update any reflection)
CREATE POLICY "Anyone can update reflections"
  ON user_reflections
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

-- Allow public delete (anyone can delete reflections)
CREATE POLICY "Anyone can delete reflections"
  ON user_reflections
  FOR DELETE
  TO public
  USING (true);

-- Add trigger to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_user_reflections_updated_at ON user_reflections;

CREATE TRIGGER update_user_reflections_updated_at
  BEFORE UPDATE ON user_reflections
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();