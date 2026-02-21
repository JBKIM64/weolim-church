/*
  # 복음송 제목 수정 - 주께서 내게 주신 말씀 → 세상의 소리에

  1. 수정 내용
    - "복음송 - 주께서 내게 주신 말씀" → "복음송 - 세상의 소리에"
    - 8일차 찬송에 해당
*/

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 세상의 소리에"')
WHERE today_hymn->>'title' = '복음송 - 주께서 내게 주신 말씀';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 세상의 소리에"')
WHERE today_hymn_2->>'title' = '복음송 - 주께서 내게 주신 말씀';
