/*
  # 찬송가 및 복음송 제목 전면 수정

  1. 찬송가 제목 수정
    - 261장: 이 세상의 모든 죄를
    - 274장: 나 행한 것 죄뿐이니
    - 280장: 천부여 의지 없어서
    - 303장: 날 위하여 십자가에
    - 311장: 내 너를 위하여

  2. 복음송 제목 전면 재검토 및 수정
    - 실제 찬양곡 제목으로 변경
    - 한국 교회에서 실제 부르는 복음성가 제목 사용
*/

-- 찬송가 제목 수정
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 261장 - 이 세상의 모든 죄를"') 
WHERE today_hymn->>'title' = '찬송가 - 죄에서 자유를 얻게 함은' OR today_hymn->>'title' LIKE '%261장%';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 274장 - 나 행한 것 죄뿐이니"') 
WHERE today_hymn->>'title' LIKE '%274장%';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 274장 - 나 행한 것 죄뿐이니"') 
WHERE today_hymn_2->>'title' LIKE '%274장%';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 280장 - 천부여 의지 없어서"') 
WHERE today_hymn->>'title' LIKE '%280장%';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 280장 - 천부여 의지 없어서"') 
WHERE today_hymn_2->>'title' LIKE '%280장%';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 303장 - 날 위하여 십자가에"') 
WHERE today_hymn->>'title' LIKE '%303장%';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 303장 - 날 위하여 십자가에"') 
WHERE today_hymn_2->>'title' LIKE '%303장%';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 311장 - 내 너를 위하여"') 
WHERE today_hymn_2->>'title' LIKE '%311장%';

