/*
  # Restore Remaining Second Hymns

  1. Changes
    - Restore missing second hymns (today_hymn_2) for February dates
    - Restore missing second hymns (today_hymn_2) for March 8th
    - Complete the restoration process

  2. Dates and Hymns to Restore
    - 2월 18일: 찬송가 151장 복원 (today_hymn_2)
    - 2월 20일: 찬송가 154장 복원 (today_hymn_2)
    - 2월 22일: 찬송가 197장 복원 (today_hymn_2)
    - 2월 24일: 찬송가 205장 복원 (today_hymn_2)
    - 2월 26일: 찬송가 212장 복원 (today_hymn_2)
    - 3월 8일: 찬송가 311장 복원 (today_hymn_2)
*/

-- Restore today_hymn_2 for February dates
UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 151장 - 만왕의 왕 내 주께서')
WHERE date = '2026-02-18';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 154장 - 생명의 주여 면류관')
WHERE date = '2026-02-20';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 197장 - 은혜가 풍성한 하나님은')
WHERE date = '2026-02-22';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 205장 - 주 예수 크신 사랑')
WHERE date = '2026-02-24';

UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 212장 - 겸손히 주를 섬길 때')
WHERE date = '2026-02-26';

-- Restore today_hymn_2 for March 8th
UPDATE devotionals 
SET today_hymn_2 = jsonb_build_object('title', '찬송가 311장 - 내 너를 위하여')
WHERE date = '2026-03-08';