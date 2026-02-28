/*
  # Connect Audio Files from Supabase Storage to Devotionals

  1. Changes
    - Updates all 47 days of devotionals with hymns and gospel songs
    - Uses correct Supabase Storage URLs (project: yjgbxalpvnzdpagwzuxz)
    - File naming convention: hymn-XX.mp3 (hymns), song-XX.mp3 (gospel songs)
    - Alternates between hymns and gospel songs for variety
    
  2. Storage Location
    - Bucket: devotional-audio
    - Hymns folder: /hymns/
    - All files (hymns + gospel songs) are in the same hymns folder
    - Hymns: hymn-01.mp3 to hymn-31.mp3
    - Gospel songs: song-01.mp3 to song-20.mp3
    
  3. Distribution
    - Days 1-40: Alternating hymns and gospel songs
    - Days 41-47 (Holy Week): Special selections
*/

-- Base URL for all audio files
DO $$
DECLARE
  base_url TEXT := 'https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/';
BEGIN

-- Days 1-40: Alternating pattern
-- Day 1: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 내 주를 가까이',
    'audio_url', base_url || 'hymn-14.mp3'
  )
) WHERE day_number = 1;

-- Day 2: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주님께 나아가',
    'audio_url', base_url || 'song-01.mp3'
  )
) WHERE day_number = 2;

-- Day 3: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 예수 사랑하심은',
    'audio_url', base_url || 'hymn-16.mp3'
  )
) WHERE day_number = 3;

-- Day 4: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주의 사랑',
    'audio_url', base_url || 'song-02.mp3'
  )
) WHERE day_number = 4;

-- Day 5: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주의 음성을',
    'audio_url', base_url || 'hymn-17.mp3'
  )
) WHERE day_number = 5;

-- Day 6: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 나의 힘이 되신 주',
    'audio_url', base_url || 'song-03.mp3'
  )
) WHERE day_number = 6;

-- Day 7: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 나의 갈 길',
    'audio_url', base_url || 'hymn-18.mp3'
  )
) WHERE day_number = 7;

-- Day 8: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주께서 전하라 하신 말씀',
    'audio_url', base_url || 'song-04.mp3'
  )
) WHERE day_number = 8;

-- Day 9: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 거룩 거룩 거룩',
    'audio_url', base_url || 'hymn-19.mp3'
  )
) WHERE day_number = 9;

-- Day 10: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 믿음으로',
    'audio_url', base_url || 'song-05.mp3'
  )
) WHERE day_number = 10;

-- Day 11: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 예수 십자가에 흘린 피로써',
    'audio_url', base_url || 'hymn-20.mp3'
  )
) WHERE day_number = 11;

-- Day 12: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주님의 마음',
    'audio_url', base_url || 'song-06.mp3'
  )
) WHERE day_number = 12;

-- Day 13: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 목마른 사슴',
    'audio_url', base_url || 'hymn-21.mp3'
  )
) WHERE day_number = 13;

-- Day 14: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 예배합니다',
    'audio_url', base_url || 'song-07.mp3'
  )
) WHERE day_number = 14;

-- Day 15: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주의 친절한 팔에 안기세',
    'audio_url', base_url || 'hymn-22.mp3'
  )
) WHERE day_number = 15;

-- Day 16: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 나의 영혼이',
    'audio_url', base_url || 'song-08.mp3'
  )
) WHERE day_number = 16;

-- Day 17: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주 하나님 지으신',
    'audio_url', base_url || 'hymn-23.mp3'
  )
) WHERE day_number = 17;

-- Day 18: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주의 시간에',
    'audio_url', base_url || 'song-09.mp3'
  )
) WHERE day_number = 18;

-- Day 19: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주님의 마음을 본받는 자',
    'audio_url', base_url || 'hymn-24.mp3'
  )
) WHERE day_number = 19;

-- Day 20: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 빛이 되신 주',
    'audio_url', base_url || 'song-10.mp3'
  )
) WHERE day_number = 20;

-- Day 21: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주는 나를 기르시는 목자',
    'audio_url', base_url || 'hymn-25.mp3'
  )
) WHERE day_number = 21;

