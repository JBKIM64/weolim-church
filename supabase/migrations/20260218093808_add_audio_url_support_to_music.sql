/*
  # Add Audio URL Support to Music Fields

  1. Changes
    - Add `audio_url` field to hymns JSONB structure for direct audio file links
    - Add `spotify_embed` field to hymns JSONB structure for Spotify player embeds
    - Add `audio_url` field to gospel_songs JSONB structure for direct audio file links
    - Add `spotify_embed` field to gospel_songs JSONB structure for Spotify player embeds
    - Keep existing `youtube_url` field for backward compatibility

  2. Data Structure
    - Each music item can now have:
      - `title`: string (required)
      - `audio_url`: string (optional) - Direct link to MP3/audio file
      - `youtube_url`: string (optional) - YouTube link (kept for compatibility)
      - `spotify_embed`: string (optional) - Spotify embed URL
    - Priority order: audio_url > spotify_embed > youtube_url

  3. Notes
    - Existing data structure remains compatible
    - New fields provide more flexible audio playback options
    - Audio URLs will be prioritized for playback
    - Spotify embeds provide streaming service integration
*/

-- This migration adds documentation for the new audio_url and spotify_embed fields
-- The JSONB structure allows flexible schema without altering the column type
-- Example structure:
-- {
--   "title": "찬송가 246장",
--   "audio_url": "/audio/hymn-246.mp3",
--   "youtube_url": "https://youtube.com/...",
--   "spotify_embed": "https://open.spotify.com/embed/..."
-- }

COMMENT ON COLUMN devotionals.hymns IS 'Array of hymn objects with title, audio_url (optional), youtube_url (optional), and spotify_embed (optional)';
COMMENT ON COLUMN devotionals.gospel_songs IS 'Array of gospel song objects with title, audio_url (optional), youtube_url (optional), and spotify_embed (optional)';
