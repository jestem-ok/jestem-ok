# Mobile app

React Native with [Expo](https://expo.dev), one app for iOS and Android.

> **Not created yet.** Creating the Expo project here is the first mobile task (see the issue "Create the Expo app in mobile/").

## Creating the app (mobile lead, once)

From the repository root:

```bash
cd mobile
npx create-expo-app@latest . --template default
npm run lint        # check that ESLint works
```

Then update this README with the real commands and commit `package.json` **and** `package-lock.json`.

## Running the app on your phone

1. Install **Expo Go** from the App Store or Google Play.
2. In `mobile/`, run `npx expo start`. In Codespaces use `npx expo start --tunnel`, because your phone cannot reach the codespace directly.
3. Scan the QR code. On iPhone use the camera; on Android use the Expo Go app.

Save a file and the app on your phone reloads by itself.

## Two modes, one app

| Mode | Who | Main screens |
|---|---|---|
| Senior | the person who confirms every day | big **Jestem OK** button, confirmation, contacts with call buttons |
| Caregiver | family member or friend | status of the senior, history, settings, contacts |

The look of the senior screens comes from the prototype in [docs/design/](../docs/design/). Use its colours and sizes; seniors need large text and large buttons.

## Rules for the UI

- Text shown to users is in **Polish**.
- Touch targets at least **56 px** high.
- Never show information with colour alone; always add text or an icon with a label.
- Until the backend is ready, use mock data so screens can be built and tested independently.
