// Footer.jsx — Nekochess UI Kit

function Footer() {
  const s = {
    footer: { background: '#0f0f0f', borderTop: '1px solid rgba(255,255,255,0.07)', padding: '40px 24px 24px' },
    inner: { maxWidth: 1000, margin: '0 auto', display: 'flex', gap: 40, flexWrap: 'wrap', alignItems: 'flex-start' },
    brand: { flex: '1 1 220px', display: 'flex', flexDirection: 'column', gap: 12 },
    logo: { display: 'flex', alignItems: 'center', gap: 10 },
    logoIcon: { width: 32, height: 32, borderRadius: 9, background: 'rgba(249,89,132,0.12)', border: '1px solid rgba(249,89,132,0.25)', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#f95984', fontSize: 14 },
    logoText: { fontSize: 15, fontWeight: 800, color: '#fff', letterSpacing: '-0.3px' },
    tagline: { fontSize: 13, color: 'rgba(255,255,255,0.35)', lineHeight: 1.7, margin: 0, maxWidth: 260 },
    socials: { display: 'flex', gap: 10 },
    socialLink: { width: 34, height: 34, borderRadius: 9, background: 'rgba(255,255,255,0.04)', border: '1px solid rgba(255,255,255,0.08)', display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'rgba(255,255,255,0.4)', fontSize: 14, textDecoration: 'none' },
    divider: { width: 1, background: 'rgba(255,255,255,0.07)', alignSelf: 'stretch', flexShrink: 0 },
    linksGroup: { display: 'flex', flexDirection: 'column', gap: 8 },
    linksTitle: { fontSize: 12, fontWeight: 700, color: 'rgba(255,255,255,0.35)', textTransform: 'uppercase', letterSpacing: '0.8px', margin: '0 0 4px' },
    link: { fontSize: 13, color: 'rgba(255,255,255,0.45)', textDecoration: 'none', display: 'block', cursor: 'pointer' },
    bottom: { maxWidth: 1000, margin: '24px auto 0', paddingTop: 16, borderTop: '1px solid rgba(255,255,255,0.06)', textAlign: 'center' },
    copy: { fontSize: 12, color: 'rgba(255,255,255,0.25)', margin: 0 },
  };
  return (
    <footer style={s.footer}>
      <div style={s.inner}>
        <div style={s.brand}>
          <div style={s.logo}>
            <div style={s.logoIcon}><i className="fa-solid fa-chess"></i></div>
            <span style={s.logoText}>Nekochess</span>
          </div>
          <p style={s.tagline}>Where every move tells a story. Play, learn, and compete in the ultimate chess experience.</p>
          <div style={s.socials}>
            <a href="#" style={s.socialLink}><i className="fa-brands fa-facebook"></i></a>
            <a href="#" style={s.socialLink}><i className="fa-brands fa-youtube"></i></a>
          </div>
        </div>
        <div style={s.divider}></div>
        <div style={s.linksGroup}>
          <h4 style={s.linksTitle}>Company</h4>
          {['About','Contact','FAQ'].map(l => <a key={l} href="#" style={s.link}>{l}</a>)}
        </div>
        <div style={s.linksGroup}>
          <h4 style={s.linksTitle}>Legal</h4>
          {['Terms of Service','Privacy Policy','Commercial Disclosure'].map(l => <a key={l} href="#" style={s.link}>{l}</a>)}
        </div>
      </div>
      <div style={s.bottom}>
        <p style={s.copy}>© 2026 Nekochess. All rights reserved.</p>
      </div>
    </footer>
  );
}

Object.assign(window, { Footer });
