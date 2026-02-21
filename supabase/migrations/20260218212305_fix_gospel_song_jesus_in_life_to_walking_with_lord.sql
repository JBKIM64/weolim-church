/*
  # 복음송 제목 수정 - 예수 안에 생명 → 주님 손잡고 걸으리

  1. 수정 내용
    - "복음송 - 예수 안에 생명" → "복음송 - 주님 손잡고 걸으리"
    - 모든 해당 곡 제목을 일괄 변경
*/

-- 예수 안에 생명 → 주님 손잡고 걸으리
UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님 손잡고 걸으리"')
WHERE today_hymn->>'title' = '복음송 - 예수 안에 생명';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님 손잡고 걸으리"')
WHERE today_hymn_2->>'title' = '복음송 - 예수 안에 생명';
