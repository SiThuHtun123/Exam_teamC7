// AboutDeveloper.jsx — Nekochess UI Kit

const SKILLS = [
  { category: 'Languages', accent: '#f95984', icon: 'fa-code', items: ['Python', 'JavaScript', 'SQL', 'HTML', 'CSS'] },
  { category: 'Frontend', accent: '#60a5fa', icon: 'fa-display', items: ['React', 'React Router', 'Chess.js', 'React Chessboard', 'Google OAuth'] },
  { category: 'Backend', accent: '#34d399', icon: 'fa-server', items: ['Django', 'Django REST Framework', 'JWT Auth', 'Celery', 'Redis', 'PostgreSQL', 'AWS'] },
  { category: 'AI / ML / Chess', accent: '#a78bfa', icon: 'fa-brain', items: ['Stockfish (UCI)', 'K-Means Clustering', 'Player Style Analysis', 'ELO Algorithm', 'NumPy', 'Pandas'] },
  { category: 'External APIs', accent: '#fbbf24', icon: 'fa-plug', items: ['Chess.com API', 'Lichess API'] },
];

const PROJECTS = [
  { accent: '#f95984', icon: 'fa-chess', name: 'Nekochess', year: '2026 – Present', description: 'A full-stack online chess platform where players can generate personalized bots from real game histories, climb skill-based divisions, collect custom piece sets, solve puzzles, and analyze their games.', tags: ['React', 'Django', 'PostgreSQL', 'Redis', 'Celery', 'Stockfish', 'ML'] },
  { accent: '#60a5fa', icon: 'fa-capsules', name: 'Health Supplements SaaS Platform', year: '2020 (Age 17)', description: 'My first large-scale project. A SaaS website built for a health supplements company, featuring product management, user accounts, and an e-commerce flow. Built and shipped entirely solo at 17 years old.', tags: ['Web Development', 'SaaS', 'E-Commerce'] },
];

const ACHIEVEMENTS = [
  { medal: 'gold', icon: 'fa-trophy', color: '#fbbf24', bg: 'rgba(251,191,36,0.04)', border: 'rgba(251,191,36,0.2)', text: '1st Place — School Competitive Programming Contest' },
  { medal: 'silver', icon: 'fa-medal', color: '#94a3b8', bg: 'rgba(148,163,184,0.04)', border: 'rgba(148,163,184,0.2)', text: '2nd Place — School Competitive Programming Contest (2nd edition)' },
  { medal: 'bronze', icon: 'fa-award', color: '#f97316', bg: 'rgba(249,115,22,0.04)', border: 'rgba(249,115,22,0.2)', text: '3rd Place — Ohara Nationwide Competitive Programming Contest (1,400+ contestants)' },
];

