import { useState, useEffect } from 'react';
import DevotionalList from './components/DevotionalList';
import DevotionalDetail from './components/DevotionalDetail';
import IconUploader from './components/IconUploader';
import { Devotional } from './types/devotional';
import { AudioProvider } from './contexts/AudioContext';

export default function App() {
  const [selectedDevotional, setSelectedDevotional] = useState<Devotional | null>(null);
  const [currentWeek, setCurrentWeek] = useState<number>(1);
  const [showIconUploader, setShowIconUploader] = useState(false);

  useEffect(() => {
    const handlePopState = () => {
      setSelectedDevotional(null);
    };

    window.addEventListener('popstate', handlePopState);

    const checkIconExists = async () => {
      try {
        const response = await fetch('/lenten-icon.jpg');
        if (!response.ok) {
          setShowIconUploader(true);
        }
      } catch {
        setShowIconUploader(true);
      }
    };

    checkIconExists();

    return () => {
      window.removeEventListener('popstate', handlePopState);
    };
  }, []);

  const handleSelectDevotional = (devotional: Devotional, weekNumber: number) => {
    setSelectedDevotional(devotional);
    setCurrentWeek(weekNumber);
    window.history.pushState({ page: 'detail' }, '');
  };

  const handleBack = () => {
    window.history.back();
  };

  if (selectedDevotional) {
    return (
      <AudioProvider>
        {showIconUploader && <IconUploader />}
        <DevotionalDetail
          devotional={selectedDevotional}
          onBack={handleBack}
          weekNumber={currentWeek}
        />
      </AudioProvider>
    );
  }

  return (
    <>
      {showIconUploader && <IconUploader />}
      <DevotionalList onSelectDevotional={handleSelectDevotional} initialWeek={currentWeek} />
    </>
  );
}
