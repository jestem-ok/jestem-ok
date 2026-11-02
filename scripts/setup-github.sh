#!/usr/bin/env bash
# Creates labels and the first batch of issues in the GitHub repository.
# Run ONCE, by a maintainer, after the first push:
#
#   gh auth login
#   ./scripts/setup-github.sh
#
# Labels can be re-run safely (they are updated). Issues are created again
# on every run, so answer "n" to the issues question the second time.

set -euo pipefail

REPO="${REPO:-jestem-ok/jestem-ok}"

if ! command -v gh >/dev/null; then
  echo "GitHub CLI (gh) is not installed. See https://cli.github.com/" >&2
  exit 1
fi
gh auth status >/dev/null 2>&1 || { echo "Run 'gh auth login' first." >&2; exit 1; }

echo "Repository: $REPO"

# ---------------------------------------------------------------- labels
label() { gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force >/dev/null; echo "  label: $1"; }

echo "Creating labels..."
# type
label "user-story"       "1d76db" "Something a user needs (written by product owners)"
label "task"             "c5def5" "Technical work"
label "bug"              "d73a4a" "Something does not work"
label "needs-discussion" "fbca04" "A decision is needed before work starts"
# area
label "backend"          "5319e7" "backend/ folder"
label "mobile"           "0e8a16" "mobile/ folder"
label "docs"             "0075ca" "Documentation"
label "infra"            "bfdadc" "CI, hosting, tooling"
label "dependencies"     "ededed" "Dependency updates"
# priority
label "must"             "b60205" "Without it the app makes no sense"
label "should"           "d93f0b" "Important, but the app works without it"
label "could"            "fef2c0" "Nice to have"
# help
label "good first issue" "7057ff" "Good for a first contribution"
label "help wanted"      "008672" "Extra attention is needed"

read -r -p "Create the starter issues now? [y/N] " answer
[[ "$answer" =~ ^[yY]$ ]] || { echo "Done (labels only)."; exit 0; }

# ---------------------------------------------------------------- issues
# issue "<title>" "<labels>" <<'EOF' ...body... EOF  -> prints the issue number
issue() {
  local title="$1" labels="$2" body url
  body="$(cat)"
  url="$(gh issue create --repo "$REPO" --title "$title" --label "$labels" --body "$body")"
  echo "  #${url##*/} $title" >&2
  echo "${url##*/}"
}

echo "Creating issues..."

FIRST=$(issue "Add yourself to CONTRIBUTORS.md" "task,docs,good first issue,must" <<'EOF'
**Everyone does this one**, as their own pull request. It teaches the whole workflow on a change that cannot break anything.

Follow `CONTRIBUTING.md` in the repository step by step:

- [ ] Create a branch `docs/<this-issue-number>-add-<your-name>`
- [ ] Add one line about yourself at the end of `CONTRIBUTORS.md`
- [ ] Commit, push, open a pull request with `Part of #<this-issue-number>` in the description
- [ ] Get an approval and merge it yourself (**Squash and merge**)

Do **not** write `Closes`, so the issue stays open for the next person. A maintainer closes it when everyone is in.
EOF
)

WRAPPER=$(issue "Add the Maven Wrapper to backend/" "task,backend,infra,must" <<'EOF'
Suggested owner: tech lead.

- [ ] In `backend/` run `mvn -N wrapper:wrapper`
- [ ] Commit `mvnw`, `mvnw.cmd` and `.mvn/`
- [ ] Change `mvn` to `./mvnw` in `.github/workflows/ci.yml` and the READMEs
- [ ] CI is green
EOF
)

EXPO=$(issue "Create the Expo app in mobile/" "task,mobile,must" <<'EOF'
Suggested owner: mobile lead. **Blocks all other mobile issues.**

- [ ] Expo app with TypeScript and Expo Router created in `mobile/` (see `mobile/README.md`)
- [ ] Folder structure decided and described in `mobile/README.md` (screens, components, api, theme)
- [ ] Theme file with the colours and sizes from `docs/design/`
- [ ] `npm run lint` works; CI "Mobile lint and type check" is green
- [ ] Runs on a real phone through Expo Go, also from Codespaces (`--tunnel`)
- [ ] Add an `npm` entry for `/mobile` to `.github/dependabot.yml`
EOF
)

issue "Mobile: API client and backend address configuration" "task,mobile,must" <<EOF >/dev/null
Depends on #$EXPO.

