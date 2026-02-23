# 2026 사순절 묵상 앱

내곡초원교회를 위한 사순절 묵상 웹 애플리케이션입니다.

## 배포 방법

### Vercel로 배포 (추천)

1. **Vercel 계정 만들기**
   - https://vercel.com 방문
   - GitHub 계정으로 로그인

2. **GitHub에 프로젝트 업로드**
   - 이 프로젝트를 GitHub 저장소에 푸시

3. **Vercel에서 배포**
   - Vercel 대시보드에서 "Add New Project" 클릭
   - GitHub 저장소 선택
   - 환경 변수 설정:
     - `VITE_SUPABASE_URL`: Supabase 프로젝트 URL
     - `VITE_SUPABASE_ANON_KEY`: Supabase Anon Key
   - "Deploy" 클릭

4. **배포 완료!**
   - 몇 분 후 `https://your-app.vercel.app` 형태의 URL 생성
   - 이 URL을 교인들과 공유

### 환경 변수

프로젝트의 `.env` 파일에 있는 다음 변수들을 Vercel에 설정해야 합니다:

```
VITE_SUPABASE_URL=your-supabase-url
VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
```

## 기능

- 47일간의 사순절 묵상 (2월 18일 ~ 4월 5일)
- 주간별 테마와 배경 이미지
- 날짜 기반 잠금 기능
- 찬송가/복음송 링크
- 개인 묵상 노트 저장
- 반응형 디자인

## 기술 스택

- React + TypeScript
- Vite
- Tailwind CSS
- Supabase
- Lucide React Icons
