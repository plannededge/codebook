---
document_name: "project-setup.md"
location: "guides/project-setup.md"
codebook_id: "CB-GUIDE-SETUP-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "guide"
purpose: "Guide for setting up new projects with codebook"
category: "guides"
subcategory: "project-management"
related_docs:
  - ".claude/skills/project-setup.skill.md"
status: "active"
ai_parser_instructions: |
  This guide is for setting up new projects.
  For detailed procedures, reference @skill(project-setup).
  Section markers: === SECTION ===
---

# Project Setup Guide

[!FIXED!]
## Purpose

This guide walks you through setting up a new project with codebook. For detailed procedures, use @skill(project-setup).
[!FIXED!]

---

=== NEW PROJECT SETUP ===
<!-- AI:NEW:START -->

### Option A: Start Fresh

```bash
# 1. Create project directory
mkdir my-project && cd my-project

# 2. Initialize git
git init

# 3. Copy codebook structure
cp -r /path/to/codebook/.claude .
cp -r /path/to/codebook/agentdocs .
cp -r /path/to/codebook/buildlogs .
cp -r /path/to/codebook/devdocs .
cp -r /path/to/codebook/standards .
cp -r /path/to/codebook/templates .
cp -r /path/to/codebook/workflows .
cp -r /path/to/codebook/guides .
cp /path/to/codebook/CLAUDE.md .
cp /path/to/codebook/.gitignore .

# 4. Create README.md
echo "# My Project" > README.md

# 5. Create CHANGELOG.md
echo "# Changelog" > CHANGELOG.md

# 6. Create first buildlog
mkdir -p buildlogs/$(date +%Y)
# Copy and customize weekly template
```

### Option B: Add to Existing Project

```bash
# 1. Navigate to project
cd existing-project

# 2. Copy codebook essentials
cp -r /path/to/codebook/.claude .
cp -r /path/to/codebook/agentdocs .
cp -r /path/to/codebook/buildlogs .
cp /path/to/codebook/CLAUDE.md .

# 3. Adapt existing structure
# - Move docs to devdocs/ if applicable
# - Add YAML preambles to existing docs
# - Merge .gitignore entries

# 4. Create buildlog
mkdir -p buildlogs/$(date +%Y)
```

<!-- AI:NEW:END -->

---

=== ESSENTIAL FILES ===
<!-- AI:ESSENTIAL:START -->

### Must Have

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Head Cook operating manual |
| `.gitignore` | Git exclusions |
| `README.md` | Project overview |
| `buildlogs/` | Development tracking |
| `.claude/skills/` | At least skill index |
| `agentdocs/` | At least agent index |

### Should Have

| File | Purpose |
|------|---------|
| `CHANGELOG.md` | Version history |
| `devdocs/` | Project documentation |
| `standards/` | Project standards |

### Nice to Have

| File | Purpose |
|------|---------|
| `templates/` | Reusable templates |
| `workflows/` | Process docs |
| `guides/` | How-to guides |

<!-- AI:ESSENTIAL:END -->

---

=== CUSTOMIZATION ===
<!-- AI:CUSTOMIZE:START -->

### CLAUDE.md

1. Update project name and context
2. Adjust pre-flight checklist items
3. Add project-specific decision trees
4. Update quick reference links

### Standards

Customize these for your tech stack:
- `naming-conventions.md` - Language-specific rules
- `code-patterns.md` - Framework patterns
- `commit-messages.md` - Scope list

### Skills

Create project-specific skills:
- Testing procedures
- Deployment procedures
- Framework-specific patterns

<!-- AI:CUSTOMIZE:END -->

---

=== VERIFICATION ===
<!-- AI:VERIFY:START -->

### Pre-Flight Should Pass

After setup, pre-flight checklist should pass:

- [ ] `.gitignore` exists
- [ ] `README.md` exists
- [ ] `CHANGELOG.md` exists
- [ ] `CLAUDE.md` exists
- [ ] Current buildlog exists
- [ ] Skill index exists
- [ ] Agent index exists

### Test the System

1. Read CLAUDE.md
2. Check pre-flight passes
3. Make a test change
4. Log in buildlog
5. Commit with proper format

If all works, you're ready!

<!-- AI:VERIFY:END -->

---

=== COMMON ISSUES ===
<!-- AI:ISSUES:START -->

### Pre-Flight Fails

**Issue:** Checklist items fail
**Fix:** Use @skill(project-setup) to create missing items

### Buildlog Missing

**Issue:** No current buildlog
**Fix:** Copy from template, fill in week info

### Standards Don't Fit

**Issue:** Standards are too generic
**Fix:** Customize for your tech stack; add [?DYNAMIC?] sections

### Too Much Structure

**Issue:** Project is simple, codebook feels heavy
**Fix:** Start minimal - CLAUDE.md, buildlog, basic indexes

<!-- AI:ISSUES:END -->
