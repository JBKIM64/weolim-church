import { ArrowLeft, Video } from 'lucide-react';
import { Devotional } from '../types/devotional';
import MusicSection from './MusicSection';
import ReflectionSection from './ReflectionSection';

interface DevotionalDetailProps {
  devotional: Devotional;
  onBack: () => void;
  weekNumber: number;
}

export default function DevotionalDetail({ devotional, onBack }: DevotionalDetailProps) {
  const date = new Date(devotional.date);
  const dateStr = `${date.getMonth() + 1}월 ${date.getDate()}일`;
  const dayNames = ['일', '월', '화', '수', '목', '금', '토'];
  const dayName = dayNames[date.getDay()];

  const getBackgroundImage = () => {
    const dayNum = devotional.day_number;

    const holyWeekImages: { [key: number]: string } = {
      41: 'https://images.pexels.com/photos/7218526/pexels-photo-7218526.jpeg?auto=compress&cs=tinysrgb&w=1200',
      42: 'https://images.pexels.com/photos/3845132/pexels-photo-3845132.jpeg?auto=compress&cs=tinysrgb&w=1200',
      43: 'https://images.pexels.com/photos/9817098/pexels-photo-9817098.jpeg?auto=compress&cs=tinysrgb&w=1200',
      44: 'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg?auto=compress&cs=tinysrgb&w=1200',
      45: 'https://images.pexels.com/photos/208315/pexels-photo-208315.jpeg?auto=compress&cs=tinysrgb&w=1200',
      46: 'https://images.pexels.com/photos/1524232/pexels-photo-1524232.jpeg?auto=compress&cs=tinysrgb&w=1200',
      47: 'https://images.pexels.com/photos/1166989/pexels-photo-1166989.jpeg?auto=compress&cs=tinysrgb&w=1200'
    };

    if (devotional.is_holy_week && holyWeekImages[dayNum]) {
      return holyWeekImages[dayNum];
    }

    const weekImages = [
      'https://images.pexels.com/photos/4079038/pexels-photo-4079038.jpeg?auto=compress&cs=tinysrgb&w=1200',
      'https://images.pexels.com/photos/1629236/pexels-photo-1629236.jpeg?auto=compress&cs=tinysrgb&w=1200',
      'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&w=1200',
      'https://images.pexels.com/photos/1108572/pexels-photo-1108572.jpeg?auto=compress&cs=tinysrgb&w=1200',
      'https://images.pexels.com/photos/1564506/pexels-photo-1564506.jpeg?auto=compress&cs=tinysrgb&w=1200',
      'https://images.pexels.com/photos/2387532/pexels-photo-2387532.jpeg?auto=compress&cs=tinysrgb&w=1200'
    ];

    return weekImages[devotional.week_number - 1] || weekImages[0];
  };

  return (
    <div
      className="min-h-screen bg-cover bg-center bg-fixed relative"
      style={{
        backgroundImage: `linear-gradient(rgba(255, 248, 240, 0.94), rgba(255, 248, 240, 0.94)), url(${getBackgroundImage()})`
      }}
    >
      <div className="max-w-3xl mx-auto px-4 py-8 relative z-10">
        <button
          onClick={onBack}
          className="flex items-center gap-2 text-stone-700 hover:text-amber-700 mb-6 transition-colors bg-white/80 backdrop-blur px-4 py-2 rounded-lg shadow-md hover:shadow-lg"
        >
          <ArrowLeft className="w-5 h-5" />
          <span className="font-semibold">목록으로</span>
        </button>

        <div className="bg-white/95 backdrop-blur-md rounded-2xl shadow-2xl p-8 md:p-12 border border-amber-200">
          <div className="mb-8 text-center border-b border-stone-200 pb-6">
            <div className="text-lg text-amber-700 font-semibold mb-3">
              {dateStr} ({dayName}) · {devotional.day_number}일차
            </div>
            <h1 className="text-3xl md:text-4xl font-bold text-amber-900 mb-5" style={{ fontFamily: 'serif' }}>
              {devotional.title}
            </h1>
            <div className="text-xl md:text-2xl text-amber-700 font-semibold">
              {devotional.scripture_reference}
            </div>
          </div>

          <section className="mb-7">
            <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
              <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
              오늘의 말씀
            </h2>
            <div className="bg-amber-50 border-l-4 border-[#b8927d] p-6 rounded-r-lg">
              <p className="text-stone-700 leading-relaxed text-lg" style={{ fontFamily: 'Noto Serif KR, serif' }}>
                "{devotional.scripture_text}"
              </p>
            </div>
          </section>

          <section className="mb-7">
            <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
              <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
              말씀 필사
            </h2>
            <div className="bg-stone-50 p-6 rounded-lg border-2 border-dashed border-stone-300">
              <textarea
                className="w-full h-32 p-4 bg-white border border-stone-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500 resize-none"
                placeholder="오늘의 말씀을 직접 적어보세요..."
              />
            </div>
          </section>

          <section className="mb-7">
            <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
              <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
              말씀 이해하기
            </h2>
            <div className="text-stone-700 leading-relaxed space-y-4">
              {devotional.explanation.split('\n').map((para, idx) => (
                <p key={idx}>{para}</p>
              ))}
            </div>
          </section>

          <section className="mb-7">
            <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
              <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
              매일의 묵상
            </h2>
            <div className="text-stone-700 leading-relaxed space-y-4">
              {devotional.illustration.split('\n').map((para, idx) => (
                <p key={idx}>{para}</p>
              ))}
            </div>
          </section>

          <section className="mb-7">
            <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
              <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
              실천 사항
            </h2>
            <div className="bg-gradient-to-r from-amber-50 to-stone-50 p-6 rounded-lg border border-amber-200/50 space-y-1">
              {devotional.action_items.map((item, idx) => (
                <div
                  key={idx}
                  className="flex items-start gap-3"
                >
                  <div className="flex-shrink-0 w-6 h-6 rounded-full bg-[#b8927d] text-white flex items-center justify-center text-sm font-bold mt-0.5">
                    {idx + 1}
                  </div>
                  <p className="text-stone-700 flex-1 leading-[1.3]">{item}</p>
                </div>
              ))}
            </div>
          </section>

          <section className="mb-7">
            <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
              <span className="w-1 h-8 bg-[#b8927d] rounded"></span>
              기도 제목
            </h2>
            <div className="bg-stone-50 p-6 rounded-lg border border-stone-200 space-y-1">
              {devotional.prayer_topics.map((topic, idx) => (
                <div
                  key={idx}
                  className="flex items-start gap-3"
                >
                  <div className="text-amber-600 text-xl">🙏</div>
                  <p className="text-stone-700 flex-1 leading-[1.3]">{topic}</p>
                </div>
              ))}
            </div>
          </section>

          {devotional.today_hymn && (
            <MusicSection
              hymn1={devotional.today_hymn}
              hymn2={devotional.today_hymn_2 || undefined}
            />
          )}

          {devotional.special_video_url && (
            <section className="mb-7">
              <h2 className="text-2xl font-bold text-stone-800 mb-5 flex items-center gap-2">
                <Video className="w-6 h-6 text-rose-600" />
                {devotional.special_video_title || '특별 영상'}
              </h2>
              <div className="bg-gradient-to-r from-rose-100 to-pink-50 rounded-lg overflow-hidden border border-rose-200">
                <div className="aspect-video">
                  <iframe
                    src={`https://www.youtube.com/embed/${new URL(devotional.special_video_url).searchParams.get('v') || devotional.special_video_url.split('/').pop()}?rel=0&modestbranding=1`}
                    title={devotional.special_video_title || '특별 영상'}
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                    className="w-full h-full"
                  />
                </div>
              </div>
            </section>
          )}

          <ReflectionSection devotionalId={devotional.id} />

          <div className="flex items-center justify-center gap-1 pt-6 border-t border-stone-200">
            <img
              src="/PCK_Logo(컬러-투명).png"
              alt="PCK Logo"
              className="h-5 w-auto object-contain opacity-40"
            />
            <span className="text-sm text-stone-500">내곡초원교회 | 2026 사순절 묵상</span>
          </div>

          <div className="flex justify-end mt-6">
            <button
              onClick={onBack}
              className="flex items-center gap-2 text-stone-700 hover:text-amber-700 transition-colors bg-white/80 backdrop-blur px-6 py-3 rounded-lg shadow-md hover:shadow-lg"
            >
              <ArrowLeft className="w-5 h-5" />
              <span className="font-semibold">목록으로</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
