import { useState, useEffect, memo, useRef } from 'react';
import { Save, Cloud, CloudOff } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useAuth } from '../contexts/AuthContext';

interface ReflectionSectionProps {
  devotionalId: string;
}

function ReflectionSection({ devotionalId }: ReflectionSectionProps) {
  const { user } = useAuth();
  const [reflection, setReflection] = useState('');
  const [prayer, setPrayer] = useState('');
  const [isSaved, setIsSaved] = useState(true);
  const [isLoading, setIsLoading] = useState(true);
  const [saveStatus, setSaveStatus] = useState<'saved' | 'saving' | 'error'>('saved');
  const previousDevotionalId = useRef<string>(devotionalId);
  const autoSaveTimeoutRef = useRef<NodeJS.Timeout | null>(null);

  const loadReflection = async (devId: string) => {
    if (!user) {
      setReflection('');
      setPrayer('');
      setIsLoading(false);
      return;
    }

    try {
      setIsLoading(true);
      const { data, error } = await supabase
        .from('user_reflections')
        .select('reflection, prayer')
        .eq('devotional_id', devId)
        .eq('user_id', user.id)
        .maybeSingle();

      if (error) {
        console.error('Error loading reflection:', error);
        return;
      }

      if (data) {
        setReflection(data.reflection || '');
        setPrayer(data.prayer || '');
      } else {
        setReflection('');
        setPrayer('');
      }
    } catch (error) {
      console.error('Error loading reflection:', error);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    if (previousDevotionalId.current !== devotionalId) {
      loadReflection(devotionalId);
      setIsSaved(true);
      previousDevotionalId.current = devotionalId;
    }
  }, [devotionalId]);

  useEffect(() => {
    if (user) {
      loadReflection(devotionalId);
    }
  }, [user]);

  const saveToSupabase = async () => {
    if (!user) {
      alert('로그인이 필요합니다.');
      return false;
    }

    try {
      setSaveStatus('saving');

      const { data: existing } = await supabase
        .from('user_reflections')
        .select('id')
        .eq('devotional_id', devotionalId)
        .eq('user_id', user.id)
        .maybeSingle();

      if (existing) {
        const { error } = await supabase
          .from('user_reflections')
          .update({
            reflection,
            prayer,
            updated_at: new Date().toISOString()
          })
          .eq('devotional_id', devotionalId)
          .eq('user_id', user.id);

        if (error) throw error;
      } else {
        const { error } = await supabase
          .from('user_reflections')
          .insert({
            devotional_id: devotionalId,
            user_id: user.id,
            reflection,
            prayer
          });

        if (error) throw error;
      }

      setSaveStatus('saved');
      setIsSaved(true);
      return true;
    } catch (error) {
      console.error('Error saving reflection:', error);
      setSaveStatus('error');
      return false;
    }
  };

  useEffect(() => {
    if (!isSaved && (reflection || prayer)) {
      if (autoSaveTimeoutRef.current) {
        clearTimeout(autoSaveTimeoutRef.current);
      }

      autoSaveTimeoutRef.current = setTimeout(() => {
        saveToSupabase();
      }, 2000);
    }

    return () => {
      if (autoSaveTimeoutRef.current) {
        clearTimeout(autoSaveTimeoutRef.current);
      }
    };
  }, [devotionalId, reflection, prayer, isSaved]);

  const handleReflectionChange = (value: string) => {
    setReflection(value);
    setIsSaved(false);
    setSaveStatus('saving');
  };

  const handlePrayerChange = (value: string) => {
    setPrayer(value);
    setIsSaved(false);
    setSaveStatus('saving');
  };

  const handleSave = async () => {
    const success = await saveToSupabase();
    if (success) {
      alert('저장되었습니다!');
    } else {
      alert('저장에 실패했습니다. 다시 시도해주세요.');
    }
  };

  if (!user) {
    return (
      <section className="mb-6">
        <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
          <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
          깨달음과 결단
        </h2>
        <div className="text-center py-8 px-4 bg-amber-50 border border-amber-200 rounded-lg">
          <p className="text-stone-700 mb-2">
            로그인하시면 묵상 내용을 저장하고 모든 기기에서 확인할 수 있습니다.
          </p>
        </div>
      </section>
    );
  }

  if (isLoading) {
    return (
      <section className="mb-6">
        <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
          <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
          깨달음과 결단
        </h2>
        <div className="text-center py-8 text-stone-600">
          불러오는 중...
        </div>
      </section>
    );
  }

  return (
    <section className="mb-6">
      <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
        <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
        깨달음과 결단
        {saveStatus === 'saving' && (
          <span className="text-sm text-stone-500 ml-2 flex items-center gap-1">
            <Cloud className="w-4 h-4 animate-pulse" />
            저장 중...
          </span>
        )}
        {saveStatus === 'saved' && isSaved && (reflection || prayer) && (
          <span className="text-sm text-green-600 ml-2 flex items-center gap-1">
            <Cloud className="w-4 h-4" />
            저장됨
          </span>
        )}
        {saveStatus === 'error' && (
          <span className="text-sm text-red-600 ml-2 flex items-center gap-1">
            <CloudOff className="w-4 h-4" />
            저장 실패
          </span>
        )}
      </h2>
      <div className="space-y-6">
        <div>
          <label className="block text-sm font-semibold text-stone-700 mb-2">
            오늘의 깨달음
          </label>
          <textarea
            value={reflection}
            onChange={(e) => handleReflectionChange(e.target.value)}
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
            onChange={(e) => handlePrayerChange(e.target.value)}
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
