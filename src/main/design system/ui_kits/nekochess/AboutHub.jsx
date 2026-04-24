// AboutHub.jsx — Nekochess UI Kit

const ABOUT_CARDS = [
  { icon: 'fa-chess', title: 'About Nekochess', description: 'Learn what Nekochess is, how it works, and what makes it unique.', route: '/about/nekochess', accent: '#f95984' },
  { icon: 'fa-star', title: 'About Credits', description: 'See the tools, libraries, and resources that power Nekochess.', route: '/about/credits', accent: '#a78bfa' },
  { icon: 'fa-code', title: 'About Developer', description: 'Meet the developer behind Nekochess and the story of how it was built.', route: '/about/developer', accent: '#60a5fa' },
];

function AboutHub({ navigate }) {
  const [hovered, setHovered] = React.useState(null);
  const s = {
    page: { minHeight: '100vh', display: 'flex', flexDirection: 'column', background: '#0f0f0f' },
    main: { flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '60px 24px 80px' },
    hero: { textAlign: 'center', marginBottom: 52 },
    eyebrow: { display: 'inline-flex', alignItems: 'center', gap: 8, background: 'rgba(249,89,132,0.1)', border: '1px solid rgba(249,89,132,0.25)', borderRadius: 20, padding: '6px 16px', fontSize: 13, fontWeight: 600, color: '#f95984', marginBottom: 20, letterSpacing: '0.3px' },
    heroTitle: { fontSize: 42, fontWeight: 800, color: '#fff', margin: '0 0 14px', letterSpacing: '-0.5px' },
    heroSub: { fontSize: 16, color: 'rgba(255,255,255,0.45)', margin: 0 },
    grid: { width: '100%', maxWidth: 860, display: 'grid', gridTemplateColumns: 'repeat(3,1fr)', gap: 20 },
  };

  return (
    <div style={s.page}>
      <window.Navbar navigate={navigate} />
      <main style={s.main}>
        <div style={s.hero}>
          <div style={s.eyebrow}><i className="fa-solid fa-circle-info"></i><span>About</span></div>
          <h1 style={s.heroTitle}>Get to Know Nekochess</h1>
          <p style={s.heroSub}>Choose a section below to learn more.</p>
        </div>
        <div style={s.grid}>
          {ABOUT_CARDS.map((card) => {
            const isHov = hovered === card.route;
            return (
              <div key={card.route}
                style={{
                  display: 'flex', flexDirection: 'column', gap: 16,
                  padding: '32px 28px',
                  background: 'linear-gradient(135deg, rgba(255,255,255,0.03) 0%, rgba(10,10,10,0.95) 100%)',
                  border: `1px solid ${isHov ? card.accent : 'rgba(255,255,255,0.08)'}`,
                  borderRadius: 20, cursor: 'pointer', position: 'relative', overflow: 'hidden',
                  transform: isHov ? 'translateY(-4px)' : 'none',
                  boxShadow: isHov ? '0 16px 40px rgba(0,0,0,0.4)' : 'none',
                  transition: 'all 0.25s ease',
                }}
                onClick={() => navigate(card.route)}
                onMouseEnter={() => setHovered(card.route)}
                onMouseLeave={() => setHovered(null)}>
                <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: 2, background: card.accent, opacity: isHov ? 1 : 0.5, transition: 'opacity 0.25s' }}></div>
                <div style={{ width: 48, height: 48, borderRadius: 14, background: isHov ? `color-mix(in srgb, ${card.accent} 15%, transparent)` : 'rgba(255,255,255,0.05)', border: `1px solid ${isHov ? `color-mix(in srgb, ${card.accent} 40%, transparent)` : 'rgba(255,255,255,0.08)'}`, display: 'flex', alignItems: 'center', justifyContent: 'center', transition: 'all 0.25s' }}>
                  <i className={`fa-solid ${card.icon}`} style={{ fontSize: 20, color: card.accent }}></i>
                </div>
                <div style={{ flex: 1, display: 'flex', flexDirection: 'column', gap: 8 }}>
                  <h2 style={{ fontSize: 16, fontWeight: 700, color: '#fff', margin: 0 }}>{card.title}</h2>
                  <p style={{ fontSize: 13, color: 'rgba(255,255,255,0.45)', lineHeight: 1.6, margin: 0 }}>{card.description}</p>
                </div>
                <div style={{ display: 'flex', justifyContent: 'flex-end', color: isHov ? card.accent : 'rgba(255,255,255,0.2)', fontSize: 13, transform: isHov ? 'translateX(4px)' : 'none', transition: 'all 0.25s' }}>
                  <i className="fa-solid fa-arrow-right"></i>
                </div>
              </div>
            );
          })}
        </div>
      </main>
      <window.Footer />
    </div>
  );
}

Object.assign(window, { AboutHub });
