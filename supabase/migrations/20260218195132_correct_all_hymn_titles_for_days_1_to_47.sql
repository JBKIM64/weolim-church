/*
  # Correct All Hymn Titles for Days 1-47

  1. Purpose
    - Fix incorrect hymn titles to match official Korean hymnal titles
    - Ensure all titles are accurate and verifiable
  
  2. Changes Made
    Day 1: 150장 "내 주를 가까이" → "갈보리 산 위에"
    Day 3: 250장 "예수 사랑하심은" → "구주의 십자가 보혈로"
    Day 5: 254장 "주의 음성을" → "내 주의 보혈은"
    Day 7: 258장 "나의 갈 길" → "샘물과 같은 보혈은"
    Day 9: 259장 "거룩 거룩 거룩" → "예수 십자가에 흘린 피로써"
    Day 11: 260장 "새 찬송" → "우리를 죄에서 구하시려"
    Day 13: 261장 "능력의 주" → "죄 짐 맡은 우리 구주"
    Day 15: 265장 "주를 앙모하는 자" → "주 십자가를 지심으로"
    Day 17: 267장 "주 하나님 지으신 모든 세계" → "주의 확실한 약속의 말씀 듣고"
    Day 19: 268장 "죄에서 자유를 얻게 함은" (정확함)
    Day 21: 269장 "목자이신 주님께" → "그 참혹한 십자가에"
    Day 23: 270장 "선한 목자 되신 주" → "변찮는 주님의 사랑과"
    Day 25: 274장 "평화의 왕이신 주" → "주 예수 넓은 사랑"
    Day 27: 280장 "생명 진리 은혜 되신" → "어린 양 찬송하리라"
    Day 29: 287장 "믿음의 사람들" → "예수 앞에 나오면"
    Day 31: 288장 "예수는 나의 힘이요" → "예수를 나의 구주 삼고"
    Day 33: 298장 "언제나 주님께" → "속죄하신 구세주를"
    Day 35: 303장 "날 위하여" → "날마다 주님을"
    Day 37: 305장 "나의 집을 주께 드립니다" → "나 같은 죄인 살리신"
    Day 39: 310장 "아름다운 주의 영광" → "아 하나님의 은혜로"
    Day 41: "갈보리 산 위에" (정확함)
    Day 42: "구주의 십자가 보혈로" (정확함)
    Day 43: "내 주 예수 하신 일" → "내 주의 보혈은"
    Day 44: "샘물과 같은 보혈은" (정확함)
    
    Second Hymn Corrections:
    Day 1-2: 151장 "구주를 생각만 해도" → "만왕의 왕 내 주께서"
    Day 3: 154장 "주께 가까이" → "생명의 주여 면류관"
    Day 5: 197장 "나의 죄를 씻기는" → "은혜가 풍성한 하나님은"
    Day 7: 205장 "나의 살던 고향은" → "주 예수 크신 사랑"
    Day 9: 212장 "나의 생명 드리니" → "겸손히 주를 섬길 때"
    Day 11: 215장 "내 영혼의 그윽히 깊은 데서" → "내 죄 속해 주신 주께"
    Day 13: 216장 "성령이여 강림하사" → "성자의 귀한 몸"
    Day 15: 251장 "예수님이 우리를 부르는 소리" → "놀랍다 주님의 큰 은혜"
    Day 17: 257장 "예수 이름 높이어라" → "마음에 가득한 의심을 깨치고"
    Day 19: 311장 "온 세상이 캄캄하여서" → "삼천리 반도 금수강산"
    Day 21: 450장 "곤한 내 영혼 편히 쉴 곳과" → "내 평생 소원 이것뿐"
*/

-- Day 1: Fix hymn 150 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 150장 - 갈보리 산 위에"') WHERE day_number = 1;

-- Day 3: Fix hymn 250 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 250장 - 구주의 십자가 보혈로"') WHERE day_number = 3;

-- Day 5: Fix hymn 254 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 254장 - 내 주의 보혈은"') WHERE day_number = 5;

-- Day 7: Fix hymn 258 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 258장 - 샘물과 같은 보혈은"') WHERE day_number = 7;

