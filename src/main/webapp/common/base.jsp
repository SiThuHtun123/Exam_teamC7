<%-- 共通テンプレート --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,400;0,9..40,500;0,9..40,600;0,9..40,700;0,9..40,800;1,9..40,400&display=swap');

:root {
  --color-bg:            #0f0f0f;
  --color-bg-surface:    rgba(255,255,255,0.02);
  --color-bg-surface-2:  rgba(255,255,255,0.04);
  --color-pink:          #f95984;
  --color-pink-dim:      rgba(249,89,132,0.1);
  --color-pink-border:   rgba(249,89,132,0.25);
  --color-purple:        #a78bfa;
  --color-blue:          #60a5fa;
  --color-green:         #34d399;
  --color-green-dim:     rgba(52,211,153,0.08);
  --color-green-border:  rgba(52,211,153,0.25);
  --color-yellow:        #fbbf24;
  --color-border:        rgba(255,255,255,0.07);
  --color-border-subtle: rgba(255,255,255,0.1);
  --color-text-1:        #ffffff;
  --color-text-2:        rgba(255,255,255,0.6);
  --color-text-3:        rgba(255,255,255,0.55);
  --color-text-4:        rgba(255,255,255,0.45);
  --color-text-5:        rgba(255,255,255,0.35);
  --color-text-6:        rgba(255,255,255,0.3);
  --font-sans:           'DM Sans', Arial, sans-serif;
  --radius-sm:           8px;
  --radius-md:           10px;
  --radius-lg:           12px;
  --radius-xl:           14px;
  --radius-full:         9999px;
  --shadow-card-hover:   0 16px 40px rgba(0,0,0,0.4);
  --transition-fast:     0.2s ease;
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html, body {
  background-color: var(--color-bg);
  color: var(--color-text-2);
  font-family: var(--font-sans);
  font-size: 14px;
  line-height: 1.8;
  min-height: 100vh;
}

a { color: var(--color-text-2); text-decoration: none; transition: color var(--transition-fast); }
a:hover { color: var(--color-pink); }

#wrapper {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

#site-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 0;
  border-bottom: 1px solid var(--color-border);
}

#layout { display: flex; flex: 1; }

#sidebar {
  width: 220px;
  min-width: 220px;
  border-right: 1px solid var(--color-border);
  padding: 32px 0;
}

#main-content { flex: 1; padding: 32px 40px; }

#main-content-full {
  flex: 1;
  padding: 16px 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}

#site-footer {
  border-top: 1px solid var(--color-border);
  padding: 20px 0;
  margin-top: auto;
}

/* Buttons */
.btn-primary {
  background: var(--color-pink-dim);
  border: 1px solid var(--color-pink-border);
  color: var(--color-pink);
  padding: 10px 24px;
  border-radius: var(--radius-lg);
  font-family: var(--font-sans);
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: background var(--transition-fast), border-color var(--transition-fast);
}
.btn-primary:hover { background: rgba(249,89,132,0.18); border-color: rgba(249,89,132,0.5); }

.btn-secondary {
  background: var(--color-bg-surface-2);
  border: 1px solid var(--color-border-subtle);
  color: var(--color-text-2);
  padding: 10px 24px;
  border-radius: var(--radius-lg);
  font-family: var(--font-sans);
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: background var(--transition-fast);
}
.btn-secondary:hover { background: rgba(255,255,255,0.06); color: var(--color-text-1); }

.btn-danger {
  background: rgba(249,89,132,0.08);
  border: 1px solid rgba(249,89,132,0.2);
  color: var(--color-pink);
  padding: 10px 24px;
  border-radius: var(--radius-lg);
  font-family: var(--font-sans);
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: background var(--transition-fast);
}
.btn-danger:hover { background: rgba(249,89,132,0.16); }

/* Cards */
.card {
  background: var(--color-bg-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  padding: 24px;
  transition: border-color var(--transition-fast), box-shadow var(--transition-fast);
}
.card:hover { border-color: var(--color-border-subtle); box-shadow: var(--shadow-card-hover); }

/* Tables */
table { width: 100%; border-collapse: collapse; }
th {
  background: var(--color-bg-surface-2);
  color: var(--color-text-4);
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.4px;
  padding: 10px 16px;
  border-bottom: 1px solid var(--color-border);
  text-align: left;
}
td { padding: 12px 16px; border-bottom: 1px solid var(--color-border); color: var(--color-text-2); font-size: 14px; }
tr:last-child td { border-bottom: none; }
tr:hover td { background: var(--color-bg-surface-2); }

/* Forms */
input[type="text"], input[type="password"], input[type="number"], input[type="email"], select, textarea {
  background: var(--color-bg-surface);
  border: 1px solid var(--color-border-subtle);
  color: var(--color-text-1);
  border-radius: var(--radius-md);
  padding: 10px 14px;
  font-family: var(--font-sans);
  font-size: 14px;
  width: 100%;
  transition: border-color var(--transition-fast);
  outline: none;
}
input[type="text"]:focus, input[type="password"]:focus, input[type="number"]:focus, select:focus, textarea:focus {
  border-color: var(--color-pink-border);
}
input::placeholder { color: var(--color-text-6); }

select option {
  background-color: #1a1a1a;
  color: #ffffff;
}
label { display: block; font-size: 13px; font-weight: 600; color: var(--color-text-4); margin-bottom: 6px; }
.form-group { margin-bottom: 12px; }

/* Page title */
.page-title {
  font-size: 20px;
  font-weight: 700;
  color: var(--color-pink);
  margin-bottom: 24px;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-border);
}

