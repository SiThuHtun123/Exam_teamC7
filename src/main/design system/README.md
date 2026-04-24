# Nekochess Design System

## Overview

**Nekochess** is an online chess platform built around personalized bots. By analyzing a player's real game history from Chess.com or Lichess, Nekochess generates a bot that plays exactly like them — their openings, tendencies, and style. Players then challenge other players' bots, climb a division ladder, and track improvement over time.

The platform also includes puzzles, quizzes, game analysis, a collectible piece system, and more. It is currently in beta (launched early for portfolio/school purposes).

**Developer:** Si Thu Tun — CS student at 東京情報クリエイター工学院専門学校, Tokyo, Japan.

**Stack:** React + Django + PostgreSQL + Redis + Celery + Stockfish + K-Means ML engine (custom-built, no third-party ML library).

**Contact:** contact.nekochess@gmail.com  
**Socials:** Facebook, YouTube  
**LinkedIn:** https://www.linkedin.com/in/si-thu-tun-9a19193a7/

---

## Sources

- **Codebase (About section):** Mounted at `About/` — contains `About.js`, `AboutNekochess.js`, `AboutDeveloper.js`, `AboutCredits.js` and their corresponding CSS files. This is a React app using React Router, FontAwesome 6, and react-chessboard.
- No Figma link was provided.
- Logo referenced at `/pics/Nekochess_Transparent.png` in the source app.
- Developer photo at `/pics/photo.jpg`.

---

## Products / Surfaces

1. **Nekochess Web App** — the primary product; a full-stack React SPA with chess gameplay, profile pages, division ladder, puzzle system, and collection system.

---

## CONTENT FUNDAMENTALS

### Tone & Voice
- **Warm, personal, and honest.** The developer writes in the first person ("I") in places like the beta notice and developer bio, breaking the fourth wall in a relatable way.
- **Enthusiastic but grounded.** Excitement about the product is tempered by honesty (e.g., openly explaining why certain features are "coming soon" due to school deadlines).
- **Bilingual (EN/JA).** Key pages offer a full Japanese translation. Copy is natural in both languages, not machine-translated-sounding.
- **No emoji in UI copy.** Icons (FontAwesome) are used instead of emoji for visual markers.
- **Capitalization:** Title case for section headings and feature names. Sentence case for descriptions and body paragraphs.
- **Tagline:** *"Where every move tells a story. Play, learn, and compete in the ultimate chess experience."*
- **Mission framing:** Chess is most exciting when it feels human. Nekochess makes every game personal.
- **Tone words:** personal, human, engaging, unique, honest, direct.

### Example Copy Patterns
- Eyebrow labels: short, icon + label, e.g. `♟ About Nekochess`, `❤ Our Mission`
- Hero subtitles: one punchy sentence. e.g. *"A new kind of chess experience — where you don't just play against bots, you play against people."*
- Feature descriptions: 1–2 sentences, practical, active voice. e.g. *"The heart of Nekochess. Play against a bot generated from another real player's game history."*
- CTA labels: verb-first, friendly. e.g. *"Get in Touch"*, *"Contact Me"*

---

## VISUAL FOUNDATIONS

### Color System
- **Background:** `#0f0f0f` (near-black, not pure black)
- **Surface cards:** `rgba(255,255,255,0.02)` background, `rgba(255,255,255,0.07–0.08)` border
- **Brand primary (pink):** `#f95984` — used for primary CTAs, eyebrow labels, brand accents, hero borders
- **Purple:** `#a78bfa` — used for secondary accents (language toggle, software card, skill tags)
- **Blue:** `#60a5fa` — frontend/tech skills, secondary buttons
- **Green:** `#34d399` — backend/database accents
- **Yellow/Gold:** `#fbbf24` — warnings, beta notices, education, achievements
- **Orange:** `#fb923c` / `#f97316` — game analysis feature, bronze achievements
- **Text white:** `#ffffff` for headings; `rgba(255,255,255,0.6)` for body; `rgba(255,255,255,0.45)` for secondary; `rgba(255,255,255,0.3)` for de-emphasized/metadata

### Typography
- **Font family:** `Arial, sans-serif` (no custom web font in the codebase)
- **Hero title:** `42px`, `font-weight: 800`, `letter-spacing: -0.5px`
- **Section titles:** `18–20px`, `font-weight: 700`
- **Card titles:** `15–16px`, `font-weight: 700`
- **Body text:** `14–15px`, `line-height: 1.8–1.85`, `rgba(255,255,255,0.55)`
- **Small/meta:** `12–13px`, `rgba(255,255,255,0.35–0.45)`
- **Eyebrow pills:** `13px`, `font-weight: 600`, `letter-spacing: 0.3–0.4px`
- **Tags:** `11px`, `font-weight: 500–600`, pill-shaped

