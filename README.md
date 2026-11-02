# Jestem OK

A daily check-in service for senior residents of Sopot.

Once a day the senior confirms that everything is fine, either by tapping **"Jestem OK"** in the mobile app or by replying to an SMS. If no confirmation arrives, the senior gets one reminder. If there is still no answer, the people they chose (family, neighbours, friends) get an alert so someone can check on them.

> **Status:** early development. The goal for December 2026 is a working system that sends check-ins and alerts real contacts.

## How it works

1. A senior is registered, either by themselves in the app or by a caregiver who then asks the senior to confirm by SMS.
2. Every day at the chosen time the senior gets a push notification (app users) or an SMS (SMS-only users).
3. The senior answers with the **Jestem OK** button or any SMS reply.
4. No answer → one SMS reminder → alert SMS to the senior's contacts.

More detail: [docs/architecture.md](docs/architecture.md).

## Repository layout

| Folder | What lives there | Owners |
|---|---|---|
| [`backend/`](backend/) | Java 21 + Spring Boot API, scheduler, SMS and push sending | backend team |
| [`mobile/`](mobile/) | React Native (Expo) app for iOS and Android | mobile team |
| [`docs/`](docs/) | Architecture, decisions, design prototype, setup notes | maintainers |
| [`scripts/`](scripts/) | Helper scripts (GitHub labels and starter issues) | maintainers |
| `.github/` | CI, issue and PR templates, code owners | maintainers |
| `.devcontainer/` | GitHub Codespaces setup: a full dev environment in the browser | maintainers |

## Getting started

**New to the project? Read [CONTRIBUTING.md](CONTRIBUTING.md) first.** It explains how we use Git, issues and pull requests.

### Option A: GitHub Codespaces (recommended on school computers)

Nothing to install. Click **Code → Codespaces → Create codespace on main**. Java, Maven, Node.js, Docker and the GitHub CLI are ready inside.

### Option B: your own computer

You need Git, Java 21, Maven, Docker and Node.js (LTS).

```bash
git clone https://github.com/jestem-ok/jestem-ok.git
cd jestem-ok
docker compose up -d          # starts PostgreSQL on localhost:5432
cd backend
mvn spring-boot:run           # API on http://localhost:8080
```

Useful backend addresses when it runs:

- Health check: http://localhost:8080/actuator/health
- API docs (Swagger UI): http://localhost:8080/swagger-ui.html
- Test endpoint: http://localhost:8080/api/ping

The mobile app instructions are in [mobile/README.md](mobile/README.md).

## Team

| Role | Responsibility |
|---|---|
| Tech lead | Architecture, backend, task planning, final say on scope |
| Mobile lead | Mobile app architecture, required reviewer for `mobile/` |
| Mobile developer | Day-to-day mobile work, first point of contact for students |
| Product owners (students) | Decide *what* we build: user stories and priorities |
| Student developers | Mobile screens and features through issues and pull requests |

Everyone who contributed is listed in [CONTRIBUTORS.md](CONTRIBUTORS.md).
