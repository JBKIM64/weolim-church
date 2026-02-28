import { useEffect, useState } from 'react';
import { Lock, CheckCircle, LogIn, LogOut, User } from 'lucide-react';
import { Devotional } from '../types/devotional';
import { supabase } from '../lib/supabase';
import { useAuth } from '../contexts/AuthContext';
import Auth from './Auth';

interface DevotionalListProps {
  onSelectDevotional: (devotional: Devotional, weekNumber: number) => void;
  initialWeek?: number;
}

export default function DevotionalList({ onSelectDevotional, initialWeek = 1 }: DevotionalListProps) {
  const { user, signOut } = useAuth();
  const [devotionals, setDevotionals] = useState<Devotional[]>([]);
  const [loading, setLoading] = useState(true);
  const [currentWeek, setCurrentWeek] = useState(initialWeek);
  const [showAuth, setShowAuth] = useState(false);

  useEffect(() => {
    fetchDevotionals();
  }, []);

  const fetchDevotionals = async () => {
    const { data, error } = await supabase
      .from('devotionals')
      .select('*')
      .order('day_number', { ascending: true });

    if (error) {
      console.error('Error fetching devotionals:', error);
    } else {
      setDevotionals(data || []);
    }
    setLoading(false);
  };

  const isUnlocked = () => {
    return true; // 모든 묵상 잠금 해제
  };

  const isCompleted = (devotionalDate: string) => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const devDate = new Date(devotionalDate);
    devDate.setHours(0, 0, 0, 0);
    return devDate < today;
  };

  const weeks = [1, 2, 3, 4, 5, 6, 7];
  const weekTitles = [
    '1주차: 회개와 자기성찰',
    '2주차: 시험과 순종',
    '3주차: 영적 갈증',
    '4주차: 빛과 진리',
    '5주차: 하나님 나라와 소망',
    '6주차: 예루살렘을 향한 여정',
    '7주차: 고난주간'
  ];

  const weekColors = [
    'rgba(235, 230, 240, 0.5)', // 매우 연한 보라
    'rgba(220, 210, 235, 0.6)', // 연한 보라
    'rgba(205, 190, 230, 0.7)', // 중간 연한 보라
    'rgba(190, 170, 225, 0.75)', // 중간 보라
    'rgba(175, 150, 220, 0.8)', // 중간 진한 보라
    'rgba(160, 130, 215, 0.85)', // 진한 보라
    'rgba(145, 110, 210, 0.9)'  // 매우 진한 보라
  ];

  const weekBackgroundImages = [
    'https://images.pexels.com/photos/6140689/pexels-photo-6140689.jpeg?auto=compress&cs=tinysrgb&w=800', // 1주차: 회개와 자기성찰
    'https://images.pexels.com/photos/7130560/pexels-photo-7130560.jpeg?auto=compress&cs=tinysrgb&w=800', // 2주차: 시험과 순종
    'https://images.pexels.com/photos/7130465/pexels-photo-7130465.jpeg?auto=compress&cs=tinysrgb&w=800', // 3주차: 영적 갈증
    'https://images.pexels.com/photos/6140685/pexels-photo-6140685.jpeg?auto=compress&cs=tinysrgb&w=800', // 4주차: 빛과 진리
    'https://images.pexels.com/photos/6140683/pexels-photo-6140683.jpeg?auto=compress&cs=tinysrgb&w=800', // 5주차: 생명과 부활의 소망
    'https://images.pexels.com/photos/7130557/pexels-photo-7130557.jpeg?auto=compress&cs=tinysrgb&w=800', // 6주차: 예루살렘을 향한 여정
    'https://images.pexels.com/photos/6140687/pexels-photo-6140687.jpeg?auto=compress&cs=tinysrgb&w=800'  // 7주차: 고난주간
  ];


  const weekTitleColors = [
    '#b8a0c9', // 매우 연한 보라 1
    '#ae96bf', // 연한 보라 2
    '#a48cb5', // 연한 보라 3
    '#9a82ab', // 중간 연한 보라 4
    '#9078a1', // 중간 보라 5
    '#866e97', // 중간 진한 보라 6
    '#7c648d'  // 진한 보라 7
  ];

  const weekButtonTextColors = [
    'text-amber-950',  // 1주차 - 매우 진한 색
    'text-amber-900',  // 2주차
    'text-amber-800',  // 3주차
    'text-amber-700',  // 4주차
    'text-amber-700',  // 5주차
    'text-amber-500',  // 6주차
    'text-amber-400'   // 7주차 - 밝은 색
  ];

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-lg text-stone-600">묵상 자료를 불러오는 중...</div>
      </div>
    );
  }

  return (
    <div
      className="min-h-screen bg-cover bg-center bg-fixed relative"
      style={{
        backgroundColor: weekColors[currentWeek - 1]
      }}
    >
      {/* Background image layer - blurred and positioned at bottom third */}
      <div
        className="fixed bottom-0 left-0 right-0 opacity-30"
        style={{
          backgroundImage: `url(${weekBackgroundImages[currentWeek - 1]})`,
          backgroundPosition: 'center center',
          backgroundSize: 'cover',
          height: '33.33%',
          filter: 'blur(3px)',
          maskImage: 'linear-gradient(to top, rgba(0,0,0,1) 0%, rgba(0,0,0,0.8) 50%, rgba(0,0,0,0) 100%)',
          WebkitMaskImage: 'linear-gradient(to top, rgba(0,0,0,1) 0%, rgba(0,0,0,0.8) 50%, rgba(0,0,0,0) 100%)'
        }}
      ></div>

      <div className="max-w-4xl mx-auto px-4 py-8 relative z-10">
        <div
          className="text-center mb-12 rounded-3xl p-12 shadow-2xl relative overflow-hidden"
          style={{
            backgroundImage: 'url(https://images.pexels.com/photos/208315/pexels-photo-208315.jpeg?auto=compress&cs=tinysrgb&w=1200)',
            backgroundSize: 'cover',
            backgroundPosition: 'center'
          }}
        >
          <div className="absolute inset-0 bg-gradient-to-b from-black/60 via-black/50 to-black/70"></div>
          <div className="relative z-10">
            <div className="flex justify-end mb-4">
              {user ? (
                <button
                  onClick={() => signOut()}
                  className="flex items-center gap-2 px-4 py-2 bg-white/10 hover:bg-white/20 text-white rounded-lg transition-colors backdrop-blur-sm"
                >
                  <User size={18} />
                  <span className="text-sm">{user.email}</span>
                  <LogOut size={18} />
                </button>
              ) : (
                <button
                  onClick={() => setShowAuth(true)}
                  className="flex items-center gap-2 px-4 py-2 bg-white/10 hover:bg-white/20 text-white rounded-lg transition-colors backdrop-blur-sm"
                >
                  <LogIn size={18} />
                  <span className="text-sm">로그인</span>
                </button>
              )}
            </div>
            <p className="text-2xl md:text-4xl text-amber-200 mb-3 font-medium tracking-wider" style={{ fontFamily: '"Noto Serif KR", "KoPubWorld Batang", "Nanum Myeongjo", Georgia, serif' }}>
              2026 사순절 묵상
            </p>
            <h1 className="text-5xl md:text-6xl font-black text-white mb-4 tracking-tight" style={{ fontFamily: 'sans-serif' }}>
              십자가의 길을 걷다
            </h1>
            <div className="flex items-center justify-center gap-1 mt-6">
              <img
                src="/PCK_Logo(컬러-투명).png"
                alt="PCK Logo"
                loading="lazy"
                width="32"
                height="32"
                className="h-8 w-auto object-contain opacity-40"
              />
              <p className="text-xl text-stone-100 font-medium">내곡초원교회</p>
            </div>
          </div>
        </div>

        <div className="mb-8 flex gap-2 overflow-x-auto pb-4">
          {weeks.map((week) => (
            <button
              key={week}
              onClick={() => setCurrentWeek(week)}
              className={`px-4 py-2 rounded-lg whitespace-nowrap transition-all ${
                currentWeek === week
                  ? `bg-gradient-to-r from-amber-900/25 to-amber-950/30 ${weekButtonTextColors[week - 1]} font-bold shadow-lg border border-amber-900/20`
                  : 'bg-white text-stone-700 hover:bg-amber-100'
              }`}
            >
              {week}주차
            </button>
          ))}
        </div>

        <div className="bg-white/90 backdrop-blur-md rounded-2xl shadow-2xl p-8 mb-8 border border-amber-200">
          <div className="flex items-center gap-2 mb-6">
            <div className="flex-shrink-0">
              {currentWeek === 1 && (
                <svg className="w-16 h-16" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M30 70 Q40 65 50 70 Q60 75 70 70" stroke="#5A829C" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M32 75 Q42 70 52 75 Q62 80 72 75" stroke="#5A829C" strokeWidth="2.5" strokeLinecap="round" opacity="0.8"/>
                  <circle cx="50" cy="28" r="6" stroke="#6B5437" strokeWidth="3" fill="none"/>
                  <path d="M50 34 L50 58" stroke="#6B5437" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M42 42 L50 42 L58 42" stroke="#6B5437" strokeWidth="3" strokeLinecap="round"/>
                </svg>
              )}
              {currentWeek === 2 && (
                <svg className="w-16 h-16" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M50 25 L50 70" stroke="#6B5437" strokeWidth="4" strokeLinecap="round"/>
                  <path d="M30 40 L70 40" stroke="#6B5437" strokeWidth="4" strokeLinecap="round"/>
                  <path d="M45 45 Q43 50 40 55" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M55 45 Q57 50 60 55" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round"/>
                  <circle cx="48" cy="35" r="2" fill="#6B5437"/>
                  <circle cx="52" cy="35" r="2" fill="#6B5437"/>
                </svg>
              )}
              {currentWeek === 3 && (
                <svg className="w-16 h-16" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="50" cy="30" r="7" stroke="#8B6F47" strokeWidth="3" fill="none"/>
                  <path d="M50 37 L50 65" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M50 45 Q40 48 32 50" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M50 45 Q60 48 68 50" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M45 65 Q50 72 55 65" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round" fill="none"/>
                  <path d="M35 55 Q40 60 42 58" stroke="#5A829C" strokeWidth="2.5" strokeLinecap="round" opacity="0.9"/>
                </svg>
              )}
              {currentWeek === 4 && (
                <svg className="w-16 h-16" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M50 20 L50 32" stroke="#C89B1C" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M50 68 L50 80" stroke="#C89B1C" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M20 50 L32 50" stroke="#C89B1C" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M68 50 L80 50" stroke="#C89B1C" strokeWidth="3" strokeLinecap="round"/>
                  <circle cx="50" cy="42" r="6" stroke="#6B5437" strokeWidth="3" fill="none"/>
                  <path d="M50 48 L50 60" stroke="#6B5437" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M42 52 L58 52" stroke="#6B5437" strokeWidth="3" strokeLinecap="round"/>
                </svg>
              )}
              {currentWeek === 5 && (
                <svg className="w-16 h-16" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M50 25 L50 72" stroke="#6B5437" strokeWidth="4" strokeLinecap="round"/>
                  <path d="M28 42 L72 42" stroke="#6B5437" strokeWidth="4" strokeLinecap="round"/>
                  <circle cx="50" cy="32" r="5" stroke="#8B6F47" strokeWidth="3" fill="none"/>
                  <path d="M58 58 Q62 65 60 72" stroke="#5A7A1C" strokeWidth="3" strokeLinecap="round" fill="none"/>
                  <path d="M60 65 Q65 68 68 70" stroke="#5A7A1C" strokeWidth="2.5" strokeLinecap="round"/>
                  <circle cx="68" cy="70" r="2.5" fill="#5A7A1C" opacity="0.8"/>
                </svg>
              )}
              {currentWeek === 6 && (
                <svg className="w-16 h-16" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M20 75 Q50 65 80 75" stroke="#7D6D5C" strokeWidth="3" strokeLinecap="round" fill="none"/>
                  <path d="M48 35 L48 68" stroke="#6B5437" strokeWidth="3.5" strokeLinecap="round"/>
                  <path d="M35 48 L61 48" stroke="#6B5437" strokeWidth="3.5" strokeLinecap="round"/>
                  <circle cx="48" cy="32" r="4" stroke="#8B6F47" strokeWidth="2.5" fill="none"/>
                  <path d="M25 70 L30 75 L35 72" stroke="#5A7A1C" strokeWidth="2.5" strokeLinecap="round" fill="none"/>
                </svg>
              )}
              {currentWeek === 7 && (
                <svg className="w-16 h-16" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="50" cy="50" r="28" stroke="#C89B1C" strokeWidth="2.5" strokeDasharray="4 3" opacity="0.7"/>
                  <path d="M50 22 L50 75" stroke="#4D3A25" strokeWidth="5" strokeLinecap="round"/>
                  <path d="M25 47 L75 47" stroke="#4D3A25" strokeWidth="5" strokeLinecap="round"/>
                  <circle cx="50" cy="36" r="5" stroke="#6B5437" strokeWidth="3" fill="none"/>
                  <path d="M46 52 Q42 58 38 62" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round"/>
                  <path d="M54 52 Q58 58 62 62" stroke="#8B6F47" strokeWidth="3" strokeLinecap="round"/>
                </svg>
              )}
            </div>
            <h2
              className="text-3xl font-bold"
              style={{ color: weekTitleColors[currentWeek - 1] }}
            >
              {weekTitles[currentWeek - 1]}
            </h2>
          </div>

          <div className="space-y-4">
            {devotionals
              .filter((d) => d.week_number === currentWeek)
              .map((devotional) => {
                const unlocked = isUnlocked();
                const completed = isCompleted(devotional.date);
                const date = new Date(devotional.date);
                const dateStr = `${date.getMonth() + 1}/${date.getDate()}`;
                const dayNames = ['일', '월', '화', '수', '목', '금', '토'];
                const dayName = dayNames[date.getDay()];

                return (
                  <button
                    key={devotional.id}
                    onClick={() => unlocked && onSelectDevotional(devotional, currentWeek)}
                    disabled={!unlocked}
                    className={`w-full text-left p-6 rounded-xl transition-all ${
                      unlocked
                        ? 'bg-gradient-to-r from-amber-900/10 to-amber-950/15 hover:shadow-lg hover:scale-[1.02] cursor-pointer border border-amber-900/10'
                        : 'bg-stone-100 cursor-not-allowed opacity-60'
                    }`}
                  >
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <div className="flex items-center gap-3 mb-2">
                          <span className="text-base font-semibold text-amber-900 bg-amber-900/10 px-3 py-1 rounded-full">
                            {dateStr} ({dayName})
                          </span>
                          {completed && unlocked && (
                            <CheckCircle className="w-5 h-5 text-green-300" />
                          )}
                          {!unlocked && <Lock className="w-5 h-5 text-stone-400" />}
                        </div>
                        <h3 className="text-xl font-bold text-amber-900 mb-2">
                          {unlocked ? devotional.title : '잠긴 묵상'}
                        </h3>
                        {unlocked && (
                          <p className="text-base text-amber-800">
                            {devotional.scripture_reference}
                          </p>
                        )}
                      </div>
                    </div>
                  </button>
                );
              })}
          </div>
        </div>
      </div>

      {showAuth && <Auth onClose={() => setShowAuth(false)} />}
    </div>
  );
}
