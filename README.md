# 🚀 Quantum Vector EdTech Platform

> **AI & DevOps Training Platform** — from TheDevOpsCommunity  
> Built with Flutter Web (frontend) + Node.js (backend) · Deployed on Vercel

---

## 🏗️ Architecture

```
quantumvector/
├── frontend/              # Flutter Web App
│   ├── lib/
│   │   ├── main.dart          ← App entry, GoRouter setup
│   │   ├── theme/
│   │   │   └── qv_theme.dart  ← Colors, typography, design tokens
│   │   ├── models/
│   │   │   └── data.dart      ← Courses, workshops, trainers data
│   │   ├── widgets/
│   │   │   └── shared.dart    ← Navbar, Footer, Cards, Buttons, Tags
│   │   └── screens/
│   │       ├── home_screen.dart      ← Hero, Features, Courses preview
│   │       ├── courses_screen.dart   ← Full course listings + comparison
│   │       ├── workshops_screen.dart ← Live workshops + curriculum
│   │       └── about_screen.dart     ← Mission, Trainers, Contact
│   └── pubspec.yaml
│
├── backend/               # Node.js + Express API
│   ├── src/
│   │   ├── index.js           ← Express server, CORS, rate limiting
│   │   └── routes/
│   │       ├── health.js      ← GET /api/health
│   │       ├── courses.js     ← GET /api/courses, GET /api/courses/:id
│   │       ├── workshops.js   ← GET /api/workshops
│   │       ├── contact.js     ← POST /api/contact
│   │       └── enrollment.js  ← POST /api/enroll
│   ├── package.json
│   └── .env.example
│
├── vercel.json            ← Vercel monorepo deployment config
└── README.md
```

---

## 🎨 Design System

| Token | Value |
|-------|-------|
| Navy Deep | `#0A0E1A` (background) |
| Teal | `#00D4C8` (primary accent) |
| Orange | `#FF6B2B` (secondary/CTA) |
| Card BG | `#131B2E` |
| Font | Space Grotesk (headings) + Inter (body) + JetBrains Mono (labels) |

---

## 📄 Pages

| Page | Route | Description |
|------|-------|-------------|
| Home | `/` | Hero, stats, course previews, testimonials, trainers, FAQ, CTA |
| Courses | `/courses` | Full course cards, curriculum, comparison table |
| Workshops | `/workshops` | Live webinars, upcoming batches, schedule |
| About | `/about` | Mission, trainers, tech stack, office/contact |
| Student Login | `/login` | Placeholder — connect to LMS |

---

## 🔌 API Endpoints

```
GET  /api/health                   → Server status
GET  /api/courses                  → All courses (filter: ?featured=true&tag=EKS)
GET  /api/courses/:id              → Single course details
GET  /api/workshops                → All workshops (filter: ?upcoming=true)
GET  /api/workshops/:id            → Single workshop details
POST /api/contact                  → Contact form submission
POST /api/enroll                   → Enrollment inquiry
```

---

## 🚀 Local Development

### Prerequisites
- Flutter SDK ≥ 3.0 (`flutter --version`)
- Node.js ≥ 18 (`node --version`)
- npm ≥ 9

### 1. Clone & Setup

```bash
git clone https://github.com/quantumvector/platform.git
cd platform
```

### 2. Backend

```bash
cd backend
cp .env.example .env
# Edit .env with your SMTP, Razorpay keys
npm install
npm run dev
# API running at http://localhost:3001
```

### 3. Frontend

```bash
cd frontend
flutter pub get
flutter run -d chrome
# Web app at http://localhost:5000
```

---

## ☁️ Deploy to Vercel

### One-time setup

```bash
# Install Vercel CLI
npm i -g vercel

# From project root
vercel login
vercel link   # link to your Vercel project
```

### Build Flutter web

```bash
cd frontend
flutter build web --release --web-renderer canvaskit
# Output → frontend/build/web/
```

### Set environment variables in Vercel Dashboard

```
NODE_ENV=production
ALLOWED_ORIGINS=https://quantumvector.sh,https://quantumvector.io
SMTP_HOST=smtp.gmail.com
SMTP_USER=hr@quantumvector.sh
SMTP_PASS=<app-password>
RAZORPAY_KEY_ID=<key>
RAZORPAY_KEY_SECRET=<secret>
JWT_SECRET=<long-random-string>
```

### Deploy

```bash
# Preview
vercel

# Production
vercel --prod
```

### Custom Domain

In Vercel Dashboard → Project Settings → Domains:
- Add `quantumvector.sh` → set CNAME to `cname.vercel-dns.com`
- Add `www.quantumvector.sh`

---

## 📦 Flutter Dependencies

| Package | Purpose |
|---------|---------|
| `go_router` | Client-side routing |
| `google_fonts` | Space Grotesk, Inter, JetBrains Mono |
| `flutter_animate` | Hero entrance animations |
| `http` / `dio` | API calls to backend |
| `url_launcher` | Open Razorpay, Instagram, etc. |
| `provider` | State management |
| `cached_network_image` | Image caching |

---

## 🔧 Node.js Dependencies

| Package | Purpose |
|---------|---------|
| `express` | HTTP server framework |
| `cors` | Cross-origin for Flutter web |
| `helmet` | Security headers |
| `express-rate-limit` | Protect contact/enroll endpoints |
| `joi` | Request body validation |
| `nodemailer` | Email notifications |
| `compression` | Gzip responses |
| `morgan` | Request logging |

---

## 🔮 Roadmap

- [ ] Student login + JWT auth
- [ ] Course content LMS (video player, progress tracking)
- [ ] Razorpay payment integration (direct from enrollment form)
- [ ] Admin dashboard for enrollment management
- [ ] Blog / DevOps articles section
- [ ] Push notifications for upcoming batches
- [ ] Certificate generation on completion
- [ ] PostgreSQL / MongoDB database integration

---

## 📞 Contact

- 📧 hr@quantumvector.sh  
- 🌐 [quantumvector.sh](https://quantumvector.sh)  
- 📸 [@devops__community](https://instagram.com/devops__community)  
- 🏢 Kukatpally, Hyderabad, Telangana

---

© 2026 Quantum Vector from TheDevOpsCommunity
