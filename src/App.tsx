import { useState, useEffect } from 'react';
import DevotionalList from './components/DevotionalList';
import DevotionalDetail from './components/DevotionalDetail';
import { Devotional } from './types/devotional';
import { AudioProvider } from './contexts/AudioContext';
import { AuthProvider } from './contexts/AuthContext';

export default function App() {
  const [selectedDevotional, setSelectedDevotional] = useState<Devotional | null>(null);
  const [currentWeek, setCurrentWeek] = useState<number>(1);

  useEffect(() => {
    const handlePopState = () => {
      if (selectedDevotional) {
        setSelectedDevotional(null);
      }
    };

    window.history.pushState(null, '', window.location.href);
    window.addEventListener('popstate', handlePopState);

    return () => {
      window.removeEventListener('popstate', handlePopState);
    };
  }, [selectedDevotional]);

  const handleSelectDevotional = (devotional: Devotional, weekNumber: number) => {
    setSelectedDevotional(devotional);
    setCurrentWeek(weekNumber);
    window.history.pushState({ page: 'detail' }, '');
  };

  const handleBack = () => {
    window.history.back();
  };

  return (
    <AuthProvider>
      {selectedDevotional ? (
        <AudioProvider>
          <DevotionalDetail
            devotional={selectedDevotional}
            onBack={handleBack}
            weekNumber={currentWeek}
          />
        </AudioProvider>
      ) : (
        <DevotionalList onSelectDevotional={handleSelectDevotional} initialWeek={currentWeek} />
      )}
    </AuthProvider>
  );
}
