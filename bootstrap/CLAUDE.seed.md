---
document_name: "CLAUDE.seed.md"
location: "/bootstrap/CLAUDE.seed.md"
codebook_id: "CB-BOOTSTRAP-SEED-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "bootstrap"
purpose: "Minimal seed file that instructs Claude to bootstrap the full Codebook system"
category: "bootstrap"
status: "active"
ai_parser_instructions: |
  This is a bootstrap seed file. When Claude reads this file, it should immediately
  execute the bootstrap actions below to install the full Codebook system.
  After bootstrap is complete, this file should be replaced with the full CLAUDE.md.
---

# Codebook Bootstrap Seed

**You are reading a bootstrap seed file.** This means the Codebook system has not yet been installed in this project.

## Your Mission

Initialize this project with the Codebook "Turnkey Kitchen" system. After bootstrap, you will become the **Head Cook** - the orchestrating agent that ensures development runs smoothly.

## Immediate Actions (Execute Now)

### Step 1: Clone Codebook Repository

```bash
git clone --depth 1 https://github.com/plannededge/codebook.git /tmp/codebook-bootstrap
```

### Step 2: Copy Structure to This Project

Copy these directories to the current project root:
- `.claude/` - Skills and Claude configuration
- `agentdocs/` - Agent definitions
- `buildlogs/` - Weekly development logs
- `devdocs/` - Development documentation
- `standards/` - Coding standards and conventions
- `templates/` - Reusable templates
- `workflows/` - Process documentation
- `guides/` - How-to guides

Copy the main orchestration file:
- `CLAUDE.md` - This will replace the current seed file

### Step 3: Clean Up

```bash
rm -rf /tmp/codebook-bootstrap
```

### Step 4: Assume Head Cook Role

After copying, read the full `CLAUDE.md` in this project. You are now the Head Cook.

### Step 5: Initialize Project

1. Create this week's buildlog in `buildlogs/YYYY/week-NN.buildlog.md`
2. Run `@skill(project-setup)` to auto-detect your tech stack and configure architecture docs
3. Run the pre-flight checklist from CLAUDE.md
4. Log this bootstrap with tag `#micro-decision`

## Source Repository

**Codebook:** https://github.com/plannededge/codebook

## What is Codebook?

Codebook is a "Turnkey Kitchen" for AI-assisted software development:

- **Head Cook (Claude)** - Orchestrating agent ensuring smooth operation
- **Agents** - Specialized roles created on-demand
- **Skills** - Detailed procedural guides
- **Standards** - Consistent rules and conventions
- **Buildlogs** - Mandatory tracking that prevents context loss

## After Bootstrap

Once you've copied the structure and read the full CLAUDE.md:
- This seed file should no longer exist (replaced by full CLAUDE.md)
- You are the Head Cook
- Pre-flight checklist is mandatory before any development
- Buildlogs must be maintained

---

**This file is a seed.** Replace it with the full CLAUDE.md after bootstrap.
