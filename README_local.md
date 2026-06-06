# Factory

The Factory is a reusable scaffold for running Claude Code (or any capable coding agent) as an autonomous worker. You drop source material into `context/`, write what you want in `task.md`, and the agent does the work on its own. It fits any domain and any language. The agent builds and maintains its own map of the workspace, so every run picks up where the last one left off instead of starting cold.

## The idea

An autonomous agent reads a folder of context and a task, then does the work end to end. Before and during the work it aggressively maintains its own metacognitive notes in `notes/` — where everything is, how it connects, what state it's in, and where to latch on next time. Notes are priority one. No planning, no writing, no output until the workspace is mapped. A future run reads the notes first and is instantly oriented.

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

## Setup

```bash
npm install -g @anthropic-ai/claude-code
chmod +x launch.sh
```

## Run

```bash
./launch.sh          # interactive
./launch.sh --auto   # headless, fire and forget
```

## How a run works

1. Read `hints/`.
2. Check `notes/`. If they're sparse or missing, building them is the task before anything else.
3. Read everything in `context/`, building or updating notes while reading.
4. Read `task.md`.
5. Read anything already in `deliverable/` for prior output state.
6. Plan the work and write `plan.md`.
7. Create a new output folder in `deliverable/`.
8. Execute step by step, cross-checking against the source.
9. Assemble the final output.
10. Review it end to end.
11. Make a final pass on `notes/`, updating anything that changed during the run.

## Using it on your own work

Drop your source material into `context/`, organized as `context/topic-name/` with whatever subfolders make sense. If you're continuing earlier work, put the current state in a `most_recent_docs/` folder and the agent will pick up from there. Write what you want done in `task.md`. Tune `hints/` if you need to. Then run. Output appears in a new folder under `deliverable/`, and your context is left untouched.

## Customizing

`hints/` is yours to edit. `style.md` matters most — it sets language, register, and the writing rules the agent always follows. `CLAUDE.md` is the agent's operating manual; change it to change how the agent thinks about the whole process. Permissions for an `--auto` run come from the `--allowedTools` flag that `launch.sh` passes to its headless `claude -p` call; edit that flag to change what an unattended run may do without prompting. The `.claude/settings.json` file holds the tool permissions for interactive runs; edit its allow-list to taste.