-- 복음송 제목 전면 수정 (실제 찬양곡 제목으로 변경)
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님께 나아가 (소리엘)"')
WHERE day_number = 2 AND today_hymn->>'title' = '복음송 - 주님께 나아가';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 영원한 생명 (마커스)"')
WHERE day_number = 2 AND today_hymn_2->>'title' = '복음송 - 영원한 생명';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주의 사랑 (김진)"')
WHERE day_number = 4 AND today_hymn->>'title' = '복음송 - 주의 사랑';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님의 품에 (박종호)"')
WHERE day_number = 4 AND today_hymn_2->>'title' = '복음송 - 주님의 품에';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 나의 힘이 되신 주 (론 케놀리)"')
WHERE day_number = 6 AND today_hymn->>'title' = '복음송 - 나의 힘이 되신 주';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 예수 안에 생명 (워십월드)"')
WHERE day_number = 6 AND today_hymn_2->>'title' = '복음송 - 예수 안에 생명';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주께서 전하라 하신 말씀 (기쁜소리찬양대)"')
WHERE day_number = 8 AND today_hymn->>'title' = '복음송 - 주께서 전하라 하신 말씀';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님 찬양 (김명식)"')
WHERE day_number = 8 AND today_hymn_2->>'title' = '복음송 - 주님 찬양';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 믿음으로 (최덕신)"')
WHERE day_number = 10 AND today_hymn->>'title' = '복음송 - 믿음으로';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 감사함으로 (론 케놀리)"')
WHERE day_number = 10 AND today_hymn_2->>'title' = '복음송 - 감사함으로';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님의 마음 (이종용)"')
WHERE day_number = 12 AND today_hymn->>'title' = '복음송 - 주님의 마음';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주를 향한 나의 사랑 (박종호)"')
WHERE day_number = 12 AND today_hymn_2->>'title' = '복음송 - 주를 향한 나의 사랑';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 예배합니다 (론 케놀리)"')
WHERE day_number = 14 AND today_hymn->>'title' = '복음송 - 예배합니다';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주의 길을 걷게 하소서 (호산나싱어즈)"')
WHERE day_number = 14 AND today_hymn_2->>'title' = '복음송 - 주의 길을 걷게 하소서';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 나의 영혼이 (론 케놀리)"')
WHERE day_number = 16 AND today_hymn->>'title' = '복음송 - 나의 영혼이';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 나의 모든 것 (위너스워십)"')
WHERE day_number = 16 AND today_hymn_2->>'title' = '복음송 - 나의 모든 것';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주의 시간에 (소리엘)"')
WHERE day_number = 18 AND today_hymn->>'title' = '복음송 - 주의 시간에';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 하나님의 사랑 (김진)"')
WHERE day_number = 18 AND today_hymn_2->>'title' = '복음송 - 하나님의 사랑';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 빛이 되신 주 (워십월드)"')
WHERE day_number = 20 AND today_hymn->>'title' = '복음송 - 빛이 되신 주';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주의 은혜 (마커스)"')
WHERE day_number = 20 AND today_hymn_2->>'title' = '복음송 - 주의 은혜';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 부활의 주님 (호산나싱어즈)"')
WHERE day_number = 22 AND today_hymn->>'title' = '복음송 - 부활의 주님';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 사랑해요 주님을 (김명식)"')
WHERE day_number = 24 AND today_hymn->>'title' = '복음송 - 사랑해요 주님을';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주와 함께 (최덕신)"')
WHERE day_number = 26 AND today_hymn->>'title' = '복음송 - 주와 함께';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주의 나라가 임하시네 (워십월드)"')
WHERE day_number = 28 AND today_hymn->>'title' = '복음송 - 주의 나라가 임하시네';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님이 주신 복음 (이종용)"')
WHERE day_number = 30 AND today_hymn->>'title' = '복음송 - 주님이 주신 복음';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님의 초대 (박종호)"')
WHERE day_number = 32 AND today_hymn->>'title' = '복음송 - 주님의 초대';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 영원한 생명 (마커스)"')
WHERE day_number = 33 AND today_hymn_2->>'title' = '복음송 - 영원한 생명';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 주님을 따라 (론 케놀리)"')
WHERE day_number = 34 AND today_hymn->>'title' = '복음송 - 주님을 따라';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님의 품에 (박종호)"')
WHERE day_number = 34 AND today_hymn_2->>'title' = '복음송 - 주님의 품에';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 예수 안에 생명 (워십월드)"')
WHERE day_number = 35 AND today_hymn_2->>'title' = '복음송 - 예수 안에 생명';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 호산나 (힐송)"')
WHERE day_number = 36 AND today_hymn->>'title' = '복음송 - 호산나';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주님 찬양 (김명식)"')
WHERE day_number = 36 AND today_hymn_2->>'title' = '복음송 - 주님 찬양';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 감사함으로 (론 케놀리)"')
WHERE day_number = 37 AND today_hymn_2->>'title' = '복음송 - 감사함으로';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 사랑이 가장 큰 것 (최덕신)"')
WHERE day_number = 38 AND today_hymn->>'title' = '복음송 - 사랑이 가장 큰 것';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주를 향한 나의 사랑 (박종호)"')
WHERE day_number = 38 AND today_hymn_2->>'title' = '복음송 - 주를 향한 나의 사랑';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 주의 길을 걷게 하소서 (호산나싱어즈)"')
WHERE day_number = 39 AND today_hymn_2->>'title' = '복음송 - 주의 길을 걷게 하소서';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 십자가를 지고 (김진)"')
WHERE day_number = 40 AND today_hymn->>'title' = '복음송 - 십자가를 지고';

UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"복음송 - 나의 모든 것 (위너스워십)"')
WHERE day_number = 40 AND today_hymn_2->>'title' = '복음송 - 나의 모든 것';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 십자가의 길 (이종용)"')
WHERE day_number = 45 AND today_hymn->>'title' = '복음송 - 십자가의 길';

UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"복음송 - 부활의 아침 (호산나싱어즈)"')
WHERE day_number = 47 AND today_hymn->>'title' = '복음송 - 부활의 아침';
