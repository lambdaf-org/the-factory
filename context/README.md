# context

Drop your source material here. Organize it as `context/topic-name/` with subfolders — numbered or named, one or many. Each can hold docs, code, anything. Don't assume a fixed shape; the structure follows your material, not the other way around.

If a `most_recent_docs/` subfolder is present, that is the current working state to continue from. Everything else is reference.

The agent reads everything in `context/` before doing any work, and builds its `notes/` map from what it finds. Existing context is never overwritten — output goes to `deliverable/`.

## Example

```
context/
├── README.md
├── topic-name/
│   ├── 01-source/
│   │   ├── overview.md
│   │   └── data.csv
│   ├── 02-reference/
│   │   └── spec.pdf
│   └── most_recent_docs/
│       └── draft.md
└── another-topic/
    └── notes.txt
```

Here `most_recent_docs/` holds the live draft to build on, `01-source/` and `02-reference/` are background, and `another-topic/` is a separate strand of material. Use whatever layout fits — this is only an illustration.
