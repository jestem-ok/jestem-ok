# 0004: App first, SMS for seniors without a smartphone

**Status:** accepted · 2026-10

## Context

Some seniors have no smartphone. Every SMS costs money; push notifications are free.

## Decision

- Each senior has a channel: **APP** or **SMS**.
- APP: daily push notification with a "Jestem OK" action. No answer → **one SMS reminder** → alert to contacts.
- SMS: daily SMS; any reply counts as confirmation. No answer → one reminder → alert to contacts.
- Alerts to contacts are always SMS.
- We need an SMS gateway that can **receive** replies (webhook), e.g. SMSAPI.

## Consequences

- On a normal day an app user costs nothing.
- An SMS-only senior costs roughly 30–40 SMS per month. This number goes to the city.
- The backend needs `SmsSender` and `PushSender` interfaces with fake implementations for development.
