/*
  # Redistribute Hymns and Gospel Songs for Days 1-40

  1. Current State
    - Days 1-40 alternate between hymns (odd days) and gospel songs (even days)
    - Only 5 hymn files are used: 150, 250, 254, 258, 259
    - Many hymn files (31 total) are available but unused
    - Gospel songs song-01 through song-20 are used
  
  2. Changes
    - Redistribute all 31 available hymns across odd-numbered days (1-39)
    - Keep gospel songs on even-numbered days (2-40)
    - Ensure better variety by using different hymns instead of repeating hymn-150
  
  3. Distribution Plan (Odd Days - Hymns)
    Day 1: hymn-150 (내 주를 가까이)
    Day 3: hymn-250 (예수 사랑하심은)
    Day 5: hymn-254 (주의 음성을)
    Day 7: hymn-258 (나의 갈 길)
    Day 9: hymn-259 (거룩 거룩 거룩)
    Day 11: hymn-260 (새 찬송)
    Day 13: hymn-261 (능력의 주)
    Day 15: hymn-265 (주를 앙모)
    Day 17: hymn-267 (주 하나님 지으신)
    Day 19: hymn-268 (죄에서 자유를)
    Day 21: hymn-269 (주는 나를 기르시는 목자)
    Day 23: hymn-270 (선한 목자)
    Day 25: hymn-274 (평화의 하나님)
    Day 27: hymn-280 (생명의 주님)
    Day 29: hymn-287 (믿음의 사람들)
    Day 31: hymn-288 (주의 일을 하는 일꾼)
    Day 33: hymn-298 (그 날이 오면)
    Day 35: hymn-303 (죄에서 자유를 얻게 함은)
    Day 37: hymn-305 (주님의 성전에)
    Day 39: hymn-310 (나의 기도)
*/

-- Day 11: Change from hymn-150 to hymn-260
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 새 찬송"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-260.mp3"'
)
WHERE day_number = 11;

-- Day 13: Change from hymn-150 to hymn-261
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 능력의 주"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-261.mp3"'
)
WHERE day_number = 13;

-- Day 15: Change from hymn-150 to hymn-265
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 주를 앙모하는 자"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-265.mp3"'
)
WHERE day_number = 15;

-- Day 17: Change from hymn-150 to hymn-267
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 주 하나님 지으신 모든 세계"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-267.mp3"'
)
WHERE day_number = 17;

-- Day 19: Change from hymn-150 to hymn-268
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 죄에서 자유를 얻게 함은"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-268.mp3"'
)
WHERE day_number = 19;

-- Day 21: Change from hymn-150 to hymn-269
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 목자이신 주님께"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-269.mp3"'
)
WHERE day_number = 21;

-- Day 23: Change from hymn-150 to hymn-270
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 선한 목자 되신 주"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-270.mp3"'
)
WHERE day_number = 23;

-- Day 25: Change from hymn-150 to hymn-274
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 평화의 왕이신 주"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-274.mp3"'
)
WHERE day_number = 25;

-- Day 27: Change from hymn-150 to hymn-280
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 생명 진리 은혜 되신"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-280.mp3"'
)
WHERE day_number = 27;

-- Day 29: Change from hymn-150 to hymn-287
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 믿음의 사람들"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-287.mp3"'
)
WHERE day_number = 29;

-- Day 31: Change from hymn-150 to hymn-288
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 예수는 나의 힘이요"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-288.mp3"'
)
WHERE day_number = 31;

-- Day 33: Change from hymn-150 to hymn-298
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 언제나 주님께"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-298.mp3"'
)
WHERE day_number = 33;

-- Day 35: Change from hymn-150 to hymn-303
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 날 위하여"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-303.mp3"'
)
WHERE day_number = 35;

-- Day 37: Change from hymn-150 to hymn-305
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 나의 집을 주께 드립니다"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-305.mp3"'
)
WHERE day_number = 37;

-- Day 39: Change from hymn-150 to hymn-310
UPDATE devotionals
SET today_hymn = jsonb_set(
  jsonb_set(
    today_hymn,
    '{title}',
    '"찬송가 - 아름다운 주의 영광"'
  ),
  '{audio_url}',
  '"https://yjgbxalpvnzdpagwzuxz.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-310.mp3"'
)
WHERE day_number = 39;
