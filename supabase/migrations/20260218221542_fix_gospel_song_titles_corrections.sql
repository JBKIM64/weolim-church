/*
  # Fix Gospel Song Title Corrections

  1. Changes
    - Update incorrect gospel song titles to correct ones:
      - "주님만이" → "주님의 마음이 있는 곳"
      - "감사함으로" → "주시는 이도 거두시는 이도"
      - "사랑이 가장 큰 것" → "어둠 속 헤매이던 내 영혼"
      - "십자가를 지고" → "인내"
      - "나의 모든 것" → "하나님 아버지의 마음"
      - "십자가의 길" → "보혈을 지나"
*/

-- Fix "주님만이" to "주님의 마음이 있는 곳"
UPDATE devotionals
SET today_hymn_2 = jsonb_set(
  today_hymn_2,
  '{title}',
  '"복음송 - 주님의 마음이 있는 곳"'
)
WHERE today_hymn_2->>'title' LIKE '%주님만이%';

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{title}',
  '"복음송 - 주님의 마음이 있는 곳"'
)
WHERE today_hymn->>'title' LIKE '%주님만이%';

-- Fix "감사함으로" to "주시는 이도 거두시는 이도"
UPDATE devotionals
SET today_hymn_2 = jsonb_set(
  today_hymn_2,
  '{title}',
  '"복음송 - 주시는 이도 거두시는 이도"'
)
WHERE today_hymn_2->>'title' LIKE '%감사함으로%';

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{title}',
  '"복음송 - 주시는 이도 거두시는 이도"'
)
WHERE today_hymn->>'title' LIKE '%감사함으로%';

-- Fix "사랑이 가장 큰 것" to "어둠 속 헤매이던 내 영혼"
UPDATE devotionals
SET today_hymn_2 = jsonb_set(
  today_hymn_2,
  '{title}',
  '"복음송 - 어둠 속 헤매이던 내 영혼"'
)
WHERE today_hymn_2->>'title' LIKE '%사랑이 가장 큰 것%';

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{title}',
  '"복음송 - 어둠 속 헤매이던 내 영혼"'
)
WHERE today_hymn->>'title' LIKE '%사랑이 가장 큰 것%';

-- Fix "십자가를 지고" to "인내"
UPDATE devotionals
SET today_hymn_2 = jsonb_set(
  today_hymn_2,
  '{title}',
  '"복음송 - 인내"'
)
WHERE today_hymn_2->>'title' LIKE '%십자가를 지고%';

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{title}',
  '"복음송 - 인내"'
)
WHERE today_hymn->>'title' LIKE '%십자가를 지고%';

-- Fix "나의 모든 것" to "하나님 아버지의 마음"
UPDATE devotionals
SET today_hymn_2 = jsonb_set(
  today_hymn_2,
  '{title}',
  '"복음송 - 하나님 아버지의 마음"'
)
WHERE today_hymn_2->>'title' LIKE '%나의 모든 것%';

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{title}',
  '"복음송 - 하나님 아버지의 마음"'
)
WHERE today_hymn->>'title' LIKE '%나의 모든 것%';

-- Fix "십자가의 길" to "보혈을 지나"
UPDATE devotionals
SET today_hymn_2 = jsonb_set(
  today_hymn_2,
  '{title}',
  '"복음송 - 보혈을 지나"'
)
WHERE today_hymn_2->>'title' LIKE '%십자가의 길%';

UPDATE devotionals
SET today_hymn = jsonb_set(
  today_hymn,
  '{title}',
  '"복음송 - 보혈을 지나"'
)
WHERE today_hymn->>'title' LIKE '%십자가의 길%';
