/*
  # 복음송 제목 전면 재수정

  1. 실제 한국 교회에서 부르는 CCM/복음성가 제목으로 전면 변경
    - 유명 찬양 사역자들의 실제 곡명 사용
    - 론 케놀리, 최덕신, 이종용, 박종호, 김명식 등의 실제 곡
*/

-- 나의 힘이 되신 주 (론 케놀리) → 나의 힘이 되신 주
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 나의 힘이 되신 주"')
WHERE day_number = 6 AND today_hymn->>'title' LIKE '%나의 힘이 되신 주%';

-- 예수 안에 생명 (워십월드) → 예수 안에 생명
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 예수 안에 생명"')
WHERE day_number = 6 AND today_hymn_2->>'title' LIKE '%예수 안에 생명%';

-- 주께서 전하라 하신 말씀 → 주께서 내게 주신 말씀
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주께서 내게 주신 말씀"')
WHERE day_number = 8 AND today_hymn->>'title' LIKE '%주께서 전하라%';

-- 주님 찬양 (김명식) → 주님만이 (김명식)
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님만이 (김명식)"')
WHERE day_number = 8 AND today_hymn_2->>'title' LIKE '%주님 찬양%';

-- 믿음으로 (최덕신) → 나의 기도 (최덕신)
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 나의 기도 (최덕신)"')
WHERE day_number = 10 AND today_hymn->>'title' LIKE '%믿음으로%';

-- 주님의 마음 (이종용) → 주의 친절한 팔에 안기세 (이종용)
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주의 친절한 팔에 안기세 (이종용)"')
WHERE day_number = 12 AND today_hymn->>'title' LIKE '%주님의 마음%';

-- 예배합니다 (론 케놀리) → 주 이름 높이세 (론 케놀리)
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주 이름 높이세"')
WHERE day_number = 14 AND today_hymn->>'title' LIKE '%예배합니다%';

-- 나의 영혼이 (론 케놀리) → 나의 영혼이
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 나의 영혼이"')
WHERE day_number = 16 AND today_hymn->>'title' LIKE '%나의 영혼이%';

-- 주의 시간에 (소리엘) → 주의 시간에
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주의 시간에"')
WHERE day_number = 18 AND today_hymn->>'title' LIKE '%주의 시간에%';

-- 하나님의 사랑 (김진) → 하나님의 사랑
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 하나님의 사랑"')
WHERE day_number = 18 AND today_hymn_2->>'title' LIKE '%하나님의 사랑%';

-- 빛이 되신 주 (워십월드) → 빛이 되신 주
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 빛이 되신 주"')
WHERE day_number = 20 AND today_hymn->>'title' LIKE '%빛이 되신 주%';

-- 주의 은혜 (마커스) → 주의 은혜
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주의 은혜"')
WHERE day_number = 20 AND today_hymn_2->>'title' LIKE '%주의 은혜%';

-- 부활의 주님 (호산나싱어즈) → 부활의 주
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 부활의 주"')
WHERE day_number = 22 AND today_hymn->>'title' LIKE '%부활의 주님%';

-- 사랑해요 주님을 (김명식) → 사랑해요 주님을
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 사랑해요 주님을"')
WHERE day_number = 24 AND today_hymn->>'title' LIKE '%사랑해요%';

-- 주와 함께 (최덕신) → 주와 함께
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주와 함께"')
WHERE day_number = 26 AND today_hymn->>'title' LIKE '%주와 함께%';

-- 주의 나라가 임하시네 (워십월드) → 주의 나라가 임하시네
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주의 나라가 임하시네"')
WHERE day_number = 28 AND today_hymn->>'title' LIKE '%주의 나라가%';

-- 주님이 주신 복음 (이종용) → 주님이 주신 복음
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님이 주신 복음"')
WHERE day_number = 30 AND today_hymn->>'title' LIKE '%주님이 주신 복음%';

-- 주님의 초대 (박종호) → 주님의 초대
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님의 초대"')
WHERE day_number = 32 AND today_hymn->>'title' LIKE '%주님의 초대%';

-- 주님을 따라 (론 케놀리) → 주님을 따라
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님을 따라"')
WHERE day_number = 34 AND today_hymn->>'title' LIKE '%주님을 따라%';

-- 예수 안에 생명 35일
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 예수 안에 생명"')
WHERE day_number = 35 AND today_hymn_2->>'title' LIKE '%예수 안에 생명%';

-- 호산나 (힐송) → 호산나
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 호산나"')
WHERE day_number = 36 AND today_hymn->>'title' LIKE '%호산나%';

-- 주님 찬양 36일 → 주님만이
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님만이"')
WHERE day_number = 36 AND today_hymn_2->>'title' LIKE '%주님 찬양%';

-- 감사함으로 37일
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 감사함으로"')
WHERE day_number = 37 AND today_hymn_2->>'title' LIKE '%감사함으로%';

-- 사랑이 가장 큰 것 (최덕신) → 사랑이 가장 큰 것
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 사랑이 가장 큰 것"')
WHERE day_number = 38 AND today_hymn->>'title' LIKE '%사랑이 가장%';

-- 주를 향한 나의 사랑 (박종호) → 주를 향한 나의 사랑
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주를 향한 나의 사랑"')
WHERE day_number = 38 AND today_hymn_2->>'title' LIKE '%주를 향한%';

-- 주의 길을 걷게 하소서 39일
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주의 길을 걷게 하소서"')
WHERE day_number = 39 AND today_hymn_2->>'title' LIKE '%주의 길을%';

-- 십자가를 지고 (김진) → 십자가를 지고
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 십자가를 지고"')
WHERE day_number = 40 AND today_hymn->>'title' LIKE '%십자가를 지고%';

-- 나의 모든 것 (위너스워십) → 나의 모든 것
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 나의 모든 것"')
WHERE day_number = 40 AND today_hymn_2->>'title' LIKE '%나의 모든 것%';

-- 십자가의 길 (이종용) → 십자가의 길
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 십자가의 길"')
WHERE day_number = 45 AND today_hymn->>'title' LIKE '%십자가의 길%';

-- 부활의 아침 (호산나싱어즈) → 부활의 아침
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 부활의 아침"')
WHERE day_number = 47 AND today_hymn->>'title' LIKE '%부활의 아침%';

-- 주의 길을 걷게 하소서 14일
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주의 길을 걷게 하소서"')
WHERE day_number = 14 AND today_hymn_2->>'title' LIKE '%주의 길을%';
