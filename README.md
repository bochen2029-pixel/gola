# 🎮 GOLA v7.2 — Reality Checker

**Game of Life Automation** — An organ procurement organization (OPO) simulation with emergent AI narrative and reality-checking.

![Version](https://img.shields.io/badge/version-7.2-blue)
![Docker](https://img.shields.io/badge/docker-ready-green)
![License](https://img.shields.io/badge/license-MIT-yellow)

---

## 🔒 Security

This game runs in a **sandboxed Docker container** for your protection:

| Security Feature | Description |
|-----------------|-------------|
| 🔐 Non-root user | Container runs as unprivileged user |
| 📁 Read-only filesystem | Cannot modify system files |
| 🚫 No privileges | `no-new-privileges` prevents escalation |
| ⬇️ Dropped capabilities | All Linux capabilities removed |
| 🌐 CSP headers | Only whitelisted AI APIs can be contacted |
| 💾 Memory limited | Max 128MB RAM |
| ⚡ CPU limited | Max 0.5 CPU cores |

---

## 🚀 Quick Start (Windows 11)

### Option 1: One-Line Install (Easiest)

Open **PowerShell** and paste:

```powershell
irm https://raw.githubusercontent.com/YOUR_USERNAME/gola/main/install.ps1 | iex
```

### Option 2: Manual Docker Run

```powershell
docker run -d -p 8080:8080 --name gola ghcr.io/YOUR_USERNAME/gola:latest
Start-Process "http://localhost:8080"
```

### Option 3: Download & Run Locally

```powershell
# Download the game
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YOUR_USERNAME/gola/main/frontend/index.html" -OutFile "$env:TEMP\gola.html"

# Open in browser
Start-Process "$env:TEMP\gola.html"
```

---

## 📋 Commands Reference

| Action | Command |
|--------|---------|
| **Start** | `docker start gola-game` |
| **Stop** | `docker stop gola-game` |
| **View logs** | `docker logs gola-game` |
| **Uninstall** | `docker rm -f gola-game` |
| **Update** | `docker pull ghcr.io/YOUR_USERNAME/gola:latest && docker rm -f gola-game && docker run -d -p 8080:8080 --name gola-game ghcr.io/YOUR_USERNAME/gola:latest` |

---

## 🛠️ Build from Source

```powershell
# Clone the repository
git clone https://github.com/YOUR_USERNAME/gola.git
cd gola

# Build and run with Docker Compose
docker-compose up -d --build

# Open in browser
Start-Process "http://localhost:8080"
```

---

## 📁 Project Structure

```
gola/
├── Dockerfile              # Container build instructions
├── docker-compose.yml      # Container orchestration
├── nginx.conf              # Web server configuration
├── install.ps1             # Windows installer script
├── README.md               # This file
├── frontend/
│   └── index.html          # The game (single HTML file)
└── .github/
    └── workflows/
        └── docker-publish.yml  # Auto-build on push
```

---

## 🎮 Game Features

- **Realistic OPO simulation** — Manage organ procurement operations
- **AI-powered dialogue** — Characters respond dynamically via LLM
- **Reality Checker** — AI QC layer ensures narrative consistency
- **Relationship matrix** — Characters remember interactions
- **Multiple AI providers** — Cerebras, OpenAI, Anthropic, Groq support

---

## ⚙️ Configuration

The game uses **Cerebras API** by default (free tier available). To use your own API key:

1. Click the ⚙️ gear icon in-game
2. Enter your API key
3. Click "Test Connection"
4. Save

---

## 📜 Version History

### v7.2 (Current)
- Fixed AI response extraction for reasoning models
- Added scrollable log/cases panels
- Improved character death/termination detection
- Enhanced dialogue differentiation by speaker

### v7.1
- Added IT Infrastructure tiers
- Game history tracking
- Relationship trends

### v7.0
- Reality Checker foundation
- Relationship matrix
- Emotional state system

---

## 📄 License

MIT License — Free to use, modify, and distribute.

---

## 🙏 Credits

Created by **Bo Chen** (bochen2079)

Built with assistance from **Claude** (Anthropic)
