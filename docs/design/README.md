# Design prototype

A clickable mock-up of the **senior** screens, made before development. Open [`index.html`](index.html) in a browser; on a computer it shows as a phone-width column.

It is **not** the app: it sends nothing and has no backend. It shows layout, sizes, colours and the flow between screens.

| Screen | Shows |
|---|---|
| Dzisiaj | greeting, large **Jestem OK** button, shortcut to contact someone |
| Potwierdzenie | thank-you message with date and time |
| Bliscy | trusted contacts with **Zadzwoń** buttons, form to add one |

## What the mobile app takes from it

- Colours: background `#f7f6f2`, green `#256a47`, mint `#e3eee6`, text `#26302b`.
- Sizes: Jestem OK button 104 px high with 29 px text; every touch target at least 56 px.
- One main action per screen, icons always with text, calm tone without red alarms for the senior.

Known issues to fix in the real app: grey helper text is slightly below WCAG AA contrast, and sizes are in px, so they don't follow the phone's text-size setting.

Full design notes, in Polish: [prototype-notes-pl.md](prototype-notes-pl.md).
