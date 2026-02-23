/*
  # 사용자 요청에 따른 복음송 제목 수정

  1. 변경 내용
    - 2월 27일 (Day 10): "나의 기도 (최덕신)" 삭제 → today_hymn을 today_hymn_2로 교체
    - 3월 1일 (Day 12): 
      * "주의 친절한 팔에 안기세 (이종용)" → "내가 너를 사랑함이라"
      * "주를 향한 나의 사랑 (박종호)" → "주의 손이"
    - 3월 5일 (Day 16): "모든 능력과 모든 권세" 삭제 → today_hymn을 today_hymn_2로 교체
    - 3월 21일 (Day 32): "주님의 초대" → "예수 나의 좋은 치료자"
    - 3월 27일 (Day 38): "주를 향한 나의 사랑" 삭제 → today_hymn을 today_hymn_2로 교체
*/

-- 2월 27일 (Day 10): "나의 기도 (최덕신)" 삭제
UPDATE devotionals
SET 
  today_hymn = today_hymn_2,
  today_hymn_2 = NULL
WHERE day_number = 10;

-- 3월 1일 (Day 12): 복음송 제목 변경
UPDATE devotionals
SET 
  today_hymn = jsonb_set(
    today_hymn,
    '{title}',
    '"복음송 - 내가 너를 사랑함이라"'
  ),
  today_hymn_2 = jsonb_set(
    today_hymn_2,
    '{title}',
    '"복음송 - 주의 손이"'
  )
WHERE day_number = 12;

-- 3월 5일 (Day 16): "모든 능력과 모든 권세" 삭제
UPDATE devotionals
SET 
  today_hymn = today_hymn_2,
  today_hymn_2 = NULL
WHERE day_number = 16;

-- 3월 21일 (Day 32): "주님의 초대" → "예수 나의 좋은 치료자"
UPDATE devotionals
SET 
  today_hymn = jsonb_set(
    today_hymn,
    '{title}',
    '"복음송 - 예수 나의 좋은 치료자"'
  )
WHERE day_number = 32;

-- 3월 27일 (Day 38): "주를 향한 나의 사랑" 삭제
UPDATE devotionals
SET 
  today_hymn = today_hymn_2,
  today_hymn_2 = NULL
WHERE day_number = 38;
