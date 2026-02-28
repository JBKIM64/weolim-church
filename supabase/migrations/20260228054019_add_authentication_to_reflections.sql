/*
  # Add Authentication Support to User Reflections

  1. Changes
    - Add user_id column to user_reflections table to link reflections to authenticated users
    - Update RLS policies to ensure users can only access their own reflections
    - Create indexes for better query performance
  
  2. Security
    - Enable RLS on user_reflections table (already enabled)
    - Update policies so users can only SELECT, INSERT, UPDATE their own data
    - Remove the existing overly permissive policies
*/

-- Add user_id column to link reflections to authenticated users
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'user_reflections' AND column_name = 'user_id'
  ) THEN
    ALTER TABLE user_reflections 
    ADD COLUMN user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE;
  END IF;
END $$;

-- Create index for better query performance
CREATE INDEX IF NOT EXISTS idx_user_reflections_user_id ON user_reflections(user_id);
CREATE INDEX IF NOT EXISTS idx_user_reflections_user_devotional ON user_reflections(user_id, devotional_id);

-- Drop existing overly permissive policies
DROP POLICY IF EXISTS "Anyone can read reflections" ON user_reflections;
DROP POLICY IF EXISTS "Anyone can insert reflections" ON user_reflections;
DROP POLICY IF EXISTS "Anyone can update their own reflections" ON user_reflections;

-- Create secure RLS policies for authenticated users only
CREATE POLICY "Users can read own reflections"
  ON user_reflections
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own reflections"
  ON user_reflections
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own reflections"
  ON user_reflections
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own reflections"
  ON user_reflections
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);