function AboutDeveloper({ navigate }) {
  const [lang, setLang] = React.useState('en');
  const isJa = lang === 'ja';

  const sectionTitle = (text) => ({
    fontSize: 18, fontWeight: 700, color: '#fff', margin: '0 0 20px',
    paddingBottom: 10, borderBottom: '1px solid rgba(255,255,255,0.07)',
  });

  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column', background: '#0f0f0f' }}>
      <window.Navbar navigate={navigate} />
      <main style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '40px 24px 80px', maxWidth: 860, width: '100%', margin: '0 auto' }}>

        {/* Topbar */}
        <div style={{ width: '100%', display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 40 }}>
          <button onClick={() => navigate('/about')} style={{ display: 'inline-flex', alignItems: 'center', gap: 8, background: 'none', border: '1px solid rgba(255,255,255,0.1)', borderRadius: 10, padding: '8px 14px', color: 'rgba(255,255,255,0.5)', fontSize: 13, fontFamily: 'inherit', cursor: 'pointer' }}>
            <i className="fa-solid fa-arrow-left"></i><span>{isJa ? 'Aboutに戻る' : 'Back to About'}</span>
          </button>
          <button onClick={() => setLang(l => l === 'en' ? 'ja' : 'en')} style={{ display: 'inline-flex', alignItems: 'center', gap: 7, background: 'rgba(167,139,250,0.08)', border: '1px solid rgba(167,139,250,0.25)', borderRadius: 10, padding: '8px 14px', color: '#a78bfa', fontSize: 13, fontWeight: 600, fontFamily: 'inherit', cursor: 'pointer' }}>
            <i className="fa-solid fa-language"></i><span>{isJa ? 'English' : '日本語'}</span>
          </button>
        </div>

        {/* Hero */}
        <div style={{ width: '100%', display: 'flex', alignItems: 'center', gap: 36, marginBottom: 40, padding: 36, background: 'linear-gradient(135deg,rgba(249,89,132,0.05) 0%,rgba(10,10,10,0.95) 100%)', border: '1px solid rgba(249,89,132,0.15)', borderRadius: 20, position: 'relative', overflow: 'hidden' }}>
          <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: 2, background: 'linear-gradient(90deg,#f95984,#a78bfa)' }}></div>
          {/* Avatar placeholder */}
          <div style={{ position: 'relative', flexShrink: 0 }}>
            <div style={{ width: 120, height: 120, borderRadius: '50%', background: 'linear-gradient(135deg,rgba(249,89,132,0.2),rgba(167,139,250,0.2))', border: '3px solid rgba(249,89,132,0.4)', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 48, color: 'rgba(249,89,132,0.6)' }}>
              <i className="fa-solid fa-user-astronaut"></i>
            </div>
          </div>
          <div style={{ flex: 1 }}>
            <div style={{ display: 'inline-flex', alignItems: 'center', gap: 7, fontSize: 12, fontWeight: 600, color: '#f95984', marginBottom: 8 }}>
              <i className="fa-solid fa-user-astronaut"></i>
              <span>{isJa ? '開発者について' : 'About the Developer'}</span>
            </div>
            <h1 style={{ fontSize: 34, fontWeight: 800, color: '#fff', margin: '0 0 8px', letterSpacing: '-0.5px' }}>{isJa ? 'シー・トゥー・トゥン' : 'SI THU TUN'}</h1>
            <p style={{ fontSize: 13, color: 'rgba(255,255,255,0.4)', margin: 0 }}>{isJa ? 'フルスタック開発者 · チェス愛好家 · 世界を旅する人' : 'Full-Stack Developer · Chess Enthusiast · World Traveler'}</p>
          </div>
        </div>

        {/* Bio */}
        <div style={{ width: '100%', marginBottom: 48, display: 'flex', flexDirection: 'column', gap: 14 }}>
          {(isJa ? [
            '東京情報クリエイター工学院専門学校でコンピュータサイエンスを学んでいます。プログラミング、チェス、そして価値あるものを作ることに情熱を注いでいます。16歳からコーディングを始め、17歳にはサプリメント会社向けのSaaSプラットフォームをリリースしました。',
            '合気道の黒帯を持ち、フットボール観戦（アーセナルの熱烈なサポーター）が好きで、旅行への深い愛情を持っています。地球上のあらゆる場所を訪れることが目標です。',
            'Nekochessは現在最大のプロジェクトです。機械学習、実際のプレイヤーのゲームデータ、そして独自のボット生成エンジンによって動くフルスタックチェスプラットフォームです。'
          ] : [
            "I'm a Computer Science student at Tokyo Joho Creator Kogakuin Senmon Gakko with a passion for programming, chess, and building things that matter. I started coding at 16 and by 17 had already shipped my first major project — a SaaS platform for a health supplements company.",
            "I hold a black belt in Aikido, love watching football (proud Arsenal supporter), and have a deep love for travel. My goal is to visit every place on Earth — and if humanity reaches the stars, beyond it too.",
            "Nekochess is my biggest project to date: a full-stack chess platform powered by machine learning, real player game data, and a custom bot generation engine built entirely from scratch."
          ]).map((para, i) => (
            <p key={i} style={{ fontSize: 15, color: 'rgba(255,255,255,0.55)', lineHeight: 1.85, margin: 0 }}>{para}</p>
          ))}
        </div>

        {/* Skills */}
        <div style={{ width: '100%', marginBottom: 48 }}>
          <h2 style={sectionTitle()}>{isJa ? 'スキル・技術スタック' : 'Skills & Tech Stack'}</h2>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2,1fr)', gap: 14 }}>
            {SKILLS.map(g => (
              <div key={g.category} style={{ background: 'rgba(255,255,255,0.02)', border: '1px solid rgba(255,255,255,0.07)', borderRadius: 14, padding: '18px', position: 'relative', overflow: 'hidden' }}>
                <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: 3, background: g.accent, borderRadius: '3px 0 0 3px' }}></div>
                <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 12 }}>
                  <div style={{ width: 32, height: 32, borderRadius: 8, background: `color-mix(in srgb, ${g.accent} 12%, transparent)`, border: `1px solid color-mix(in srgb, ${g.accent} 30%, transparent)`, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 14, color: g.accent }}>
                    <i className={`fa-solid ${g.icon}`}></i>
                  </div>
                  <span style={{ fontSize: 13, fontWeight: 700, color: '#fff' }}>{g.category}</span>
                </div>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6 }}>
                  {g.items.map(item => (
                    <span key={item} style={{ fontSize: 11, fontWeight: 500, padding: '4px 9px', borderRadius: 20, background: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.1)', color: 'rgba(255,255,255,0.55)' }}>{item}</span>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Projects */}
        <div style={{ width: '100%', marginBottom: 48 }}>
          <h2 style={sectionTitle()}>{isJa ? '最も誇りに思うプロジェクト' : "Projects I'm Most Proud Of"}</h2>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
            {PROJECTS.map(p => (
              <div key={p.name} style={{ background: 'rgba(255,255,255,0.02)', border: '1px solid rgba(255,255,255,0.07)', borderRadius: 16, padding: '22px', position: 'relative', overflow: 'hidden' }}>
                <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: 3, background: p.accent, borderRadius: '3px 0 0 3px' }}></div>
                <div style={{ display: 'flex', alignItems: 'center', gap: 14, marginBottom: 12 }}>
                  <div style={{ width: 42, height: 42, flexShrink: 0, borderRadius: 11, background: `color-mix(in srgb, ${p.accent} 12%, transparent)`, border: `1px solid color-mix(in srgb, ${p.accent} 30%, transparent)`, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 17, color: p.accent }}>
                    <i className={`fa-solid ${p.icon}`}></i>
                  </div>
                  <div>
                    <div style={{ fontSize: 15, fontWeight: 700, color: '#fff' }}>{p.name}</div>
                    <div style={{ fontSize: 12, color: 'rgba(255,255,255,0.35)' }}>{p.year}</div>
                  </div>
                </div>
                <p style={{ fontSize: 14, color: 'rgba(255,255,255,0.5)', lineHeight: 1.8, margin: '0 0 14px' }}>{p.description}</p>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6 }}>
                  {p.tags.map(t => (
                    <span key={t} style={{ fontSize: 11, fontWeight: 600, padding: '3px 10px', borderRadius: 20, background: `color-mix(in srgb, ${p.accent} 10%, transparent)`, border: `1px solid color-mix(in srgb, ${p.accent} 25%, transparent)`, color: p.accent }}>{t}</span>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Education */}
        <div style={{ width: '100%', marginBottom: 48 }}>
          <h2 style={sectionTitle()}>{isJa ? '学歴' : 'Education'}</h2>
          <div style={{ display: 'flex', alignItems: 'center', gap: 18, background: 'rgba(255,255,255,0.02)', border: '1px solid rgba(255,255,255,0.07)', borderRadius: 14, padding: '20px 22px', marginBottom: 14 }}>
            <div style={{ width: 48, height: 48, flexShrink: 0, borderRadius: 12, background: 'rgba(251,191,36,0.1)', border: '1px solid rgba(251,191,36,0.25)', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 20, color: '#fbbf24' }}>
              <i className="fa-solid fa-graduation-cap"></i>
            </div>
            <div>
              <div style={{ fontSize: 15, fontWeight: 700, color: '#fff', marginBottom: 4 }}>東京情報クリエイター工学院専門学校</div>
              <div style={{ fontSize: 13, color: 'rgba(255,255,255,0.45)', marginBottom: 3 }}>{isJa ? 'コンピュータサイエンス' : 'Computer Science'}</div>
              <div style={{ fontSize: 12, color: 'rgba(255,255,255,0.3)', display: 'flex', alignItems: 'center', gap: 5 }}>
                <i className="fa-solid fa-location-dot"></i>{isJa ? '東京、日本' : 'Tokyo, Japan'}
              </div>
            </div>
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {ACHIEVEMENTS.map((a, i) => (
              <div key={i} style={{ display: 'flex', alignItems: 'center', gap: 12, padding: '12px 16px', background: a.bg, border: `1px solid ${a.border}`, borderRadius: 12 }}>
                <i className={`fa-solid ${a.icon}`} style={{ fontSize: 15, color: a.color, flexShrink: 0 }}></i>
                <span style={{ fontSize: 13, color: 'rgba(255,255,255,0.6)', lineHeight: 1.5 }}>{isJa ? ['1位 — 校内プログラミングコンテスト','2位 — 校内プログラミングコンテスト（第2回）','3位 — 大原全国プログラミングコンテスト（参加者1,400名以上）'][i] : a.text}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Contact */}
        <div style={{ width: '100%', textAlign: 'center', padding: '40px 24px', background: 'linear-gradient(135deg,rgba(249,89,132,0.05) 0%,rgba(10,10,10,0.95) 100%)', border: '1px solid rgba(249,89,132,0.12)', borderRadius: 20, position: 'relative', overflow: 'hidden' }}>
          <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: 2, background: 'linear-gradient(90deg,#f95984,#a78bfa)' }}></div>
          <h2 style={{ fontSize: 22, fontWeight: 800, color: '#fff', margin: '0 0 8px' }}>{isJa ? 'お問い合わせ' : 'Get in Touch'}</h2>
          <p style={{ fontSize: 14, color: 'rgba(255,255,255,0.4)', margin: '0 0 24px' }}>{isJa ? '機会、コラボレーション、会話など、お気軽にどうぞ。' : 'Open to opportunities, collaborations, and conversations.'}</p>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 12, flexWrap: 'wrap' }}>
            <button style={{ display: 'inline-flex', alignItems: 'center', gap: 8, background: 'rgba(249,89,132,0.12)', border: '1px solid rgba(249,89,132,0.35)', borderRadius: 12, padding: '12px 22px', color: '#f95984', fontSize: 14, fontWeight: 600, fontFamily: 'inherit', cursor: 'pointer' }}>
              <i className="fa-solid fa-envelope"></i><span>{isJa ? 'お問い合わせ' : 'Contact Me'}</span>
            </button>
            <a href="https://www.linkedin.com/in/si-thu-tun-9a19193a7/" target="_blank" rel="noopener noreferrer" style={{ display: 'inline-flex', alignItems: 'center', gap: 8, background: 'rgba(10,102,194,0.1)', border: '1px solid rgba(10,102,194,0.35)', borderRadius: 12, padding: '12px 22px', color: '#60a5fa', fontSize: 14, fontWeight: 600, textDecoration: 'none' }}>
              <i className="fa-brands fa-linkedin"></i><span>LinkedIn</span>
            </a>
          </div>
        </div>
      </main>
      <window.Footer />
    </div>
  );
}

Object.assign(window, { AboutDeveloper });
