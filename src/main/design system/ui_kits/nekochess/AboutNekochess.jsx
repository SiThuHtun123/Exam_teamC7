// AboutNekochess.jsx — Nekochess UI Kit

const FEATURES = [
  { icon: 'fa-users', title: 'PvPB — Player vs Player Bot', description: "The heart of Nekochess. Play against a bot generated from another real player's game history. Every opponent feels unique and human-like.", accent: '#f95984' },
  { icon: 'fa-robot', title: 'PvB — Player vs Bot', description: 'Challenge a roster of built-in bots with distinct personalities and difficulty levels — from beginner-friendly to seriously tough.', accent: '#a78bfa' },
  { icon: 'fa-trophy', title: 'Divisions & ELO', description: 'Climb through skill-based divisions by winning games and raising your ELO. From M3GAN all the way up to Legion — where do you rank?', accent: '#fbbf24' },
  { icon: 'fa-puzzle-piece', title: 'Puzzles & Quizzes', description: 'Sharpen your chess instincts with tactical puzzles and interactive quizzes. Test your pattern recognition, evaluation, and board vision.', accent: '#34d399' },
  { icon: 'fa-box-open', title: 'Custom Pieces & Collection', description: 'Collect unique chess piece designs from themed blind box series and equip them to personalize every game you play.', accent: '#60a5fa' },
  { icon: 'fa-magnifying-glass-chart', title: 'Game Analysis', description: 'Review your games move by move with engine-powered analysis. Spot blunders, find missed wins, and understand where the game turned.', accent: '#fb923c' },
];

