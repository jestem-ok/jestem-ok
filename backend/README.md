# Backend

Java 21 · Spring Boot 4.1 · Maven · PostgreSQL · Flyway

## Run locally

```bash
docker compose up -d        # from the repository root: starts PostgreSQL
cd backend
mvn spring-boot:run
```

No docker compose? `mvn spring-boot:test-run` starts the app with a temporary database in Docker (data is lost on stop).

| Address | What |
|---|---|
| http://localhost:8080/api/ping | test endpoint |
| http://localhost:8080/actuator/health | health check |
| http://localhost:8080/swagger-ui.html | API documentation |

## Tests

```bash
mvn verify
```

Tests use a real PostgreSQL started by Testcontainers, so **Docker must be running**.

## Structure

Code is grouped by feature, not by layer, so each feature folder holds its controller, service, repository and entities:

```
src/main/java/pl/jestemok/
├── JestemOkApplication.java
├── api/              shared API pieces (ping, error handling)
├── senior/           registration, settings          (planned)
├── contact/          people alerted on a missed check-in (planned)
├── checkin/          daily check-ins, scheduler      (planned)
└── notification/     SmsSender, PushSender           (planned)
```

Database changes: see [src/main/resources/db/migration/README.md](src/main/resources/db/migration/README.md).

## Configuration

| Variable | Default | Meaning |
|---|---|---|
| `DB_URL` | `jdbc:postgresql://localhost:5432/jestemok` | database address |
| `DB_USER` | `jestemok` | database user |
| `DB_PASSWORD` | `jestemok` | database password |
