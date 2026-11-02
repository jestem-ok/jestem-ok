# Contributing to Jestem OK

Welcome! This guide explains how we work together. Read it once from top to bottom before your first task.

## The golden rules

1. **Never commit directly to `main`.** Every change goes through a pull request (PR). GitHub blocks direct pushes anyway.
2. **One issue = one branch = one pull request.** Keep PRs small. A small PR gets reviewed quickly.
3. **You must understand every line you submit.** AI tools (Claude, ChatGPT, Copilot) are welcome, but in review you may be asked to explain your code. "The AI wrote it" is not an explanation.
4. **Ask early.** Stuck for more than 30 minutes? Write a comment on your issue. Describe what you tried and paste the error message.

## Your first contribution

Your first task is to add yourself to [CONTRIBUTORS.md](CONTRIBUTORS.md). It teaches the whole workflow on a change that cannot break anything.

## Workflow step by step

### 1. Pick an issue

- Open the project board and look at the **Ready** column.
- Good first tasks have the `good first issue` label.
- Write a comment on the issue ("I'll take this") and assign yourself. Take **one issue at a time**.

### 2. Get the code

In Codespaces the code is already there. On your own computer, the first time:

```bash
git clone https://github.com/jestem-ok/jestem-ok.git
cd jestem-ok
```

Before starting any new task, get the latest `main`:

```bash
git switch main        # go to the main branch
git pull               # download the newest changes
```

### 3. Create a branch

Branch name = type + issue number + a few words:

```bash
git switch -c feature/42-senior-home-screen
```

| Prefix | Use for |
|---|---|
| `feature/` | new functionality |
| `fix/` | bug fixes |
| `docs/` | documentation only |
| `chore/` | configuration, tooling, cleanup |

### 4. Work and commit

Commit often, in small steps:

```bash
git status                       # see what changed
git add mobile/app/index.tsx     # choose the files to commit
git commit -m "Add Jestem OK button to senior home screen"
```

A good commit message:

- is in English and starts with a verb: *Add*, *Fix*, *Change*, *Remove*, *Update*;
- says **what** changed, short (under ~70 characters);
- is not "fix", "changes", "asdf" or "wip".

### 5. Push and open a pull request

```bash
git push -u origin feature/42-senior-home-screen
```

GitHub then shows a link to create a pull request. In the PR description:

- write `Closes #42` so the issue closes automatically after merge;
- describe what you did and how to test it;
- add a screenshot for every UI change.

Mark the PR as **Draft** if you want early feedback but are not finished.

### 6. Review

- The automatic checks (CI) must be green. Click **Details** to see what failed.
- At least one reviewer from the code owners must approve.
- When the reviewer asks for changes: fix them, commit, push again. The PR updates by itself. Do not open a new PR.
- Reply to every comment, even with just "Done".

### 7. Merge

After approval, the author clicks **Squash and merge**, then **Delete branch**. Move on to the next issue.

## If `main` changed while you worked

```bash
git switch main
git pull
git switch feature/42-senior-home-screen
git merge main          # bring the new changes into your branch
```

If Git reports a conflict, open the files it lists, choose the right version, then `git add` and `git commit`. Not sure? Ask in a comment on your PR before deleting anything.

## Reviewing other people's work

Reviewing is a skill, and you will do it too.

- Be kind and specific: "This button text is too small for seniors, could we use 24 px?" is better than "bad UI".
- Ask questions instead of giving orders.
- Approve when it works and you understand it. Perfect is not required.

## Code style

- **Language:** code, comments, commits and PRs in English. Text shown to users in the app is in Polish.
- **Formatting:** the editor follows [.editorconfig](.editorconfig). The mobile app will use Prettier and ESLint.
- **Names:** say what the thing is. `seniorPhoneNumber`, not `x` or `data2`.

## Where we talk

| Place | Use for |
|---|---|
| GitHub issues | questions and decisions about a task: comment on the issue you are working on |
| GitHub pull requests | discussion about specific code |
| Group chat with the teachers | quick organisational things (meetings, deadlines) |

Anything about the project itself is written in the issue or PR, not only in the chat, so everyone can find it later.
