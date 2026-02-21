/*
  # 복음송 제목 수정 - 주님만이 (김명식) → 주님의 마음이 있는 곳

  1. 수정 내용
    - "복음송 - 주님만이 (김명식)" → "복음송 - 주님의 마음이 있는 곳"
    - 모든 해당 곡 제목을 일괄 변경
*/

-- 주님만이 (김명식) → 주님의 마음이 있는 곳
UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님의 마음이 있는 곳"')
WHERE today_hymn->>'title' = '복음송 - 주님만이 (김명식)';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님의 마음이 있는 곳"')
WHERE today_hymn_2->>'title' = '복음송 - 주님만이 (김명식)';
