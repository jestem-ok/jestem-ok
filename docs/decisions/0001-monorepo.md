# 0001: One repository for backend, mobile and docs

**Status:** accepted · 2026-10

## Context

A small team with a short deadline. Students are learning Git and pull requests for the first time.

## Decision

One repository (`jestem-ok/jestem-ok`) with `backend/`, `mobile/` and `docs/`.

## Consequences

- One project board, one place to look, one set of rules to learn.
- One PR can change the API and the app together.
- CI uses path filters so a mobile change does not trigger the backend build.
- Labels (`backend`, `mobile`, `docs`) keep issues apart.
- Everyone can read everything. For a school project this is a benefit.
