# 0002: Java 21, Spring Boot, PostgreSQL

**Status:** accepted · 2026-10

## Context

The backend developer knows Java best. AI tools that students use know Spring Boot very well.

## Decision

- **Java 21** (LTS) with **Spring Boot 4.1** and **Maven**.
- **PostgreSQL** as the database, **Flyway** for migrations, **Spring Data JPA** for data access.
- **springdoc-openapi** to publish the API description the mobile app codes against.
- **Testcontainers** so tests run against a real PostgreSQL.
- **Docker** for local development and deployment.

## Consequences

- Plenty of documentation and examples.
- Needs Docker locally for tests; Codespaces provides it.
- Hosting must support a Java app and PostgreSQL; this is common.
