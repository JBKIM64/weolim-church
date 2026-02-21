import { Music, Play, Pause } from 'lucide-react';
import { useState, useRef, useEffect, memo } from 'react';
import { MusicItem } from '../types/devotional';
import { useAudio } from '../contexts/AudioContext';

interface MusicPlayerProps {
  music: MusicItem;
  type: 'hymn' | 'gospel';
}

function MusicPlayer({ music, type }: MusicPlayerProps) {
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [hasError, setHasError] = useState(false);
  const audioRef = useRef<HTMLAudioElement>(null);
  const { currentAudio, setCurrentAudio } = useAudio();

  const bgColor = type === 'hymn'
    ? 'from-amber-100 to-amber-50 border-amber-200'
    : 'from-blue-100 to-blue-50 border-blue-200';
  const iconColor = type === 'hymn' ? 'text-amber-700' : 'text-blue-700';

  useEffect(() => {
    const audio = audioRef.current;
    if (!audio || !music.audio_url) return;

    audio.src = music.audio_url;
    audio.load();
    setIsPlaying(false);
    setCurrentTime(0);
    setDuration(0);
    setHasError(false);
  }, [music.audio_url]);

  useEffect(() => {
    const audio = audioRef.current;
    if (!audio) return;

    if (currentAudio !== audio && !audio.paused) {
      audio.pause();
      setIsPlaying(false);
    }
  }, [currentAudio]);

  useEffect(() => {
    const audio = audioRef.current;
    if (!audio) return;

    const updateTime = () => {
      if (audio && !isNaN(audio.currentTime)) {
        setCurrentTime(audio.currentTime);
      }
    };

    const updateDuration = () => {
      if (audio && !isNaN(audio.duration)) {
        setDuration(audio.duration);
      }
    };

    const handleEnded = () => {
      setIsPlaying(false);
      setCurrentTime(0);
      setCurrentAudio(null);
    };

    const handleError = () => {
      setHasError(true);
      setIsPlaying(false);
      setCurrentAudio(null);
    };

    const handlePause = () => {
      setIsPlaying(false);
    };

    audio.addEventListener('timeupdate', updateTime);
    audio.addEventListener('loadedmetadata', updateDuration);
    audio.addEventListener('ended', handleEnded);
    audio.addEventListener('error', handleError);
    audio.addEventListener('pause', handlePause);

    return () => {
      audio.removeEventListener('timeupdate', updateTime);
      audio.removeEventListener('loadedmetadata', updateDuration);
      audio.removeEventListener('ended', handleEnded);
      audio.removeEventListener('error', handleError);
      audio.removeEventListener('pause', handlePause);
    };
  }, [setCurrentAudio]);

  const togglePlay = async () => {
    const audio = audioRef.current;
    if (!audio) return;

    if (isPlaying) {
      audio.pause();
      setIsPlaying(false);
      setCurrentAudio(null);
    } else {
      try {
        setCurrentAudio(audio);
        await audio.play();
        setIsPlaying(true);
      } catch (error) {
        console.error('Audio playback failed:', error);
        alert(`재생 실패: 음원 파일이 아직 업로드되지 않았습니다.`);
        setCurrentAudio(null);
      }
    }
  };

  const formatTime = (time: number) => {
    if (isNaN(time)) return '0:00';
    const minutes = Math.floor(time / 60);
    const seconds = Math.floor(time % 60);
    return `${minutes}:${seconds.toString().padStart(2, '0')}`;
  };

  const handleSeek = (e: React.ChangeEvent<HTMLInputElement>) => {
    const audio = audioRef.current;
    if (!audio) return;
    const newTime = parseFloat(e.target.value);
    audio.currentTime = newTime;
    setCurrentTime(newTime);
  };

  if (music.audio_url) {
    return (
      <div className={`flex flex-col gap-3 p-4 bg-gradient-to-r ${bgColor} rounded-lg border transition-all`}>
        <audio
          ref={audioRef}
          preload="metadata"
        />

        <div className="flex items-center gap-3">
          <button
            onClick={togglePlay}
            disabled={hasError}
            className={`flex-shrink-0 w-12 h-12 rounded-full ${iconColor} bg-white shadow-md hover:shadow-lg transition-all flex items-center justify-center ${hasError ? 'opacity-50 cursor-not-allowed' : ''}`}
          >
            {isPlaying ? <Pause className="w-6 h-6" fill="currentColor" /> : <Play className="w-6 h-6" fill="currentColor" />}
          </button>

          <div className="flex-1">
            <div className="font-semibold text-stone-800">{music.title}</div>
            <div className="text-sm text-stone-600">
              {hasError ? '음원 파일을 찾을 수 없습니다' : '음원 재생'}
            </div>
          </div>
        </div>

        {duration > 0 && (
          <div className="flex items-center gap-2">
            <span className="text-xs text-stone-600 w-10">{formatTime(currentTime)}</span>
            <input
              type="range"
              min="0"
              max={duration || 0}
              value={currentTime}
              onChange={handleSeek}
              className="flex-1 h-2 bg-stone-300 rounded-lg appearance-none cursor-pointer slider"
              style={{
                background: `linear-gradient(to right, #b8927d 0%, #b8927d ${(currentTime / duration) * 100}%, #d1d5db ${(currentTime / duration) * 100}%, #d1d5db 100%)`
              }}
            />
            <span className="text-xs text-stone-600 w-10">{formatTime(duration)}</span>
          </div>
        )}
      </div>
    );
  }

  if (music.spotify_embed) {
    return (
      <div className={`p-4 bg-gradient-to-r ${bgColor} rounded-lg border transition-all`}>
        <div className="font-semibold text-stone-800 mb-3">{music.title}</div>
        <iframe
          src={music.spotify_embed}
          width="100%"
          height="152"
          frameBorder="0"
          allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
          loading="lazy"
          className="rounded-lg"
        />
      </div>
    );
  }

  if (music.youtube_url) {
    return (
      <a
        href={music.youtube_url}
        target="_blank"
        rel="noopener noreferrer"
        className={`flex items-center gap-3 p-4 bg-gradient-to-r ${bgColor} rounded-lg hover:shadow-lg transition-all border`}
      >
        <Music className={`w-6 h-6 ${iconColor} flex-shrink-0`} />
        <div className="flex-1">
          <div className="font-semibold text-stone-800">{music.title}</div>
          <div className="text-sm text-stone-600">유튜브에서 듣기</div>
        </div>
      </a>
    );
  }

  return null;
}

export default memo(MusicPlayer, (prevProps, nextProps) => {
  return prevProps.music.audio_url === nextProps.music.audio_url &&
         prevProps.music.title === nextProps.music.title &&
         prevProps.type === nextProps.type;
});
