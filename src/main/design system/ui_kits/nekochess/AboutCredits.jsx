// AboutCredits.jsx — Nekochess UI Kit

const CREDITS = [
  { accent: '#a78bfa', icon: 'fa-chess-board', category: 'Chess Piece Themes', source: 'Lichess', sourceUrl: 'https://lichess.org', description: 'Nekochess uses 39 chess piece set designs created and maintained by the Lichess open-source project. These include sets such as alpha, cburnett, horsey, merida, maestro, and many more. All piece themes are used under their respective open licenses as provided by Lichess.', notice: null },
  { accent: '#34d399', icon: 'fa-database', category: 'Game Database', source: 'Lichess Open Database', sourceUrl: 'https://database.lichess.org', description: 'Certain game modes in Nekochess — including Bot or Human and Guess the Elo — are powered by real chess games downloaded from the Lichess Open Database. This freely available dataset is made possible by the Lichess community and is published under the Creative Commons CC0 license.', notice: null },
  { accent: '#60a5fa', icon: 'fa-volume-high', category: 'Sound Effects', source: 'Lichess (lila)', sourceUrl: 'https://github.com/lichess-org/lila', description: 'The chess sound effects used in Nekochess — including move, capture, check, checkmate, victory, defeat, and draw sounds — are sourced from the Lichess open-source project (lila). These sounds are used under the GNU Affero General Public License v3.0 (AGPL-3.0).', notice: null },
  { accent: '#fbbf24', icon: 'fa-box-open', category: 'Blind Box Opening Animation', source: 'Unknown Creator', sourceUrl: null, description: 'The blind box opening GIF used in Nekochess was sourced from the internet. Despite our best efforts including reverse image search, we were unable to identify the original creator. We do not claim ownership of this animation.', notice: 'If you are the original creator of this GIF and would like to receive proper credit or have it removed, please contact us at contact.nekochess@gmail.com and we will respond promptly.' },
];

function AboutCredits({ navigate }) {
  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column', background: '#0f0f0f' }}>
      <window.Navbar navigate={navigate} />
      <main style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '40px 24px 80px', maxWidth: 800, width: '100%', margin: '0 auto' }}>

        {/* Breadcrumb */}
        <div style={{ width: '100%', marginBottom: 32 }}>
          <button onClick={() => navigate('/about')} style={{ display: 'inline-flex', alignItems: 'center', gap: 8, background: 'none', border: '1px solid rgba(255,255,255,0.1)', borderRadius: 10, padding: '8px 14px', color: 'rgba(255,255,255,0.5)', fontSize: 13, fontFamily: 'inherit', cursor: 'pointer' }}>
            <i className="fa-solid fa-arrow-left"></i><span>Back to About</span>
          </button>
        </div>

        {/* Hero */}
        <div style={{ textAlign: 'center', marginBottom: 48, width: '100%' }}>
          <div style={{ display: 'inline-flex', alignItems: 'center', gap: 8, background: 'rgba(249,89,132,0.1)', border: '1px solid rgba(249,89,132,0.25)', borderRadius: 20, padding: '6px 16px', fontSize: 13, fontWeight: 600, color: '#f95984', marginBottom: 20 }}>
            <i className="fa-solid fa-heart"></i><span>Credits</span>
          </div>
          <h1 style={{ fontSize: 42, fontWeight: 800, color: '#fff', margin: '0 0 14px', letterSpacing: '-0.5px' }}>Acknowledgements</h1>
          <p style={{ fontSize: 15, color: 'rgba(255,255,255,0.45)', margin: 0, lineHeight: 1.7, maxWidth: 560, display: 'inline-block' }}>
            Nekochess is built on the shoulders of amazing open-source projects and communities. Here we give credit where it's due.
          </p>
        </div>

        {/* Credit cards */}
        <div style={{ width: '100%', display: 'flex', flexDirection: 'column', gap: 20 }}>
          {CREDITS.map(c => (
            <div key={c.category} style={{ background: 'rgba(255,255,255,0.02)', border: '1px solid rgba(255,255,255,0.07)', borderRadius: 16, padding: '24px', position: 'relative', overflow: 'hidden' }}>
              <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: 3, background: c.accent, borderRadius: '3px 0 0 3px' }}></div>

              <div style={{ display: 'flex', alignItems: 'center', gap: 14, marginBottom: 14 }}>
                <div style={{ width: 44, height: 44, flexShrink: 0, borderRadius: 12, background: `color-mix(in srgb, ${c.accent} 12%, transparent)`, border: `1px solid color-mix(in srgb, ${c.accent} 30%, transparent)`, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                  <i className={`fa-solid ${c.icon}`} style={{ fontSize: 18, color: c.accent }}></i>
                </div>
                <div>
                  <div style={{ fontSize: 15, fontWeight: 700, color: '#fff', marginBottom: 3 }}>{c.category}</div>
                  {c.sourceUrl ? (
                    <a href={c.sourceUrl} target="_blank" rel="noopener noreferrer" style={{ display: 'inline-flex', alignItems: 'center', gap: 5, fontSize: 13, color: c.accent, textDecoration: 'none', fontWeight: 500 }}>
                      {c.source}<i className="fa-solid fa-arrow-up-right-from-square" style={{ fontSize: 10, opacity: 0.7 }}></i>
                    </a>
                  ) : (
                    <span style={{ fontSize: 13, color: 'rgba(255,255,255,0.35)', fontStyle: 'italic' }}>{c.source}</span>
                  )}
                </div>
              </div>

              <p style={{ fontSize: 14, color: 'rgba(255,255,255,0.5)', lineHeight: 1.8, margin: 0 }}>{c.description}</p>

              {c.notice && (
                <div style={{ display: 'flex', gap: 10, alignItems: 'flex-start', marginTop: 16, padding: '12px 14px', background: 'rgba(251,191,36,0.06)', border: '1px solid rgba(251,191,36,0.2)', borderRadius: 10 }}>
                  <i className="fa-solid fa-circle-info" style={{ color: '#fbbf24', fontSize: 13, marginTop: 2, flexShrink: 0 }}></i>
                  <p style={{ fontSize: 13, color: 'rgba(255,255,255,0.45)', lineHeight: 1.7, margin: 0 }}>{c.notice}</p>
                </div>
              )}
            </div>
          ))}
        </div>
      </main>
      <window.Footer />
    </div>
  );
}

Object.assign(window, { AboutCredits });
