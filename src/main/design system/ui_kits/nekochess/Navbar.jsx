// Navbar.jsx — Nekochess UI Kit
const { useState } = React;

function Navbar({ navigate }) {
  const [mobileOpen, setMobileOpen] = useState(false);
  const NAV_LINKS = [
    { label: 'Play', icon: 'fa-chess' },
    { label: 'Puzzles', icon: 'fa-puzzle-piece' },
    { label: 'Collection', icon: 'fa-box-open' },
    { label: 'Leaderboard', icon: 'fa-trophy' },
    { label: 'About', icon: 'fa-circle-info', route: '/about' },
  ];

  const navStyle = {
    position: 'sticky', top: 0, zIndex: 100,
    background: 'rgba(15,15,15,0.92)', backdropFilter: 'blur(12px)',
    borderBottom: '1px solid rgba(255,255,255,0.07)',
    display: 'flex', alignItems: 'center', justifyContent: 'space-between',
    padding: '0 24px', height: '60px',
  };
  const logoStyle = {
    display: 'flex', alignItems: 'center', gap: '10px', cursor: 'pointer', textDecoration: 'none',
  };
  const logoIconStyle = {
    width: 32, height: 32, borderRadius: 9, background: 'rgba(249,89,132,0.15)',
    border: '1px solid rgba(249,89,132,0.3)', display: 'flex', alignItems: 'center',
    justifyContent: 'center', color: '#f95984', fontSize: 15,
  };
  const logoTextStyle = { fontSize: 16, fontWeight: 800, color: '#fff', letterSpacing: '-0.3px' };
  const linksStyle = { display: 'flex', alignItems: 'center', gap: 4 };
  const linkStyle = {
    display: 'inline-flex', alignItems: 'center', gap: 6, padding: '6px 12px',
    borderRadius: 8, fontSize: 13, fontWeight: 500, color: 'rgba(255,255,255,0.55)',
    cursor: 'pointer', border: 'none', background: 'none', fontFamily: 'inherit',
    transition: 'color 0.2s, background 0.2s',
  };
  const rightStyle = { display: 'flex', alignItems: 'center', gap: 8 };
  const loginBtnStyle = {
    padding: '7px 16px', borderRadius: 9, fontSize: 13, fontWeight: 600,
    background: 'rgba(249,89,132,0.12)', border: '1px solid rgba(249,89,132,0.3)',
    color: '#f95984', cursor: 'pointer', fontFamily: 'inherit',
  };

  return (
    <nav style={navStyle}>
      <div style={logoStyle} onClick={() => navigate && navigate('/about')}>
        <div style={logoIconStyle}><i className="fa-solid fa-chess"></i></div>
        <span style={logoTextStyle}>Nekochess</span>
      </div>
      <div style={linksStyle}>
        {NAV_LINKS.map(l => (
          <button key={l.label} style={linkStyle}
            onClick={() => l.route && navigate && navigate(l.route)}
            onMouseOver={e => { e.currentTarget.style.color='#fff'; e.currentTarget.style.background='rgba(255,255,255,0.05)'; }}
            onMouseOut={e => { e.currentTarget.style.color='rgba(255,255,255,0.55)'; e.currentTarget.style.background='none'; }}>
            <i className={`fa-solid ${l.icon}`} style={{fontSize:12}}></i>{l.label}
          </button>
        ))}
      </div>
      <div style={rightStyle}>
        <button style={loginBtnStyle}
          onMouseOver={e => e.currentTarget.style.background='rgba(249,89,132,0.2)'}
          onMouseOut={e => e.currentTarget.style.background='rgba(249,89,132,0.12)'}>
          Sign In
        </button>
      </div>
    </nav>
  );
}

Object.assign(window, { Navbar });