- [ ] One module that talks to the backend (base URL from configuration, JSON, error handling)
- [ ] Calls \`GET /api/ping\` and shows the result on a debug screen
- [ ] Mock mode: screens work without a backend, returning sample data
- [ ] Short description in \`mobile/README.md\`
EOF

issue "Mobile: mode selection, senior or caregiver" "task,mobile,good first issue,must" <<EOF >/dev/null
Depends on #$EXPO.

First screen after installing the app: *Jestem seniorem* / *Opiekuję się bliską osobą*.

- [ ] Two large buttons, at least 56 px high, Polish text
- [ ] The choice is remembered on the phone; the next start opens the right mode
- [ ] Screenshot in the PR
EOF

issue "Mobile: senior home screen with the Jestem OK button" "task,mobile,good first issue,must" <<EOF >/dev/null
Depends on #$EXPO.

Rebuild the **Dzisiaj** screen from the prototype in \`docs/design/\` (open \`index.html\` in a browser).

- [ ] Greeting with name and today's date in Polish
- [ ] Large **Jestem OK** button, same colours and sizes as the prototype
- [ ] Status text: confirmed today or not yet (mock data for now)
- [ ] Tapping the button opens the confirmation screen
- [ ] Screenshot in the PR
EOF

issue "Mobile: confirmation screen" "task,mobile,good first issue,must" <<EOF >/dev/null
Depends on #$EXPO.

The **Potwierdzenie** screen from the prototype in \`docs/design/\`.

- [ ] Thank-you message, date and time of the confirmation
- [ ] Button back to the home screen
- [ ] Nothing disappears by itself (no timers, no toasts)
- [ ] Screenshot in the PR
EOF

issue "Mobile: contacts screen with call buttons" "task,mobile,good first issue,should" <<EOF >/dev/null
Depends on #$EXPO.

The **Bliscy** screen from the prototype in \`docs/design/\`.

- [ ] List of contacts (mock data): avatar with initials, name, phone number
- [ ] **Zadzwoń** button opens the phone app (\`tel:\` link)
- [ ] Bottom navigation between *Dzisiaj* and *Bliscy*
- [ ] Screenshot in the PR
EOF

STORIES=$(issue "Product owners: add user stories as issues" "docs,user-story,must" <<'EOF'
Suggested owners: product owners.

- [ ] Every story becomes one issue made with the **User story** template (US-number in the title)
- [ ] Each has a priority (must / should / could) and is added to the project board
- [ ] Stories that are too big are split
- [ ] Review the list with the tech lead before the next weekly meeting
EOF
)

issue "Decide open questions and default values" "needs-discussion,must" <<'EOF' >/dev/null
Raised by the product owners. Decide, write the answers here, then close.

**Questions**

- [ ] Reminders are set once per senior. Who can change them when a senior has several caregivers?
- [ ] Default values: day starts at 04:00; undo window 30 s; alert at 12:00; reminders 08:00, 10:00, 11:30, then hourly until 20:00; registration code valid 24 h; escalation after 30 + 30 min.
- [ ] How many contacts at most, and are they alerted all at once or one after another?

Already decided: SMS is needed for seniors without a smartphone (decision 0004), so the paid SMS gateway stays.
EOF

issue "Backend: data model and first Flyway migration" "task,backend,must" <<'EOF' >/dev/null
Suggested owner: tech lead.

- [ ] Tables for seniors, contacts, check-in schedule and check-ins (confirmed / missed / escalated)
- [ ] Channel per senior: APP or SMS
- [ ] Log of sent and received messages
- [ ] Diagram or table of the model added to `docs/architecture.md`
EOF

issue "Backend: SmsSender and PushSender with fake implementations" "task,backend,must" <<'EOF' >/dev/null
Suggested owner: tech lead.

- [ ] `SmsSender` and `PushSender` interfaces
- [ ] Fake implementations that only log, active by default
- [ ] Real implementations enabled by configuration only (separate issues)
- [ ] Tests use the fakes
EOF

issue "Backend: senior registration and phone verification" "task,backend,must" <<EOF >/dev/null
Suggested owner: tech lead. Depends on the data model issue.

- [ ] Register a senior (self or by a caregiver), with consent SMS for caregiver registration
- [ ] Verification code by SMS, limited lifetime and attempts
- [ ] Endpoints visible in Swagger UI, agreed with the mobile lead
EOF

issue "Backend: daily check-in scheduler and escalation" "task,backend,must" <<'EOF' >/dev/null
Suggested owner: tech lead.

- [ ] Send the check-in at each senior's time (push or SMS), Europe/Warsaw
- [ ] No answer: one SMS reminder; still none: alert SMS to contacts
- [ ] Never sends twice for the same check-in (ShedLock)
- [ ] Tests for every branch of the flow, with a fixed clock
EOF

issue "Backend: receive SMS replies (gateway webhook)" "task,backend,must" <<'EOF' >/dev/null
Suggested owner: tech lead.

- [ ] Choose a gateway that supports two-way SMS; note the costs in the issue
- [ ] Webhook endpoint; any reply from a registered number confirms today's check-in
- [ ] Webhook protected against fake requests
EOF

issue "Infra: choose always-on hosting for the demo" "task,infra,should" <<'EOF' >/dev/null
Suggested owner: tech lead.

- [ ] Compare a few hosts that run a Java container and PostgreSQL and **do not sleep when idle**
- [ ] Note monthly cost (for the city) and how to deploy
- [ ] Decision record in `docs/decisions/`
EOF

echo
echo "Done. Created issues; the first one for everyone is #$FIRST, product owners start with #$STORIES."
echo "Maven Wrapper: #$WRAPPER. Expo app: #$EXPO."
echo "Add the issues to the project board (or enable auto-add in the board's workflows)."
