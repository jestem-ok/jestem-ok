# 0003: React Native with Expo for the mobile app

**Status:** accepted · 2026-10

## Context

We need iOS and Android. Nobody on the team is a mobile specialist. Students should write most of the app code and have never built one.

## Decision

React Native with **Expo** and TypeScript.

## Consequences

- One codebase for both platforms.
- Students test on their own phones by scanning a QR code with Expo Go.
- iOS builds run in Expo's cloud (EAS), so no Mac is needed for development builds.
- Push notifications through Expo's push service, free.
- JavaScript/TypeScript is easier for beginners than Swift or Kotlin.
- Publishing to the App Store still requires a paid Apple Developer account.