### Cards & Surfaces
- **Background:** near-transparent dark (`rgba(255,255,255,0.02)`)
- **Border:** `1px solid rgba(255,255,255,0.07–0.08)`
- **Border radius:** `14–20px` for cards, `10–12px` for smaller elements, `20px` for pill labels
- **Hover state:** `border-color` transitions to accent color via `color-mix()`; optional `translateY(-4px)` lift; box-shadow deepens
- **Top accent line:** 2px gradient or solid line at top of featured cards (e.g. `linear-gradient(90deg, #f95984, #a78bfa)`)
- **Left accent bar:** 3px solid bar on left edge of list-style cards (credits, skills, projects)
- **Gradient backgrounds:** subtle `linear-gradient(135deg, rgba(accent,0.05) 0%, rgba(10,10,10,0.95) 100%)` on hero and CTA sections

### Icons
- **Library:** Font Awesome 6 (Solid + Brands) via CDN
- **Icon wrappers:** Square containers, `32–48px`, `border-radius: 8–14px`, accent-colored bg/border, accent-colored icon
- **No custom SVG icons.** All icons are FA classes (e.g. `fa-chess`, `fa-robot`, `fa-trophy`)
- No emoji used in UI

### Spacing & Layout
- **Max content width:** `800–1000px` centered
- **Page padding:** `40–60px` top, `80px` bottom, `24px` horizontal
- **Card gap:** `14–20px`
- **Section gap:** `48px` between sections
- **Grid:** 2-column feature grids; 3-column hub cards (responsive to 1-col mobile)

### Animations & Transitions
- **Duration:** `0.2s–0.25s ease` for all hover/focus transitions
- **Hover lift:** `transform: translateY(-4px)` on hub cards
- **Arrow shift:** `translateX(4px)` on card arrows
- **Opacity fades:** tooltip/location label appears on hover with `opacity: 0 → 1`
- **No page transitions or entrance animations** visible in the provided code

### Blur & Depth
- `backdrop-filter: blur(6px)` used sparingly on floating tooltip overlays (photo location badge)
- No frosted glass panels in main UI

### Borders & Shadows
- Consistent `1px solid` borders, color driven by accent or `rgba(255,255,255,0.07–0.1)`
- `box-shadow: 0 16px 40px rgba(0,0,0,0.4)` on hovered hub cards
- No inner shadows

### Buttons
- **Primary ghost button:** `rgba(accent,0.1)` bg, `1px solid rgba(accent,0.3)` border, accent-colored text, `border-radius: 12px`, `padding: 12px 24px`
- **Hover:** bg alpha increases to ~0.18–0.2, border opacity increases
- **Breadcrumb/nav button:** transparent bg, low-opacity border, muted text; hover → accent color

### Footer
- Dark background, brand logo + tagline, vertical divider, link columns (Company, Legal)
- Social icons (Facebook, YouTube)
- Copyright: `© 2026 Nekochess. All rights reserved.`

### Corner Radii Summary
| Element | Radius |
|---|---|
| Hub cards | 20px |
| Feature/credit cards | 14–16px |
| Icon wrappers | 8–14px |
| Pills/eyebrows | 20px |
| Buttons | 10–12px |
| Tags | 20px (fully rounded) |

---

## ICONOGRAPHY

- **System:** Font Awesome 6 Free (Solid + Brands). Loaded via CDN: `https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css`
- **No custom icon font, no SVG sprite, no PNG icons found in the About codebase.**
- **Brand icons used:** `fa-facebook`, `fa-youtube`, `fa-linkedin` (from `@fortawesome/free-brands-icons`)
- **UI icons used:** `fa-chess`, `fa-chess-board`, `fa-robot`, `fa-trophy`, `fa-puzzle-piece`, `fa-box-open`, `fa-magnifying-glass-chart`, `fa-microchip`, `fa-triangle-exclamation`, `fa-circle-info`, `fa-arrow-right`, `fa-arrow-left`, `fa-arrow-up-right-from-square`, `fa-language`, `fa-users`, `fa-star`, `fa-code`, `fa-heart`, `fa-envelope`, `fa-user-astronaut`, `fa-location-dot`, `fa-graduation-cap`, `fa-trophy`, `fa-medal`, `fa-award`, `fa-brain`, `fa-server`, `fa-display`, `fa-plug`, `fa-database`, `fa-volume-high`, `fa-capsules`
- **Emoji:** Not used anywhere in the UI.
- **Icon usage rules:** Icons always appear inside a square wrapper with rounded corners, accent-colored background/border, and matching accent color for the icon itself.

---

## File Index

| File/Folder | Description |
|---|---|
| `README.md` | This file — full design system overview |
| `colors_and_type.css` | CSS custom properties for all colors, type, and semantic tokens |
| `assets/` | Logos and brand assets |
| `preview/` | Visual preview cards (registered in Design System tab) |
| `ui_kits/nekochess/` | UI kit — interactive React prototype of the Nekochess web app |
| `SKILL.md` | Agent skill definition for Claude Code |

---

## UI Kits

- **`ui_kits/nekochess/index.html`** — Interactive prototype covering the About hub, About Nekochess detail page, About Developer page, and About Credits page. Click-through navigation between pages.
