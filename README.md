# the-factory

> A reusable scaffold for running Claude Code as an autonomous worker. Source material goes into `context/`, the job goes into `task.md`, and `./launch.sh` runs it.

![Bash](https://img.shields.io/badge/Bash-launcher-4EAA25?logo=gnubash&logoColor=white)

the-factory is a project skeleton rather than an application. It wraps the `claude` CLI in a single launcher and a fixed folder layout so a coding agent can pick up a folder of context plus a task and work through it on its own. The defining mechanic is metacognition. Before doing anything, the agent builds and maintains its own map of the workspace in `notes/`, so a later run reads those notes first and is oriented immediately rather than starting cold.

A run reads `hints/` for the working rules, reads everything in `context/`, reads `task.md`, plans, then writes its output to a fresh folder under `deliverable/`. Existing context is never overwritten. The structure is domain-agnostic and language-agnostic, and it follows whatever material gets dropped in.

## Quickstart

```bash
git clone https://github.com/lambdaf-org/the-factory
cd the-factory
npm install -g @anthropic-ai/claude-code
chmod +x launch.sh
./launch.sh          # interactive
./launch.sh --auto   # headless, unattended
```

The launcher checks that the `claude` CLI is installed and that `task.md` exists, then creates `deliverable/drafts` and `notes` if they are missing. The interactive mode opens a normal `claude` session. The `--auto` mode runs `claude -p` headless with `--max-turns 50` and an explicit `--allowedTools` allow-list, so an unattended run only touches the tools listed in `launch.sh`.

## Features

The agent loop is notes-first. The agent maintains `notes/map.md` (master index), `notes/state.md` (status and flagged inconsistencies), `notes/connections.md` (how things relate), and `notes/author-voice.md` (how the source author writes). Building these comes before any output when they are sparse or missing.

The layout is fixed and readable. `context/` holds source, `hints/` holds the rules, `task.md` holds the job, `deliverable/` holds output, and `notes/` holds the agent's working memory.

Continuation works by convention. A `most_recent_docs/` subfolder inside any context topic marks the live working state to build on. Everything else is treated as reference.

There are two run modes. One is interactive `claude`. The other is headless `claude -p` with a scoped tool allow-list for unattended work.

The operating manual is editable. `CLAUDE.md` defines how the agent thinks about the process, and `hints/style.md` sets the writing rules it always follows.

Office and binary files are handled explicitly. `CLAUDE.md` instructs the agent to read `.docx`, `.pdf`, and spreadsheets through `pandoc` or `python-docx`, and to back up originals before editing.

The project is MIT licensed.

## How it works

Each run follows the sequence in `CLAUDE.md`:

1. Read `hints/`.
2. Check `notes/`. If they are sparse or missing, building them is the task before anything else.
3. Read everything in `context/`, building or updating notes while reading.
4. Read `task.md`.
5. Read anything already in `deliverable/` for prior output state.
6. Plan the work and write `plan.md`.
7. Create a new output folder in `deliverable/`.
8. Execute step by step, cross-checking against the source.
9. Assemble the final output.
10. Review it end to end.
11. Make a final pass on `notes/`, updating anything that changed.

To apply it to other work, source is organized as `context/topic-name/` with whatever subfolders fit, the goal is written in `task.md`, `hints/` is tuned if needed, and then the launcher runs. Output lands in a new folder under `deliverable/` and the context is left untouched. The `hints/feedback.md` file is the channel for human review notes between runs. The agent reads it before starting and applies what it finds.

### Permissions

Interactive runs draw their tool permissions from `.claude/settings.local.json`. Headless `--auto` runs draw theirs from the `--allowedTools` flag passed to `claude -p` in `launch.sh`. Either allow-list can be edited to change what a run may do without prompting.

## Contributing

See [lambdaf-org/contributing](https://github.com/lambdaf-org/contributing).

## License

MIT. See the `LICENSE` file. Copyright (c) 2026 The Factory contributors.
