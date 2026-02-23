/*
  # 복음송 제목 일괄 수정 - Part 1

  1. 수정 내용
    - 14일차: "주 이름 높이세" → "다시 밤이 없겠고"
    - 14일차 & 39일차: "주의 길을 걷게 하소서" → "치유의 노래"
    - 16일차: "나의 영혼이" → "모든 능력과 모든 권세"
    - 16일차: "나의 모든 것 (위너스워십)" → "하나님 아버지의 마음"
    - 18일차: "주의 시간에" → "무너짐 가운데서"
    - 18일차: "하나님의 사랑" → "우리는 하나님의 자녀"
    - 20일차: "빛이 되신 주" → "작은 내 삶을 드립니다"
    - 20일차: "주의 은혜" → "혼자 걷지 않을 거예요"
*/

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 다시 밤이 없겠고"')
WHERE day_number = 14 AND today_hymn->>'title' = '복음송 - 주 이름 높이세';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 치유의 노래"')
WHERE day_number = 14 AND today_hymn_2->>'title' = '복음송 - 주의 길을 걷게 하소서';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 치유의 노래"')
WHERE day_number = 39 AND today_hymn_2->>'title' = '복음송 - 주의 길을 걷게 하소서';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 모든 능력과 모든 권세"')
WHERE day_number = 16 AND today_hymn->>'title' = '복음송 - 나의 영혼이';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 하나님 아버지의 마음"')
WHERE day_number = 16 AND today_hymn_2->>'title' = '복음송 - 나의 모든 것 (위너스워십)';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 무너짐 가운데서"')
WHERE day_number = 18 AND today_hymn->>'title' = '복음송 - 주의 시간에';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 우리는 하나님의 자녀"')
WHERE day_number = 18 AND today_hymn_2->>'title' = '복음송 - 하나님의 사랑';

UPDATE devotionals 
SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 작은 내 삶을 드립니다"')
WHERE day_number = 20 AND today_hymn->>'title' = '복음송 - 빛이 되신 주';

UPDATE devotionals 
SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 혼자 걷지 않을 거예요"')
WHERE day_number = 20 AND today_hymn_2->>'title' = '복음송 - 주의 은혜';