-- Day 22: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 부활의 주님',
    'audio_url', base_url || 'song-11.mp3'
  )
) WHERE day_number = 22;

-- Day 23: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 섬기는 자가 되려네',
    'audio_url', base_url || 'hymn-26.mp3'
  )
) WHERE day_number = 23;

-- Day 24: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 사랑해요 주님을',
    'audio_url', base_url || 'song-12.mp3'
  )
) WHERE day_number = 24;

-- Day 25: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 평화의 하나님',
    'audio_url', base_url || 'hymn-27.mp3'
  )
) WHERE day_number = 25;

-- Day 26: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주와 함께',
    'audio_url', base_url || 'song-13.mp3'
  )
) WHERE day_number = 26;

-- Day 27: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 생명의 주님',
    'audio_url', base_url || 'hymn-28.mp3'
  )
) WHERE day_number = 27;

-- Day 28: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주의 나라가 임하시네',
    'audio_url', base_url || 'song-14.mp3'
  )
) WHERE day_number = 28;

-- Day 29: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 믿음의 사람들',
    'audio_url', base_url || 'hymn-29.mp3'
  )
) WHERE day_number = 29;

-- Day 30: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주님이 주신 복음',
    'audio_url', base_url || 'song-15.mp3'
  )
) WHERE day_number = 30;

-- Day 31: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주의 일을 하는 일꾼',
    'audio_url', base_url || 'hymn-30.mp3'
  )
) WHERE day_number = 31;

-- Day 32: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주님의 초대',
    'audio_url', base_url || 'song-16.mp3'
  )
) WHERE day_number = 32;

-- Day 33: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 그 날이 오면',
    'audio_url', base_url || 'hymn-31.mp3'
  )
) WHERE day_number = 33;

-- Day 34: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 주님을 따라',
    'audio_url', base_url || 'song-17.mp3'
  )
) WHERE day_number = 34;

-- Day 35: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 죄에서 자유를 얻게 함은',
    'audio_url', base_url || 'hymn-01.mp3'
  )
) WHERE day_number = 35;

-- Day 36: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 호산나',
    'audio_url', base_url || 'song-18.mp3'
  )
) WHERE day_number = 36;

-- Day 37: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주님의 성전에',
    'audio_url', base_url || 'hymn-02.mp3'
  )
) WHERE day_number = 37;

-- Day 38: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 사랑이 가장 큰 것',
    'audio_url', base_url || 'song-19.mp3'
  )
) WHERE day_number = 38;

-- Day 39: Hymn
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 나의 기도',
    'audio_url', base_url || 'hymn-03.mp3'
  )
) WHERE day_number = 39;

-- Day 40: Gospel Song
UPDATE devotionals SET gospel_songs = jsonb_build_array(
  jsonb_build_object(
    'title', '복음송 - 십자가를 지고',
    'audio_url', base_url || 'song-20.mp3'
  )
) WHERE day_number = 40;

-- Holy Week (Days 41-47): Special selections
-- Day 41: Monday
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 십자가',
    'audio_url', base_url || 'hymn-04.mp3'
  )
) WHERE day_number = 41;

-- Day 42: Tuesday
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 예수님의 사랑',
    'audio_url', base_url || 'hymn-05.mp3'
  )
) WHERE day_number = 42;

-- Day 43: Wednesday
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 주님의 고난',
    'audio_url', base_url || 'hymn-06.mp3'
  )
) WHERE day_number = 43;

-- Day 44: Maundy Thursday
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 최후의 만찬',
    'audio_url', base_url || 'hymn-07.mp3'
  )
) WHERE day_number = 44;

-- Day 45: Good Friday
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 십자가에 달리신 주',
    'audio_url', base_url || 'hymn-08.mp3'
  )
) WHERE day_number = 45;

-- Day 46: Holy Saturday
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 무덤에 계신 주',
    'audio_url', base_url || 'hymn-09.mp3'
  )
) WHERE day_number = 46;

-- Day 47: Easter Sunday
UPDATE devotionals SET hymns = jsonb_build_array(
  jsonb_build_object(
    'title', '찬송가 - 부활의 주님',
    'audio_url', base_url || 'hymn-10.mp3'
  )
) WHERE day_number = 47;

END $$;