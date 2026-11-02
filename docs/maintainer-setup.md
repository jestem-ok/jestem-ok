# Maintainer setup (one time)

Things that must be clicked in GitHub settings because they cannot live in the repository. Tick them off as you go.

## 1. Organization

- [ ] Apply for **GitHub Education** for teachers. It gives the organization GitHub Team for free (branch rules on private repos, more Actions minutes).
- [ ] Organization **Settings → Member privileges**: base permission **Read**.
- [ ] Create teams (**Teams → New team**):

  | Team | Members | Repository role |
  |---|---|---|
  | `maintainers` | tech lead, mobile lead | Admin |
  | `backend` | tech lead (+ mobile lead as backup) | Write |
  | `mobile` | mobile lead, mobile developer | Write |
  | `students` | all students | Write |

  Teams in [.github/CODEOWNERS](../.github/CODEOWNERS) must exist and have **Write** access, or GitHub ignores them.

## 2. Repository

- [ ] Create `jestem-ok/jestem-ok`. **Public** is simplest: free branch rules, unlimited Actions minutes, and no personal data lives in the code. Choose private if the school or city prefers it.
- [ ] Push this skeleton (see "First push" below).
- [ ] **Settings → General → Pull Requests**: allow only **Squash merging**; enable **Automatically delete head branches**.
- [ ] **Settings → General → Features**: Issues on, Wiki off (docs live in `docs/`).

## 3. Protect `main`

**Settings → Rules → Rulesets → New branch ruleset**, target the default branch:

- [ ] Restrict deletions; block force pushes.
- [ ] Require a pull request before merging:
  - 1 required approval,
  - **Require review from Code Owners**,
  - dismiss stale approvals when new commits are pushed,
  - require conversation resolution.
- [ ] Require status checks to pass: `Backend build and tests`, `Mobile lint and type check`. They appear in the list after CI has run once.
- [ ] Bypass list: `maintainers` only, for emergencies.

## 4. Labels and starter issues

With the [GitHub CLI](https://cli.github.com/) (preinstalled in Codespaces; on macOS `brew install gh`):

```bash
gh auth login
./scripts/setup-github.sh
```

## 5. Project board

**Organization → Projects → New project → Board**, name it *Jestem OK*:

- [ ] Columns: **Backlog → Ready → In progress → Review → Done**.
- [ ] Add an **Iteration** field, 1 week long.
- [ ] Add a **Priority** field: must / should / could.
- [ ] **Settings → Workflows**: auto-add issues from `jestem-ok/jestem-ok`; move to *Done* when closed; move to *Review* when a PR is opened.
- [ ] Link the project to the repository (repository → **Projects** tab).

## 6. Small things

- [ ] Add the Maven Wrapper: in `backend/` run `mvn -N wrapper:wrapper`, commit `mvnw`, `mvnw.cmd` and `.mvn/`, then change `mvn` to `./mvnw` in the CI workflow.
- [ ] Choose a **license** with the school (and later the city), e.g. MIT or EUPL-1.2, and add `LICENSE`. Without one, nobody else may legally reuse the code.

## First push

From the folder with this skeleton:

```bash
git init -b main
git add .
git commit -m "Add project skeleton"
git remote add origin https://github.com/jestem-ok/jestem-ok.git
git push -u origin main
```

The first push goes straight to `main` because the branch rules are not set yet. After step 3, everything goes through pull requests, maintainers included.
