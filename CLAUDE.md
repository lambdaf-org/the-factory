# Factory

## What this is

You get a task and a folder full of context. You do the work autonomously. While working, you aggressively build and maintain your own map of everything in `notes/`.

## Folders

- `context/` — source material, organized however. Subfolders vary per topic.
- `hints/` — non-negotiable style and working rules. Always follow.
- `deliverable/` — where output goes. Never overwrite existing context.
- `task.md` — what to do.
- `notes/` — your metacognition. This is priority one.

## Context conventions

Structure is `context/topic-name/` with numbered subfolders. Could be one, could be ten. Each could be docs, code, anything. Don't assume, just read.

Inside any folder there may be `most_recent_docs/`. That's the current working state to continue from. Everything else is reference.

Output always goes to a new folder in `deliverable/`.

## Metacognition is priority one

Before doing any work, check `notes/`. If notes are sparse or missing, building them IS the first task. No planning, no writing, no output until you have a thorough map of the workspace.

Notes answer: where is what, what connects to what, what state is each thing in, where do I latch onto this next time.

Required notes (create or update every run):

`notes/map.md` — the master index. Every file and folder you found, what it contains, one line each. This is the table of contents for the whole workspace. A future run reads this first and instantly knows where everything is.

`notes/state.md` — what's done, what's in progress, what's missing, what's broken. The status board.

`notes/connections.md` — how things relate. Which code implements which doc section. Which doc references which other doc. Which parts contradict. The dependency graph in plain text.

`notes/author-voice.md` — how the author writes. Phrasing patterns, detail level, explanation style, what they emphasize, what they skip. Extracted from reading their existing text.

Additional `notes/topic-name.md` as needed for anything else a future run would benefit from knowing.

Keep notes factual and terse. Update existing notes rather than duplicating. Every run should leave the notes better than it found them.

If notes already exist from a prior run, read them first, then verify and update them as you read context. Don't trust stale notes blindly; things may have changed.

## Before anything else

Read EVERYTHING in `context/`. Every subfolder, every doc, every source file. Don't skim, don't skip. While reading, build or update `notes/`.

## Modeling the author

After reading everything, form a picture of how the author works from their existing text. Write it to `notes/author-voice.md`. Then proceed as the author would. The output should read like the author wrote it on a good day.

## Inconsistency detection

Flag contradictions in `notes/state.md` under an inconsistencies section. What contradicts what, where each version lives. Small obvious fixes, just fix in the output and note them. Ambiguous ones, flag without guessing.

## Execution

1. Read `hints/`
2. Check `notes/` — if sparse or missing, full context read + note-building is the task before anything else
3. Read EVERYTHING in `context/`, building or updating notes as you go
4. Read `task.md`
5. Read anything in `deliverable/` for prior output state
6. Plan the work, write `plan.md`
7. Create a new output folder in `deliverable/`
8. Execute step by step, cross-check against source
9. Assemble final output
10. Review end to end
11. Final pass on notes — update anything that changed during the run

## For existing office/binary documents

When the source or target is a format like `.docx`, `.pdf`, or a spreadsheet rather than plain text:

- Read with `pandoc` or `extract-text`
- Back up the original before modifying it
- Convert markdown to the target format with pandoc, or edit programmatically (for `.docx`, use python-docx)
