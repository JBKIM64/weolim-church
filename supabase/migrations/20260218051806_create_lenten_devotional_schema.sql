/*
  # 2026 사순절 묵상 데이터베이스 스키마

  1. 새 테이블
    - `devotionals`
      - `id` (uuid, primary key)
      - `date` (date) - 묵상 날짜
      - `day_number` (integer) - 사순절 일차 (1-47)
      - `week_number` (integer) - 주차 (1-7)
      - `title` (text) - 묵상 제목
      - `scripture_reference` (text) - 성경 구절 참조
      - `scripture_text` (text) - 성경 구절 텍스트
      - `explanation` (text) - 말씀 설명
      - `illustration` (text) - 신앙적 예화
      - `action_items` (jsonb) - 실천 사항 배열
      - `prayer_topics` (jsonb) - 기도 제목 배열
      - `hymn_title` (text) - 찬송가/복음송 제목
      - `hymn_url` (text) - 찬송가/복음송 URL
      - `video_url` (text) - 영상 URL (부활 전 토요일)
      - `is_holy_week` (boolean) - 고난주간 여부
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

    - `user_reflections`
      - `id` (uuid, primary key)
      - `devotional_id` (uuid, foreign key)
      - `reflection` (text) - 깨달음
      - `prayer` (text) - 결단 기도
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. 보안
    - devotionals 테이블은 읽기 전용 (공개)
    - user_reflections 테이블은 로컬 저장소 사용
*/

-- Create devotionals table
CREATE TABLE IF NOT EXISTS devotionals (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  date date NOT NULL UNIQUE,
  day_number integer NOT NULL,
  week_number integer NOT NULL,
  title text NOT NULL,
  scripture_reference text NOT NULL,
  scripture_text text NOT NULL,
  explanation text NOT NULL,
  illustration text NOT NULL,
  action_items jsonb NOT NULL DEFAULT '[]'::jsonb,
  prayer_topics jsonb NOT NULL DEFAULT '[]'::jsonb,
  hymn_title text,
  hymn_url text,
  video_url text,
  is_holy_week boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create index for faster date lookups
CREATE INDEX IF NOT EXISTS idx_devotionals_date ON devotionals(date);
CREATE INDEX IF NOT EXISTS idx_devotionals_day_number ON devotionals(day_number);

-- Enable RLS
ALTER TABLE devotionals ENABLE ROW LEVEL SECURITY;

-- Public read access for devotionals
CREATE POLICY "Anyone can read devotionals"
  ON devotionals
  FOR SELECT
  TO anon, authenticated
  USING (true);