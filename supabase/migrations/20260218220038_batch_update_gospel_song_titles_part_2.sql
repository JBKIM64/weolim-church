/*
  # 복음송 제목 일괄 수정 - Part 2

  1. 수정 내용
    - 22일차: "부활의 주" → "세상의 빛"
    - 24일차: "사랑해요 주님을" → "십자가 그 사랑"
    - 26일차: "주와 함께" → "십자가 전달자"
    - 28일차: "주의 나라가 임하시네" → "어둔 날 다 지나고"
    - 30일차: "주님이 주신 복음" → "예배합니다"
    - 34일차: "주님을 따라" → "주님 것을 내 것이라"
    - 6일차 & 35일차: "주님 손잡고 걸으리" → "주님의 때에"
    - 36일차: "호산나" → "우리 죄 위해 죽으신 주"
*/

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 세상의 빛"')
WHERE day_number = 22 AND today_hymn->>'title' = '복음송 - 부활의 주';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 십자가 그 사랑"')
WHERE day_number = 24 AND today_hymn->>'title' = '복음송 - 사랑해요 주님을';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 십자가 전달자"')
WHERE day_number = 26 AND today_hymn->>'title' = '복음송 - 주와 함께';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 어둔 날 다 지나고"')
WHERE day_number = 28 AND today_hymn->>'title' = '복음송 - 주의 나라가 임하시네';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 예배합니다"')
WHERE day_number = 30 AND today_hymn->>'title' = '복음송 - 주님이 주신 복음';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님 것을 내 것이라"')
WHERE day_number = 34 AND today_hymn->>'title' = '복음송 - 주님을 따라';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님의 때에"')
WHERE day_number = 6 AND today_hymn_2->>'title' = '복음송 - 주님 손잡고 걸으리';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님의 때에"')
WHERE day_number = 35 AND today_hymn_2->>'title' = '복음송 - 주님 손잡고 걸으리';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 우리 죄 위해 죽으신 주"')
WHERE day_number = 36 AND today_hymn->>'title' = '복음송 - 호산나';
