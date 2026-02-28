import { memo } from 'react';
import { Music } from 'lucide-react';
import { MusicItem } from '../types/devotional';
import MusicPlayer from './MusicPlayer';

interface MusicSectionProps {
  hymn1: MusicItem;
  hymn2?: MusicItem;
}

function MusicSection({ hymn1, hymn2 }: MusicSectionProps) {
  return (
    <section className="mb-7">
      <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
        <Music className="w-6 h-6 text-amber-600" />
        오늘의 찬양
      </h2>
      <div className="space-y-4">
        <MusicPlayer
          key={`hymn1-${hymn1.audio_url || hymn1.title}`}
          music={hymn1}
          type={hymn1.title.includes('복음송') ? "gospel" : "hymn"}
        />
        {hymn2 && (
          <MusicPlayer
            key={`hymn2-${hymn2.audio_url || hymn2.title}`}
            music={hymn2}
            type={hymn2.title.includes('복음송') ? "gospel" : "hymn"}
          />
        )}
      </div>
    </section>
  );
}

export default memo(MusicSection, (prevProps, nextProps) => {
  const prev1 = prevProps.hymn1;
  const next1 = nextProps.hymn1;
  const prev2 = prevProps.hymn2;
  const next2 = nextProps.hymn2;

  return prev1.audio_url === next1.audio_url &&
         prev1.title === next1.title &&
         prev2?.audio_url === next2?.audio_url &&
         prev2?.title === next2?.title;
});
