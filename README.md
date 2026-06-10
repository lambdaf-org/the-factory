# Factory

> Drop in source, write a task, and an autonomous coding agent does the work while mapping the whole workspace as it goes.

![Shell](https://img.shields.io/badge/shell-bash-black)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](./LICENSE)

A reusable scaffold for running Claude Code (or any capable coding agent) as an autonomous worker. You put source material in `context/`, write what you want in `task.md`, and the agent runs the job end to end. As it works it builds and maintains its own notes in `notes/`, so every run picks up where the last one left off. Output lands in a fresh `deliverable/` folder and your context is left untouched.

## Setup

```bash
git clone https://github.com/lambdaf-org/the-factory
cd the-factory
npm install -g @anthropic-ai/claude-code
chmod +x launch.sh
```

## Run

```bash
./launch.sh          # interactive
./launch.sh --auto   # headless, fire and forget
```

## Features

- **Metacognition first.** Before any work the agent maps the workspace into `notes/`. No planning, writing, or output until the map exists.
- **Warm starts.** A future run reads `notes/` first and is oriented instantly, so it resumes work it can't see fresh.
- **Context stays safe.** Source in `context/` is never overwritten. Every run writes to a brand-new folder under `deliverable/`.
- **Domain agnostic.** Any language, any subject. Structure `context/` however your material fits.
- **Continue prior work.** A `most_recent_docs/` subfolder marks the live working state; the agent builds on it.
- **Headless mode.** `--auto` runs `claude -p` with a capped turn budget and a scoped tool allow-list for unattended jobs.
- **House style enforced.** `hints/` holds non-negotiable writing and working rules the agent always follows.
- **Office and binary docs.** Reads and writes `.docx`, `.pdf`, and spreadsheets via `pandoc`, `extract-text`, and python-docx.

## Layout

```
context/                source material, organized however
  topic-name/
    subfolder-1/          could be docs, code, anything
    subfolder-2/          varies per topic; could be 1, could be 10
      most_recent_docs/   if present, the current working state to continue from
hints/                  non-negotiable style and working rules (pre-populated)
deliverable/            output; a new folder per run, never overwrites context
notes/                  the agent's metacognition; it maintains these itself
task.md                 what to do
launch.sh               press go
CLAUDE.md               the agent's operating manual
.claude/                settings, including tool permissions
```

## How a run works

1. Read `hints/`.
2. Check `notes/`. If sparse or missing, building them is the task before anything else.
3. Read everything in `context/`, building or updating notes while reading.
4. Read `task.md`.
5. Read anything already in `deliverable/` for prior output state.
6. Plan the work and write `plan.md`.
7. Create a new output folder in `deliverable/`.
8. Execute step by step, cross-checking against the source.
9. Assemble the final output.
10. Review it end to end.
11. Make a final pass on `notes/`, updating anything that changed during the run.

The agent keeps four standard notes: `map.md` (master index of every file), `state.md` (status board plus flagged inconsistencies), `connections.md` (how things relate), and `author-voice.md` (how the source author writes). It adds more `notes/topic-name.md` files as a future run would benefit.

## Customizing

`hints/` is yours to edit, and `style.md` matters most: it sets language, register, and the writing rules the agent always follows. `CLAUDE.md` is the agent's operating manual; change it to change how the agent thinks about the whole process. Permissions for an `--auto` run come from the `--allowedTools` flag that `launch.sh` passes to its headless `claude -p` call. Tool permissions for interactive runs live in `.claude/settings.json`.

## Contributing

Lambdaforge is open source and contributions are welcome. Start with the [contributor guide](https://github.com/lambdaf-org/contributing), and see the org-wide [CONTRIBUTING](https://github.com/lambdaf-org/.github/blob/main/CONTRIBUTING.md) and [Code of Conduct](https://github.com/lambdaf-org/.github/blob/main/CODE_OF_CONDUCT.md).

## License

MIT. See [LICENSE](./LICENSE).
