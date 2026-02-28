/*
  # Remove Specific Hymns from Today's Hymn Section

  1. Changes
    - Remove first hymn (today_hymn) for specific dates where it matches the requested deletion list
    - Remove second hymn (today_hymn_2) for specific dates where it matches the requested deletion list
    - Sets the hymn fields to NULL for the matching entries

  2. Dates and Hymns to Remove
    - 2월 18일: 찬송가 150장 삭제 (today_hymn)
    - 2월 20일: 찬송가 250장 삭제 (today_hymn)
    - 2월 22일: 찬송가 254장 삭제 (today_hymn)
    - 2월 24일: 찬송가 258장 삭제 (today_hymn)
    - 2월 26일: 찬송가 259장 삭제 (today_hymn)
    - 3월 2일: 찬송가 216장 삭제 (today_hymn_2)
    - 3월 4일: 찬송가 251장 삭제 (today_hymn_2) [실제 DB에는 251장임]
    - 3월 6일: 찬송가 257장 삭제 (today_hymn_2)
    - 3월 8일: 찬송가 261장 삭제 (today_hymn)
    - 3월 11일: 찬송가 151장 삭제 (today_hymn_2)
    - 3월 13일: 찬송가 197장 삭제 (today_hymn_2)
    - 3월 14일: 찬송가 205장 삭제 (today_hymn_2)
    - 3월 15일: 찬송가 212장 삭제 (today_hymn_2)
    - 3월 16일: 찬송가 215장 삭제 (today_hymn_2)
    - 3월 21일: 찬송가 450장 삭제 (today_hymn_2)
    - 3월 23일: 복음송 조용한 새벽 시간 삭제 (today_hymn_2)
    - 3월 26일: 복음송 주시는 이도 거두시는 이도 삭제 (today_hymn_2)
    - 3월 28일: 복음송 치유의 노래 삭제 (today_hymn_2)
*/

-- Remove today_hymn for February dates
UPDATE devotionals 
SET today_hymn = NULL 
WHERE date = '2026-02-18' AND today_hymn->>'title' LIKE '%150장%갈보리 산 위에%';

UPDATE devotionals 
SET today_hymn = NULL 
WHERE date = '2026-02-20' AND today_hymn->>'title' LIKE '%250장%구주의 십자가%';

UPDATE devotionals 
SET today_hymn = NULL 
WHERE date = '2026-02-22' AND today_hymn->>'title' LIKE '%254장%내 주의 보혈은%';

UPDATE devotionals 
SET today_hymn = NULL 
WHERE date = '2026-02-24' AND today_hymn->>'title' LIKE '%258장%샘물과 같은%';

UPDATE devotionals 
SET today_hymn = NULL 
WHERE date = '2026-02-26' AND today_hymn->>'title' LIKE '%259장%예수 십자가에%';

-- Remove today_hymn for March 8th
UPDATE devotionals 
SET today_hymn = NULL 
WHERE date = '2026-03-08' AND today_hymn->>'title' LIKE '%261장%이 세상의 모든 죄를%';

-- Remove today_hymn_2 for March dates (찬송가)
UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-02' AND today_hymn_2->>'title' LIKE '%216장%성자의 귀한 몸%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-04' AND today_hymn_2->>'title' LIKE '%251장%놀랍다%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-06' AND today_hymn_2->>'title' LIKE '%257장%마음에 가득한%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-11' AND today_hymn_2->>'title' LIKE '%151장%만왕의 왕%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-13' AND today_hymn_2->>'title' LIKE '%197장%은혜가 풍성한%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-14' AND today_hymn_2->>'title' LIKE '%205장%주 예수 크신 사랑%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-15' AND today_hymn_2->>'title' LIKE '%212장%겸손히 주를%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-16' AND today_hymn_2->>'title' LIKE '%215장%내 죄 속해%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-21' AND today_hymn_2->>'title' LIKE '%450장%내 평생%';

-- Remove today_hymn_2 for March dates (복음송)
UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-23' AND today_hymn_2->>'title' LIKE '%조용한 새벽 시간%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-26' AND today_hymn_2->>'title' LIKE '%주시는 이도 거두시는 이도%';

UPDATE devotionals 
SET today_hymn_2 = NULL 
WHERE date = '2026-03-28' AND today_hymn_2->>'title' LIKE '%치유의 노래%';