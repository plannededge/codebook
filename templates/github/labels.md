---
document_name: "labels.md"
location: "templates/github/labels.md"
codebook_id: "CB-TPL-LABELS-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "template"
purpose: "Standard label conventions for GitHub repositories"
category: "templates"
subcategory: "github"
status: "active"
ai_parser_instructions: |
  This defines standard GitHub labels.
  Use these labels for issues and PRs.
  Colors are suggestions; adjust for project.
---

# GitHub Labels Conventions

[!FIXED!]
## Purpose

Provide a consistent labeling system for GitHub issues and pull requests. Labels enable effective triage, filtering, and tracking.
[!FIXED!]

---

=== STANDARD LABELS ===
<!-- AI:LABELS:START -->

### Type Labels

| Label | Color | Description |
|-------|-------|-------------|
| `bug` | #d73a4a (red) | Something isn't working |
| `feature` | #0075ca (blue) | New feature request |
| `enhancement` | #a2eeef (teal) | Improvement to existing feature |
| `documentation` | #0052cc (dark blue) | Documentation changes |
| `question` | #d876e3 (purple) | Needs clarification or discussion |
| `refactor` | #fbca04 (yellow) | Code improvement, no functional change |

### Priority Labels

| Label | Color | Description |
|-------|-------|-------------|
| `priority: critical` | #b60205 (dark red) | Must be fixed immediately |
| `priority: high` | #d93f0b (orange) | Should be fixed soon |
| `priority: medium` | #fbca04 (yellow) | Normal priority |
| `priority: low` | #0e8a16 (green) | Nice to have |

### Status Labels

| Label | Color | Description |
|-------|-------|-------------|
| `help wanted` | #008672 (green) | Extra attention needed |
| `good first issue` | #7057ff (purple) | Good for newcomers |
| `blocked` | #d73a4a (red) | Waiting on something |
| `in progress` | #0052cc (blue) | Currently being worked on |
| `needs review` | #fbca04 (yellow) | Ready for review |
| `wontfix` | #ffffff (white) | Will not be addressed |
| `duplicate` | #cfd3d7 (gray) | Already exists |
| `invalid` | #cfd3d7 (gray) | Not valid |

### Component Labels (Customize per project)

| Label | Color | Description |
|-------|-------|-------------|
| `frontend` | #1d76db (blue) | Frontend related |
| `backend` | #5319e7 (purple) | Backend related |
| `api` | #0e8a16 (green) | API related |
| `database` | #bfd4f2 (light blue) | Database related |
| `devops` | #f9d0c4 (peach) | DevOps/infrastructure |

<!-- AI:LABELS:END -->

---

=== USAGE GUIDELINES ===
<!-- AI:USAGE:START -->

### Applying Labels

1. **Type is required** - Every issue should have a type label
2. **Priority when known** - Add priority if urgency is clear
3. **Status as needed** - Update status labels as work progresses
4. **Components if relevant** - Add component labels for larger projects

### Label Hygiene

- **Consistency:** Use these labels across all repositories
- **Review regularly:** Remove unused labels quarterly
- **Don't over-label:** 2-4 labels per issue is usually sufficient
- **Update status:** Keep status labels current

### Label Combinations

| Combination | Meaning |
|-------------|---------|
| `bug` + `priority: critical` | Urgent bug fix needed |
| `feature` + `help wanted` | Feature needing contribution |
| `enhancement` + `good first issue` | Easy improvement for newcomers |
| `question` + `needs review` | Question needs team input |

<!-- AI:USAGE:END -->

---

=== CREATING LABELS ===
<!-- AI:CREATE:START -->

### GitHub CLI

```bash
# Create a label
gh label create "bug" --description "Something isn't working" --color "d73a4a"

# Create all standard labels
gh label create "bug" -d "Something isn't working" -c "d73a4a"
gh label create "feature" -d "New feature request" -c "0075ca"
gh label create "enhancement" -d "Improvement to existing" -c "a2eeef"
gh label create "documentation" -d "Documentation changes" -c "0052cc"
gh label create "priority: high" -d "Should be fixed soon" -c "d93f0b"
gh label create "priority: medium" -d "Normal priority" -c "fbca04"
gh label create "priority: low" -d "Nice to have" -c "0e8a16"
gh label create "help wanted" -d "Extra attention needed" -c "008672"
```

### Bulk Import

Labels can be exported/imported using JSON:

```json
[
  {"name": "bug", "color": "d73a4a", "description": "Something isn't working"},
  {"name": "feature", "color": "0075ca", "description": "New feature request"}
]
```

<!-- AI:CREATE:END -->