function AboutNekochess({ navigate }) {
  const [lang, setLang] = React.useState('en');

  const s = {
    page: { minHeight: '100vh', display: 'flex', flexDirection: 'column', background: '#0f0f0f' },
    main: { flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '40px 24px 80px', maxWidth: 1000, width: '100%', margin: '0 auto' },
    topbar: { width: '100%', display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 32 },
    breadcrumb: { display: 'inline-flex', alignItems: 'center', gap: 8, background: 'none', border: '1px solid rgba(255,255,255,0.1)', borderRadius: 10, padding: '8px 14px', color: 'rgba(255,255,255,0.5)', fontSize: 13, fontFamily: 'inherit', cursor: 'pointer' },
    langBtn: { display: 'inline-flex', alignItems: 'center', gap: 7, background: 'rgba(167,139,250,0.08)', border: '1px solid rgba(167,139,250,0.25)', borderRadius: 10, padding: '8px 14px', color: '#a78bfa', fontSize: 13, fontWeight: 600, fontFamily: 'inherit', cursor: 'pointer' },
    hero: { textAlign: 'center', marginBottom: 40, width: '100%' },
    eyebrow: { display: 'inline-flex', alignItems: 'center', gap: 8, background: 'rgba(249,89,132,0.1)', border: '1px solid rgba(249,89,132,0.25)', borderRadius: 20, padding: '6px 16px', fontSize: 13, fontWeight: 600, color: '#f95984', marginBottom: 20, letterSpacing: '0.3px' },
    heroTitle: { fontSize: 42, fontWeight: 800, color: '#fff', margin: '0 0 14px', letterSpacing: '-0.5px' },
    heroSub: { fontSize: 16, color: 'rgba(255,255,255,0.45)', margin: 0, lineHeight: 1.6 },
    bodyText: { fontSize: 15, color: 'rgba(255,255,255,0.6)', lineHeight: 1.8, margin: '0 0 14px', width: '100%' },
    softwareCard: { width: '100%', background: 'linear-gradient(135deg, rgba(167,139,250,0.06) 0%, rgba(10,10,10,0.95) 100%)', border: '1px solid rgba(167,139,250,0.25)', borderRadius: 16, padding: '24px', marginBottom: 28, position: 'relative', overflow: 'hidden' },
    betaCard: { width: '100%', background: 'linear-gradient(135deg, rgba(251,191,36,0.06) 0%, rgba(10,10,10,0.95) 100%)', border: '1px solid rgba(251,191,36,0.25)', borderRadius: 16, padding: '28px', marginBottom: 48, position: 'relative', overflow: 'hidden' },
    featuresGrid: { display: 'grid', gridTemplateColumns: 'repeat(2,1fr)', gap: 16, width: '100%' },
    featCard: { display: 'flex', gap: 16, padding: 20, background: 'rgba(255,255,255,0.02)', border: '1px solid rgba(255,255,255,0.07)', borderRadius: 14, position: 'relative', overflow: 'hidden' },
    mission: { width: '100%', textAlign: 'center', marginBottom: 48 },
    missionEyebrow: { display: 'inline-flex', alignItems: 'center', gap: 8, background: 'rgba(249,89,132,0.1)', border: '1px solid rgba(249,89,132,0.25)', borderRadius: 20, padding: '6px 16px', fontSize: 13, fontWeight: 600, color: '#f95984', marginBottom: 20 },
    ctaBtn: { display: 'inline-flex', alignItems: 'center', gap: 8, background: 'rgba(249,89,132,0.1)', border: '1px solid rgba(249,89,132,0.3)', borderRadius: 12, padding: '12px 24px', color: '#f95984', fontSize: 14, fontWeight: 600, fontFamily: 'inherit', cursor: 'pointer' },
  };

  const isJa = lang === 'ja';

  return (
    <div style={s.page}>
      <window.Navbar navigate={navigate} />
      <main style={s.main}>
        <div style={s.topbar}>
          <button style={s.breadcrumb} onClick={() => navigate('/about')}>
            <i className="fa-solid fa-arrow-left"></i>
            <span>{isJa ? 'Aboutに戻る' : 'Back to About'}</span>
          </button>
          <button style={s.langBtn} onClick={() => setLang(l => l === 'en' ? 'ja' : 'en')}>
            <i className="fa-solid fa-language"></i>
            <span>{isJa ? 'English' : '日本語'}</span>
          </button>
        </div>

        <div style={s.hero}>
          <div style={s.eyebrow}><i className="fa-solid fa-chess"></i><span>{isJa ? 'Nekochessについて' : 'About Nekochess'}</span></div>
          <h1 style={s.heroTitle}>{isJa ? 'Nekochessとは？' : 'What is Nekochess?'}</h1>
          <p style={s.heroSub}>{isJa ? '新しいチェス体験 — ボットと対戦するだけでなく、実際の人と対戦できます。' : "A new kind of chess experience — where you don't just play against bots, you play against people."}</p>
        </div>

        <p style={s.bodyText}>{isJa ? 'Nekochessは一つのコアアイデアを中心に構築されたオンラインチェスプラットフォームです：パーソナライズされたボット。Chess.comやLichessのリアルなゲーム履歴を分析することで、Nekochessはあなたと全く同じように動くボットを生成します。' : 'Nekochess is an online chess platform built around one core idea: personalized bots. By analyzing your real game history from Chess.com or Lichess, Nekochess generates a bot that plays exactly like you — your openings, your tendencies, your style.'}</p>
        <p style={{...s.bodyText, marginBottom: 36}}>{isJa ? 'ボット以外にも、Nekochessはパズル、クイズ、ゲーム分析、コレクタブルピースシステムなど、チェスをより魅力的でパーソナルにするための機能を提供しています。' : 'Beyond bots, Nekochess offers puzzles, quizzes, game analysis, a collectible piece system, and more — all wrapped in one unified platform designed to make chess more engaging and personal.'}</p>

        {/* Software card */}
        <div style={s.softwareCard}>
          <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: 2, background: 'linear-gradient(90deg,#a78bfa,#7c3aed)' }}></div>
          <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 12 }}>
            <div style={{ width: 36, height: 36, borderRadius: 10, background: 'rgba(167,139,250,0.12)', border: '1px solid rgba(167,139,250,0.3)', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 15, color: '#a78bfa' }}>
              <i className="fa-solid fa-microchip"></i>
            </div>
            <span style={{ fontSize: 14, fontWeight: 700, color: '#a78bfa' }}>{isJa ? 'Nekochess Software v2.0 搭載' : 'Powered by Nekochess Software v2.0'}</span>
          </div>
          <p style={{ fontSize: 14, color: 'rgba(255,255,255,0.55)', lineHeight: 1.8, margin: 0 }}>
            {isJa ? 'パーソナライズドボットシステムは、開発者が完全にゼロから構築したカスタムエンジンによって動いています。45以上のチェス指標からプレイヤー独自のスタイルを抽出し、K-Meansクラスタリングを使用してそのプレイヤーのように動くボットを生成します。' : "The personalized bot system is driven by Nekochess Software Version 2.0 — a custom-built engine created entirely from scratch. It analyzes hundreds of real games to extract a player's unique style across 45+ chess indicators, then uses K-Means clustering to generate a bot that genuinely thinks and plays like that person."}
          </p>
        </div>

        {/* Beta card */}
        <div style={s.betaCard}>
          <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: 2, background: 'linear-gradient(90deg,#fbbf24,#f59e0b)' }}></div>
          <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 14 }}>
            <i className="fa-solid fa-triangle-exclamation" style={{ color: '#fbbf24', fontSize: 16 }}></i>
            <h2 style={{ fontSize: 15, fontWeight: 700, color: '#fbbf24', margin: 0 }}>{isJa ? 'Nekochessは現在ベータ版です' : 'Nekochess is Currently in Beta'}</h2>
          </div>
          <p style={{ fontSize: 14, color: 'rgba(255,255,255,0.55)', lineHeight: 1.8, margin: '0 0 10px' }}>
            {isJa ? 'Nekochessの一部機能は「近日公開」と表示されています — 当初の予定より早くNekochessを公開しました。そのため、一部の機能はリリースを遅らせるよりも後回しにせざるを得ませんでした。' : 'Some features on Nekochess are marked as "coming soon." Nekochess was published ahead of its originally planned release date because I needed to include it in my portfolio for my school\'s job hunting process. Certain features had to be pushed back rather than delay the entire launch.'}
          </p>
          <p style={{ fontSize: 14, color: 'rgba(255,255,255,0.55)', lineHeight: 1.8, margin: 0 }}>
            {isJa ? '開発は積極的に継続中で、計画されたすべての機能は順次リリースされます。Nekochessの初期サポーターとして応援してくださり、本当にありがとうございます。' : 'Development is actively continuing and all planned features will be rolled out over time. Thank you for your patience and for being an early supporter of Nekochess — it genuinely means a lot.'}
          </p>
        </div>

        {/* Features */}
        <div style={{ width: '100%', marginBottom: 48 }}>
          <h2 style={{ fontSize: 20, fontWeight: 700, color: '#fff', margin: '0 0 24px', textAlign: 'center' }}>{isJa ? 'Nekochessでできること' : 'What You Can Do on Nekochess'}</h2>
          <div style={s.featuresGrid}>
            {FEATURES.map(f => (
              <div key={f.title} style={s.featCard}>
                <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: 2, background: f.accent, opacity: 0.7 }}></div>
                <div style={{ width: 40, height: 40, flexShrink: 0, borderRadius: 10, background: `color-mix(in srgb, ${f.accent} 12%, transparent)`, border: `1px solid color-mix(in srgb, ${f.accent} 30%, transparent)`, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                  <i className={`fa-solid ${f.icon}`} style={{ fontSize: 16, color: f.accent }}></i>
                </div>
                <div style={{ flex: 1 }}>
                  <h3 style={{ fontSize: 14, fontWeight: 700, color: '#fff', margin: '0 0 6px' }}>{f.title}</h3>
                  <p style={{ fontSize: 13, color: 'rgba(255,255,255,0.45)', lineHeight: 1.6, margin: 0 }}>{f.description}</p>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Mission */}
        <div style={s.mission}>
          <div style={s.missionEyebrow}><i className="fa-solid fa-heart"></i><span>{isJa ? '私たちのミッション' : 'Our Mission'}</span></div>
          <p style={{ fontSize: 15, color: 'rgba(255,255,255,0.5)', lineHeight: 1.9, margin: 0, maxWidth: 680, display: 'inline-block' }}>
            {isJa ? 'チェスは常に知性のゲームでしたが、オンラインでは対戦相手は通常、顔のないエンジンです。Nekochessはそれを変えるために作られました。すべてのプレイヤーが自分のユニークなスタイルを反映した体験を受けるべきだと信じています。' : "Chess has always been a game of minds — but online, your opponent is usually a faceless engine. Nekochess was built to change that. We believe chess is most exciting when it feels human, and that every player deserves an experience that reflects their unique style."}
          </p>
        </div>

        {/* CTA */}
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 16 }}>
          <p style={{ fontSize: 15, color: 'rgba(255,255,255,0.4)', margin: 0 }}>{isJa ? 'ご質問やフィードバックはありますか？' : 'Have questions or feedback?'}</p>
          <button style={s.ctaBtn}><i className="fa-solid fa-envelope"></i><span>{isJa ? 'お問い合わせ' : 'Get in Touch'}</span></button>
        </div>
      </main>
      <window.Footer />
    </div>
  );
}

Object.assign(window, { AboutNekochess });
