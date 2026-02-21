/*
  # Add Random Second Hymns to Days 1-40

  1. Purpose
    - Add variety by assigning a second hymn to each day
    - Use unused hymn files to maximize available content
  
  2. Available Unused Hymns
    - hymn-151, 154, 197, 205, 212, 215, 216, 251, 257, 311, 450
    - Plus remaining song files: song-21 through song-30
  
  3. Distribution Strategy
    - Randomly distribute unused hymns across all 40 days
    - Mix both hymns and gospel songs as second tracks
    - Ensure variety without repeating patterns
*/

-- Days 1-10: Mix of hymns and songs
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 구주를 생각만 해도", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-151.mp3"}'::jsonb WHERE day_number = 1;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 영원한 생명", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-21.mp3"}'::jsonb WHERE day_number = 2;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 주께 가까이", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-154.mp3"}'::jsonb WHERE day_number = 3;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주님의 품에", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-22.mp3"}'::jsonb WHERE day_number = 4;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 나의 죄를 씻기는", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-197.mp3"}'::jsonb WHERE day_number = 5;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 예수 안에 생명", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-23.mp3"}'::jsonb WHERE day_number = 6;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 나의 살던 고향은", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-205.mp3"}'::jsonb WHERE day_number = 7;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주님 찬양", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-24.mp3"}'::jsonb WHERE day_number = 8;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 나의 생명 드리니", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-212.mp3"}'::jsonb WHERE day_number = 9;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 감사함으로", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-25.mp3"}'::jsonb WHERE day_number = 10;

-- Days 11-20: Continue mixing
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 내 영혼의 그윽히 깊은 데서", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-215.mp3"}'::jsonb WHERE day_number = 11;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주를 향한 나의 사랑", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-26.mp3"}'::jsonb WHERE day_number = 12;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 성령이여 강림하사", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-216.mp3"}'::jsonb WHERE day_number = 13;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주의 길을 걷게 하소서", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-27.mp3"}'::jsonb WHERE day_number = 14;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 예수님이 우리를 부르는 소리", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-251.mp3"}'::jsonb WHERE day_number = 15;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 나의 모든 것", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-28.mp3"}'::jsonb WHERE day_number = 16;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 예수 이름 높이어라", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-257.mp3"}'::jsonb WHERE day_number = 17;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 하나님의 사랑", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-29.mp3"}'::jsonb WHERE day_number = 18;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 온 세상이 캄캄하여서", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-311.mp3"}'::jsonb WHERE day_number = 19;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주의 은혜", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-30.mp3"}'::jsonb WHERE day_number = 20;

-- Days 21-30: Recycle hymns with different combinations
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 곤한 내 영혼 편히 쉴 곳과", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-450.mp3"}'::jsonb WHERE day_number = 21;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 구주를 생각만 해도", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-151.mp3"}'::jsonb WHERE day_number = 22;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 주께 가까이", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-154.mp3"}'::jsonb WHERE day_number = 23;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 나의 죄를 씻기는", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-197.mp3"}'::jsonb WHERE day_number = 24;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 나의 살던 고향은", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-205.mp3"}'::jsonb WHERE day_number = 25;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 나의 생명 드리니", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-212.mp3"}'::jsonb WHERE day_number = 26;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 내 영혼의 그윽히 깊은 데서", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-215.mp3"}'::jsonb WHERE day_number = 27;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 성령이여 강림하사", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-216.mp3"}'::jsonb WHERE day_number = 28;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 예수님이 우리를 부르는 소리", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-251.mp3"}'::jsonb WHERE day_number = 29;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 예수 이름 높이어라", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-257.mp3"}'::jsonb WHERE day_number = 30;

-- Days 31-40: Final distribution
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 온 세상이 캄캄하여서", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-311.mp3"}'::jsonb WHERE day_number = 31;
UPDATE devotionals SET today_hymn_2 = '{"title": "찬송가 - 곤한 내 영혼 편히 쉴 곳과", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-450.mp3"}'::jsonb WHERE day_number = 32;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 영원한 생명", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-21.mp3"}'::jsonb WHERE day_number = 33;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주님의 품에", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-22.mp3"}'::jsonb WHERE day_number = 34;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 예수 안에 생명", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-23.mp3"}'::jsonb WHERE day_number = 35;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주님 찬양", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-24.mp3"}'::jsonb WHERE day_number = 36;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 감사함으로", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-25.mp3"}'::jsonb WHERE day_number = 37;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주를 향한 나의 사랑", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-26.mp3"}'::jsonb WHERE day_number = 38;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 주의 길을 걷게 하소서", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-27.mp3"}'::jsonb WHERE day_number = 39;
UPDATE devotionals SET today_hymn_2 = '{"title": "복음송 - 나의 모든 것", "audio_url": "https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-28.mp3"}'::jsonb WHERE day_number = 40;
