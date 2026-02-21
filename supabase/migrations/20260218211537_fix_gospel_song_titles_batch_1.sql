/*
  # 복음송 제목 1차 수정

  1. 지정된 복음송 제목 수정
    - 주님께 나아가 (소리엘) → 겸손의 왕 (천관웅)
    - 영원한 생명 (마커스) → 주가 일하시네 (이혁진)
    - 주의 사랑 (김진) → 광야에서 (강명식)
    - 주님의 품에 (박종호) → 조용한 새벽 시간
*/

-- 겸손의 왕 (천관웅)
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 겸손의 왕 (천관웅)"')
WHERE today_hymn->>'title' = '복음송 - 주님께 나아가 (소리엘)';

-- 주가 일하시네 (이혁진)
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주가 일하시네 (이혁진)"')
WHERE today_hymn_2->>'title' = '복음송 - 영원한 생명 (마커스)';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주가 일하시네 (이혁진)"')
WHERE today_hymn_2->>'title' = '복음송 - 영원한 생명 (마커스)';

-- 광야에서 (강명식)
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 광야에서 (강명식)"')
WHERE today_hymn->>'title' = '복음송 - 주의 사랑 (김진)';

-- 조용한 새벽 시간
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 조용한 새벽 시간"')
WHERE today_hymn_2->>'title' = '복음송 - 주님의 품에 (박종호)';
