/*
  # Restore Previously Removed Hymns to Today's Hymn Section

  1. Changes
    - Restore first hymn (today_hymn) for specific dates
    - Restore second hymn (today_hymn_2) for specific dates
    - Sets the hymn fields back to their original values

  2. Dates and Hymns to Restore
    - 2월 18일: 찬송가 150장 복원 (today_hymn)
    - 2월 20일: 찬송가 250장 복원 (today_hymn)
    - 2월 22일: 찬송가 254장 복원 (today_hymn)
    - 2월 24일: 찬송가 258장 복원 (today_hymn)
    - 2월 26일: 찬송가 259장 복원 (today_hymn)
    - 3월 2일: 찬송가 216장 복원 (today_hymn_2)
    - 3월 4일: 찬송가 215장 복원 (today_hymn_2)
    - 3월 6일: 찬송가 257장 복원 (today_hymn_2)
    - 3월 8일: 찬송가 261장 복원 (today_hymn)
    - 3월 11일: 찬송가 151장 복원 (today_hymn_2)
    - 3월 13일: 찬송가 197장 복원 (today_hymn_2)
    - 3월 14일: 찬송가 205장 복원 (today_hymn_2)
    - 3월 15일: 찬송가 212장 복원 (today_hymn_2)
    - 3월 16일: 찬송가 215장 복원 (today_hymn_2)
    - 3월 21일: 찬송가 450장 복원 (today_hymn_2)
    - 3월 23일: 복음송 조용한 새벽 시간 복원 (today_hymn_2)
    - 3월 26일: 복음송 주시는 이도 거두시는 이도 복원 (today_hymn_2)
    - 3월 28일: 복음송 치유의 노래 복원 (today_hymn_2)
*/

-- Restore today_hymn for February dates
UPDATE devotionals 
SET today_hymn = jsonb_build_object('title', '찬송가 150장 - 갈보리 산 위에')
WHERE date = '2026-02-18';

UPDATE devotionals 
SET today_hymn = jsonb_build_object('title', '찬송가 250장 - 구주의 십자가 보혈로')
WHERE date = '2026-02-20';

UPDATE devotionals 
SET today_hymn = jsonb_build_object('title', '찬송가 254장 - 내 주의 보혈은')
WHERE date = '2026-02-22';

UPDATE devotionals 
SET today_hymn = jsonb_build_object('title', '찬송가 258장 - 샘물과 같은 보혈은')
WHERE date = '2026-02-24';

UPDATE devotionals 
SET today_hymn = jsonb_build_object('title', '찬송가 259장 - 예수 십자가에 흘린 피로써')
WHERE date = '2026-02-26';

-- Restore today_hymn for March 8th
UPDATE devotionals 
SET today_hymn = jsonb_build_object('title', '찬송가 261장 - 이 세상의 모든 죄를')
WHERE date = '2026-03-08';

-- Restore today_hymn_2 for March dates (찬송가)
UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 216장 - 성자의 귀한 몸')
WHERE date = '2026-03-02';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 215장 - 놀랍다 주님의')
WHERE date = '2026-03-04';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 257장 - 마음에 가득한 의심을')
WHERE date = '2026-03-06';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 151장 - 만왕의 왕 내 주께서')
WHERE date = '2026-03-11';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 197장 - 은혜가 풍성한 하나님은')
WHERE date = '2026-03-13';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 205장 - 주 예수 크신 사랑')
WHERE date = '2026-03-14';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 212장 - 겸손히 주를 섬길 때')
WHERE date = '2026-03-15';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 215장 - 내 죄 속해 주신 주께')
WHERE date = '2026-03-16';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 450장 - 내 평생 소원 이것뿐')
WHERE date = '2026-03-21';

-- Restore today_hymn_2 for March dates (복음송)
UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '복음송 - 조용한 새벽 시간')
WHERE date = '2026-03-23';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '복음송 - 주시는 이도 거두시는 이도')
WHERE date = '2026-03-26';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '복음송 - 치유의 노래')
WHERE date = '2026-03-28';