-- Day 9: Fix hymn 259 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 259장 - 예수 십자가에 흘린 피로써"') WHERE day_number = 9;

-- Day 11: Fix hymn 260 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 260장 - 우리를 죄에서 구하시려"') WHERE day_number = 11;

-- Day 13: Fix hymn 261 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 261장 - 죄 짐 맡은 우리 구주"') WHERE day_number = 13;

-- Day 15: Fix hymn 265 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 265장 - 주 십자가를 지심으로"') WHERE day_number = 15;

-- Day 17: Fix hymn 267 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 267장 - 주의 확실한 약속의 말씀 듣고"') WHERE day_number = 17;

-- Day 21: Fix hymn 269 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 269장 - 그 참혹한 십자가에"') WHERE day_number = 21;

-- Day 23: Fix hymn 270 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 270장 - 변찮는 주님의 사랑과"') WHERE day_number = 23;

-- Day 25: Fix hymn 274 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 274장 - 주 예수 넓은 사랑"') WHERE day_number = 25;

-- Day 27: Fix hymn 280 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 280장 - 어린 양 찬송하리라"') WHERE day_number = 27;

-- Day 29: Fix hymn 287 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 287장 - 예수 앞에 나오면"') WHERE day_number = 29;

-- Day 31: Fix hymn 288 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 288장 - 예수를 나의 구주 삼고"') WHERE day_number = 31;

-- Day 33: Fix hymn 298 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 298장 - 속죄하신 구세주를"') WHERE day_number = 33;

-- Day 35: Fix hymn 303 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 303장 - 날마다 주님을"') WHERE day_number = 35;

-- Day 37: Fix hymn 305 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 305장 - 나 같은 죄인 살리신"') WHERE day_number = 37;

-- Day 39: Fix hymn 310 title
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 310장 - 아 하나님의 은혜로"') WHERE day_number = 39;

-- Day 43: Fix hymn 254 title for holy week
UPDATE devotionals SET today_hymn = jsonb_set(today_hymn, '{title}', '"찬송가 254장 - 내 주의 보혈은"') WHERE day_number = 43;

-- Fix second hymn titles
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 151장 - 만왕의 왕 내 주께서"') WHERE day_number = 1;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 154장 - 생명의 주여 면류관"') WHERE day_number = 3;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 197장 - 은혜가 풍성한 하나님은"') WHERE day_number = 5;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 205장 - 주 예수 크신 사랑"') WHERE day_number = 7;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 212장 - 겸손히 주를 섬길 때"') WHERE day_number = 9;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 215장 - 내 죄 속해 주신 주께"') WHERE day_number = 11;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 216장 - 성자의 귀한 몸"') WHERE day_number = 13;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 251장 - 놀랍다 주님의 큰 은혜"') WHERE day_number = 15;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 257장 - 마음에 가득한 의심을 깨치고"') WHERE day_number = 17;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 311장 - 삼천리 반도 금수강산"') WHERE day_number = 19;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 450장 - 내 평생 소원 이것뿐"') WHERE day_number = 21;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 151장 - 만왕의 왕 내 주께서"') WHERE day_number = 22;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 154장 - 생명의 주여 면류관"') WHERE day_number = 23;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 197장 - 은혜가 풍성한 하나님은"') WHERE day_number = 24;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 205장 - 주 예수 크신 사랑"') WHERE day_number = 25;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 212장 - 겸손히 주를 섬길 때"') WHERE day_number = 26;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 215장 - 내 죄 속해 주신 주께"') WHERE day_number = 27;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 216장 - 성자의 귀한 몸"') WHERE day_number = 28;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 251장 - 놀랍다 주님의 큰 은혜"') WHERE day_number = 29;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 257장 - 마음에 가득한 의심을 깨치고"') WHERE day_number = 30;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 311장 - 삼천리 반도 금수강산"') WHERE day_number = 31;
UPDATE devotionals SET today_hymn_2 = jsonb_set(today_hymn_2, '{title}', '"찬송가 450장 - 내 평생 소원 이것뿐"') WHERE day_number = 32;
