import { useState, useEffect, memo } from 'react';
import { Save } from 'lucide-react';

interface ReflectionSectionProps {
  devotionalId: string;
}

function ReflectionSection({ devotionalId }: ReflectionSectionProps) {
  const [reflection, setReflection] = useState('');
  const [prayer, setPrayer] = useState('');

  useEffect(() => {
    const saved = localStorage.getItem(`devotional-${devotionalId}`);
    if (saved) {
      const data = JSON.parse(saved);
      setReflection(data.reflection || '');
      setPrayer(data.prayer || '');
    }
  }, [devotionalId]);

  const handleSave = () => {
    const data = { reflection, prayer };
    localStorage.setItem(`devotional-${devotionalId}`, JSON.stringify(data));
    alert('저장되었습니다!');
  };

  return (
    <section className="mb-6">
      <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
        <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
        깨달음과 결단
      </h2>
      <div className="space-y-6">
        <div>
          <label className="block text-sm font-semibold text-stone-700 mb-2">
            오늘의 깨달음
          </label>
          <textarea
            value={reflection}
            onChange={(e) => setReflection(e.target.value)}
            className="w-full h-32 p-4 bg-stone-50 border border-stone-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500 resize-none"
            placeholder="오늘 말씀을 통해 깨달은 것을 적어보세요..."
          />
        </div>
        <div>
          <label className="block text-sm font-semibold text-stone-700 mb-2">
            결단 기도
          </label>
          <textarea
            value={prayer}
            onChange={(e) => setPrayer(e.target.value)}
            className="w-full h-32 p-4 bg-stone-50 border border-stone-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500 resize-none"
            placeholder="오늘의 결단을 기도로 적어보세요..."
          />
        </div>
        <button
          onClick={handleSave}
          className="w-full flex items-center justify-center gap-2 bg-[#b8927d] hover:bg-[#a67f6b] text-white font-semibold py-4 rounded-lg transition-colors shadow-lg"
        >
          <Save className="w-5 h-5" />
          저장하기
        </button>
      </div>
    </section>
  );
}

export default memo(ReflectionSection, (prevProps, nextProps) => {
  return prevProps.devotionalId === nextProps.devotionalId;
});
