import { createContext, useContext, useState, ReactNode } from 'react';

interface AudioContextType {
  currentAudio: HTMLAudioElement | null;
  setCurrentAudio: (audio: HTMLAudioElement | null) => void;
}

const AudioContext = createContext<AudioContextType | undefined>(undefined);

function AudioProvider({ children }: { children: ReactNode }) {
  const [currentAudio, setCurrentAudioState] = useState<HTMLAudioElement | null>(null);

  const setCurrentAudio = (audio: HTMLAudioElement | null) => {
    if (currentAudio && currentAudio !== audio) {
      currentAudio.pause();
    }
    setCurrentAudioState(audio);
  };

  return (
    <AudioContext.Provider value={{ currentAudio, setCurrentAudio }}>
      {children}
    </AudioContext.Provider>
  );
}

function useAudio() {
  const context = useContext(AudioContext);
  if (context === undefined) {
    throw new Error('useAudio must be used within an AudioProvider');
  }
  return context;
}

// eslint-disable-next-line react-refresh/only-export-components
export { AudioProvider, useAudio };
