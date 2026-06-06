# notes/

This is the agent's metacognition. It is auto-maintained by the agent across runs. You normally don't edit it by hand.

Notes are priority one. Before doing any work the agent checks `notes/`. If they're sparse or missing, building them is the first task — no planning, no writing, no output until the workspace is mapped.

Every run leaves the notes better than it found them. The agent reads the existing notes first, then verifies and updates them against the actual context rather than trusting stale state.

## Standard files

`map.md` — the master index. Every file and folder, one line each. Read this first; it tells you where everything is.

`state.md` — the status board. What's done, in progress, missing, broken. Flagged inconsistencies live here too: what contradicts what, and where each version is.

`connections.md` — how things relate. Which code implements which doc section, which docs cross-reference each other, where things contradict.

`author-voice.md` — how the source author writes. Phrasing, detail level, what they emphasize and skip. The output uses this so it reads like them.

The agent may add further `notes/topic-name.md` files whenever a future run would benefit from knowing something these four don't cover.
