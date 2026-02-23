import { useState, useEffect } from 'react';
import DevotionalList from './components/DevotionalList';
import DevotionalDetail from './components/DevotionalDetail';
import { Devotional } from './types/devotional';
import { AudioProvider } from './contexts/AudioContext';

export default function App() {
  const [selectedDevotional, setSelectedDevotional] = useState<Devotional | null>(null);
  const [currentWeek, setCurrentWeek] = useState<number>(1);
  const [showExitConfirm, setShowExitConfirm] = useState(false);

  useEffect(() => {
    const handlePopState = (e: PopStateEvent) => {
      if (selectedDevotional) {
        setSelectedDevotional(null);
      } else {
        e.preventDefault();
        setShowExitConfirm(true);
        window.history.pushState(null, '', window.location.href);
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

  const handleExitApp = () => {
    setShowExitConfirm(false);
    window.history.back();
  };

  const handleCancelExit = () => {
    setShowExitConfirm(false);
  };

  if (selectedDevotional) {
    return (
      <AudioProvider>
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
      <DevotionalList onSelectDevotional={handleSelectDevotional} initialWeek={currentWeek} />

      {showExitConfirm && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl max-w-sm w-full p-6 animate-scale-in">
            <h3 className="text-xl font-semibold text-gray-900 mb-3">앱 종료</h3>
            <p className="text-gray-600 mb-6">
              앱을 종료하시겠습니까?
            </p>
            <div className="flex gap-3">
              <button
                onClick={handleCancelExit}
                className="flex-1 px-4 py-3 bg-gray-100 text-gray-700 rounded-xl font-medium hover:bg-gray-200 transition-colors"
              >
                취소
              </button>
              <button
                onClick={handleExitApp}
                className="flex-1 px-4 py-3 bg-purple-600 text-white rounded-xl font-medium hover:bg-purple-700 transition-colors"
              >
                종료
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
