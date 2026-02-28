/*
  # 1-40일차 찬송가 및 복음송 배정

  1. 변경 사항
    - 각 묵상 주제에 어울리는 찬송가 또는 복음송 1곡씩 배정
    - 찬송가와 복음송을 적절히 분산 배치
    - Supabase Storage URL 적용
*/

-- 1일차: 회개의 시작
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 내 주를 가까이',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-14.mp3'
) WHERE day_number = 1;

-- 2일차: 자기를 부인하라
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주님께 나아가',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-01.mp3'
) WHERE day_number = 2;

-- 3일차: 숨겨진 선행
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 예수 사랑하심은',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-16.mp3'
) WHERE day_number = 3;

-- 4일차: 용서의 능력
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주의 사랑',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-02.mp3'
) WHERE day_number = 4;

-- 5일차: 참된 금식
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 주의 음성을',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-17.mp3'
) WHERE day_number = 5;

-- 6일차: 광야의 시험
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 나의 힘이 되신 주',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-03.mp3'
) WHERE day_number = 6;

-- 7일차: 순종의 축복
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 나의 갈 길',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-18.mp3'
) WHERE day_number = 7;

-- 8일차: 믿음의 기도
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주께서 전하라 하신 말씀',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-04.mp3'
) WHERE day_number = 8;

-- 9일차: 겸손한 자
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 거룩 거룩 거룩',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-19.mp3'
) WHERE day_number = 9;

-- 10일차: 인내의 열매
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 믿음으로',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-05.mp3'
) WHERE day_number = 10;

-- 11일차: 말씀의 능력
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 예수 십자가에 흘린 피로써',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-20.mp3'
) WHERE day_number = 11;

-- 12일차: 두 마음
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주님의 마음',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-06.mp3'
) WHERE day_number = 12;

-- 13일차: 영적 갈증
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 목마른 사슴',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-21.mp3'
) WHERE day_number = 13;

-- 14일차: 예배의 진정성
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 예배합니다',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-07.mp3'
) WHERE day_number = 14;

-- 15일차: 치유의 능력
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 주의 친절한 팔에 안기세',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-22.mp3'
) WHERE day_number = 15;

-- 16일차: 생명의 떡
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 나의 영혼이',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-08.mp3'
) WHERE day_number = 16;

-- 17일차: 영생의 말씀
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 주 하나님 지으신',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-23.mp3'
) WHERE day_number = 17;

-- 18일차: 하나님의 때
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주의 시간에',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-09.mp3'
) WHERE day_number = 18;

-- 19일차: 진리가 자유케 하리라
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 주님의 마음을 본받는 자',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-24.mp3'
) WHERE day_number = 19;

-- 20일차: 세상의 빛
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 빛이 되신 주',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-10.mp3'
) WHERE day_number = 20;

-- 21일차: 선한 목자
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 주는 나를 기르시는 목자',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-25.mp3'
) WHERE day_number = 21;

-- 22일차: 부활과 생명
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 부활의 주님',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-11.mp3'
) WHERE day_number = 22;

-- 23일차: 섬김의 왕
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 섬기는 자가 되려네',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-26.mp3'
) WHERE day_number = 23;

-- 24일차: 새 계명
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 사랑해요 주님을',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-12.mp3'
) WHERE day_number = 24;

-- 25일차: 평안을 너희에게
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 평화의 하나님',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-27.mp3'
) WHERE day_number = 25;

-- 26일차: 포도나무와 가지
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주와 함께',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-13.mp3'
) WHERE day_number = 26;

-- 27일차: 생명의 근원
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 생명의 주님',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-28.mp3'
) WHERE day_number = 27;

-- 28일차: 하나님 나라의 복음
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주의 나라가 임하시네',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-14.mp3'
) WHERE day_number = 28;

-- 29일차: 겨자씨 비유
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 믿음의 사람들',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-29.mp3'
) WHERE day_number = 29;

-- 30일차: 진주 비유
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주님이 주신 복음',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-15.mp3'
) WHERE day_number = 30;

-- 31일차: 포도원 품꾼 비유
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 주의 일을 하는 일꾼',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-30.mp3'
) WHERE day_number = 31;

-- 32일차: 잔치 비유
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주님의 초대',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-16.mp3'
) WHERE day_number = 32;

-- 33일차: 새 하늘과 새 땅
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 그 날이 오면',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-31.mp3'
) WHERE day_number = 33;

-- 34일차: 예루살렘을 향하여
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 주님을 따라',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-17.mp3'
) WHERE day_number = 34;

-- 35일차: 잃어버린 자를 찾으러
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 죄에서 자유를 얻게 함은',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-01.mp3'
) WHERE day_number = 35;

-- 36일차: 겸손히 오신 왕
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 호산나',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-18.mp3'
) WHERE day_number = 36;

-- 37일차: 성전을 깨끗케
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 주님의 성전에',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-02.mp3'
) WHERE day_number = 37;

-- 38일차: 가장 큰 계명
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 사랑이 가장 큰 것',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-19.mp3'
) WHERE day_number = 38;

-- 39일차: 깨어 기도하라
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '찬송가 - 나의 기도',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/hymn-03.mp3'
) WHERE day_number = 39;

-- 40일차: 십자가 전날
UPDATE devotionals SET today_hymn = jsonb_build_object(
  'title', '복음송 - 십자가를 지고',
  'audio_url', 'https://nylvruiqkbdfsflzqibp.supabase.co/storage/v1/object/public/devotional-audio/hymns/song-20.mp3'
) WHERE day_number = 40;
