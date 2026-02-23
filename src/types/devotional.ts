export interface MusicItem {
  title: string;
  audio_url?: string;
  youtube_url?: string;
  spotify_embed?: string;
}

export interface Devotional {
  id: string;
  date: string;
  day_number: number;
  week_number: number;
  title: string;
  scripture_reference: string;
  scripture_text: string;
  explanation: string;
  illustration: string;
  action_items: string[];
  prayer_topics: string[];
  hymn_title: string | null;
  hymn_url: string | null;
  video_url: string | null;
  hymns: MusicItem[];
  gospel_songs: MusicItem[];
  today_hymn: MusicItem | null;
  today_hymn_2: MusicItem | null;
  special_video_url: string | null;
  special_video_title: string | null;
  is_holy_week: boolean;
  created_at: string;
  updated_at: string;
}

export interface UserReflection {
  devotional_id: string;
  reflection: string;
  prayer: string;
}