/* Colored table headers */
th { color: var(--color-blue) !important; }

/* Colored form labels */
label { color: var(--color-purple) !important; }

/* Messages */
.msg-error {
  background: rgba(249,89,132,0.08);
  border: 1px solid rgba(249,89,132,0.2);
  color: var(--color-pink);
  border-radius: var(--radius-md);
  padding: 12px 16px;
  margin-bottom: 20px;
  font-size: 13px;
}
.msg-success {
  background: var(--color-green-dim);
  border: 1px solid var(--color-green-border);
  color: var(--color-green);
  border-radius: var(--radius-md);
  padding: 12px 16px;
  margin-bottom: 20px;
  font-size: 13px;
}

/* Header */
.header-logo { display: flex; align-items: center; gap: 10px; }
.header-logo-icon {
  width: 32px; height: 32px;
  background: var(--color-pink-dim);
  border: 1px solid var(--color-pink-border);
  border-radius: var(--radius-sm);
  display: flex; align-items: center; justify-content: center;
}
.header-logo-icon i { color: var(--color-pink); font-size: 14px; }
.header-logo-text { font-size: 16px; font-weight: 700; color: var(--color-text-1); letter-spacing: -0.3px; }
.header-user { display: flex; align-items: center; gap: 16px; }
.header-username { font-size: 13px; color: var(--color-text-4); }
.header-username i { margin-right: 6px; }
.header-logout {
  font-size: 13px; font-weight: 600; color: var(--color-text-4);
  background: var(--color-bg-surface-2);
  border: 1px solid var(--color-border);
  padding: 6px 14px; border-radius: var(--radius-md);
  transition: color var(--transition-fast), border-color var(--transition-fast);
}
.header-logout:hover { color: var(--color-pink); border-color: var(--color-pink-border); }
.header-logout i { margin-right: 6px; }

/* Footer */
.footer-inner { display: flex; align-items: center; justify-content: space-between; }
.footer-logo { display: flex; align-items: center; gap: 8px; }
.footer-logo-icon {
  width: 24px; height: 24px;
  background: var(--color-pink-dim);
  border: 1px solid var(--color-pink-border);
  border-radius: 6px;
  display: flex; align-items: center; justify-content: center;
}
.footer-logo-icon i { color: var(--color-pink); font-size: 11px; }
.footer-logo-text { font-size: 13px; font-weight: 600; color: var(--color-text-1); }
.footer-copy { font-size: 12px; color: var(--color-text-6); margin: 0; }

/* Sidebar nav */
.nav-section-label {
  font-size: 11px; font-weight: 600; letter-spacing: 0.4px;
  color: var(--color-text-6); text-transform: uppercase;
  padding: 0 20px; margin-bottom: 6px; margin-top: 20px;
}
.nav-link-item {
  display: flex; align-items: center; gap: 10px;
  padding: 9px 20px; font-size: 14px; font-weight: 500;
  color: var(--color-text-3);
  transition: color var(--transition-fast), background var(--transition-fast);
}
.nav-link-item:hover { color: var(--color-text-1); background: var(--color-bg-surface-2); }
.nav-link-item.active { color: var(--color-pink); background: var(--color-pink-dim); border-right: 2px solid var(--color-pink); }
.nav-link-item i { width: 16px; text-align: center; font-size: 13px; }
.nav-sub-item {
  display: flex; align-items: center; gap: 10px;
  padding: 8px 20px 8px 44px; font-size: 13px;
  color: var(--color-text-4);
  transition: color var(--transition-fast), background var(--transition-fast);
}
.nav-sub-item:hover { color: var(--color-text-1); background: rgba(255,255,255,0.03); }
</style>
<title>${param.title}</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
${param.scripts}
</head>
<body>
	<div id="wrapper">
		<header id="site-header">
			<c:import url="/common/header.jsp" />
		</header>

		<div id="layout">
			<c:choose>
				<%-- ログイン済みの場合 --%>
				<c:when test="${user.isAuthenticated()}">
					<nav id="sidebar">
						<c:import url="/common/navigation.jsp" />
					</nav>
					<main id="main-content">${param.content}</main>
				</c:when>
				<%-- 未ログインの場合 --%>
				<c:otherwise>
					<main id="main-content-full">${param.content}</main>
				</c:otherwise>
			</c:choose>
		</div>

		<footer id="site-footer">
			<c:import url="/common/footer.jsp" />
		</footer>
	</div>
</body>
</html>
