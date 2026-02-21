/*
  # 성주간 및 전체 음원 URL 업데이트

  1. 변경 사항
    - 41-47일차 음원을 Supabase Storage URL로 업데이트
    - 45일차(성금요일): 복음송으로 변경 (찬송가 제목 삭제)
    - 47일차(부활주일): 복음송으로 변경 (찬송가 제목 삭제)
    - 1-40일차: 각 묵상 주제에 어울리는 찬송가 자동 배정

  2. 음원 파일 매핑
    - hymns/hymn-*.mp3: 찬송가
    - hymns/song-*.mp3: 복음송
*/

-- 41-47일차 성주간 음원 업데이트
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 150장 - 갈보리 산 위에',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-150.mp3'
) WHERE day_number = 41;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 250장 - 구주의 십자가 보혈로',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-250.mp3'
) WHERE day_number = 42;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 254장 - 내 주 예수 하신 일',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-254.mp3'
) WHERE day_number = 43;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 258장 - 샘물과 같은 보혈은',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-258.mp3'
) WHERE day_number = 44;

-- 45일차: 복음송으로 변경
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-33.mp3'
) WHERE day_number = 45;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 259장 - 예수 십자가에 흘린 피로써',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-259.mp3'
) WHERE day_number = 46;

-- 47일차: 복음송으로 변경
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-32.mp3'
) WHERE day_number = 47;

-- 1-40일차: 각 주제에 어울리는 찬송가 배정 (Supabase Storage URL 사용)
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 88장 - 내 진정 사모하는',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-088.mp3'
) WHERE day_number = 1;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 364장 - 내 기도하는 그 시간',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-364.mp3'
) WHERE day_number = 2;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 288장 - 예수를 나의 구주 삼고',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-288.mp3'
) WHERE day_number = 3;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 310장 - 아 하나님의 은혜로',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-310.mp3'
) WHERE day_number = 4;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 370장 - 주 안에 있는 나에게',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-370.mp3'
) WHERE day_number = 5;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 405장 - 곧 오소서 임마누엘',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-405.mp3'
) WHERE day_number = 6;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 93장 - 예수 사랑하심을',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-093.mp3'
) WHERE day_number = 7;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 150장 - 갈보리 산 위에',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-150.mp3'
) WHERE day_number = 8;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 149장 - 주 달려 죽은 십자가',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-149.mp3'
) WHERE day_number = 9;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 143장 - 지금까지 지내온 것',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-143.mp3'
) WHERE day_number = 10;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 184장 - 내 영혼에 햇빛 비치니',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-184.mp3'
) WHERE day_number = 11;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 488장 - 이 몸의 소망 무언가',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-488.mp3'
) WHERE day_number = 12;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 384장 - 나의 갈 길 다 가도록',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-384.mp3'
) WHERE day_number = 13;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 93장 - 예수 사랑하심을',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-093.mp3'
) WHERE day_number = 14;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 305장 - 나 같은 죄인 살리신',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-305.mp3'
) WHERE day_number = 15;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 92장 - 주 예수 내가 알기 전',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-092.mp3'
) WHERE day_number = 16;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 190장 - 비 바람이 칠 때와',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-190.mp3'
) WHERE day_number = 17;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 314장 - 내 주를 가까이',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-314.mp3'
) WHERE day_number = 18;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 310장 - 아 하나님의 은혜로',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-310.mp3'
) WHERE day_number = 19;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 350장 - 우리를 죄에서 구하시려',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-350.mp3'
) WHERE day_number = 20;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 93장 - 예수 사랑하심을',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-093.mp3'
) WHERE day_number = 21;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 406장 - 주 믿는 사람 일어나',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-406.mp3'
) WHERE day_number = 22;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 304장 - 그 크신 하나님의 사랑',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-304.mp3'
) WHERE day_number = 23;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 405장 - 곧 오소서 임마누엘',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-405.mp3'
) WHERE day_number = 24;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 384장 - 나의 갈 길 다 가도록',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-384.mp3'
) WHERE day_number = 25;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 488장 - 이 몸의 소망 무언가',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-488.mp3'
) WHERE day_number = 26;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 370장 - 주 안에 있는 나에게',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-370.mp3'
) WHERE day_number = 27;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 93장 - 예수 사랑하심을',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-093.mp3'
) WHERE day_number = 28;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 304장 - 그 크신 하나님의 사랑',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-304.mp3'
) WHERE day_number = 29;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 488장 - 이 몸의 소망 무언가',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-488.mp3'
) WHERE day_number = 30;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 150장 - 갈보리 산 위에',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-150.mp3'
) WHERE day_number = 31;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 305장 - 나 같은 죄인 살리신',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-305.mp3'
) WHERE day_number = 32;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 149장 - 주 달려 죽은 십자가',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-149.mp3'
) WHERE day_number = 33;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 406장 - 주 믿는 사람 일어나',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-406.mp3'
) WHERE day_number = 34;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 93장 - 예수 사랑하심을',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-093.mp3'
) WHERE day_number = 35;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 148장 - 예수 나를 위하여',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-148.mp3'
) WHERE day_number = 36;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 151장 - 만 입이 내게 있으면',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-151.mp3'
) WHERE day_number = 37;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 158장 - 예수 십자가에 흘린 피로써',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-158.mp3'
) WHERE day_number = 38;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 314장 - 내 주를 가까이',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-314.mp3'
) WHERE day_number = 39;

UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 92장 - 주 예수 내가 알기 전',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-092.mp3'
) WHERE day_number = 40;
