---
document_name: "README.md"
location: "/bootstrap/README.md"
codebook_id: "CB-BOOTSTRAP-README-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "guide"
purpose: "Documentation for the Codebook bootstrap system"
category: "bootstrap"
status: "active"
---

# Codebook Bootstrap

This directory contains everything needed to bootstrap the Codebook system in any project.

## Quick Start

### Option 1: One-liner (Recommended)

Run this command in your project directory:

```bash
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh)
```

This will:
1. Clone/update codebook to `~/.claude/codebook-cache`
2. Copy the codebook structure to your project
3. Install a SessionStart hook for update notifications
4. Set you up to start using Claude as Head Cook

### Option 2: Manual Bootstrap

For users who prefer not to use curl|bash:

```bash
# Clone the repository
git clone --depth 1 https://github.com/plannededge/codebook.git /tmp/codebook

# Copy the seed file
cp /tmp/codebook/bootstrap/CLAUDE.seed.md ./CLAUDE.md

# Start Claude Code - it will complete the bootstrap
claude

# Clean up
rm -rf /tmp/codebook
```

When Claude reads the seed file, it will automatically complete the bootstrap process.

### Option 3: Initialize Existing Claude Code Session

If you already have Claude Code running, just tell it:

```
Initialize this project with Codebook from https://github.com/plannededge/codebook
```

Claude will clone the repo and set up the structure.

## What Gets Installed

The bootstrap process creates this structure in your project:

```
your-project/
├── CLAUDE.md                 # Head Cook operating manual
├── .claude/
│   ├── skills/               # Procedural guides
│   ├── hooks/
│   │   └── check-codebook-updates.sh
│   └── settings.local.json   # Claude Code settings
├── agentdocs/                # Agent definitions
├── buildlogs/                # Weekly development logs
├── devdocs/                  # Development documentation
├── standards/                # Coding standards
├── templates/                # Reusable templates
├── workflows/                # Process documentation
└── guides/                   # How-to guides
```

## Update Notifications

After bootstrap, a SessionStart hook checks for codebook updates each time you start Claude Code. If updates are available, you'll see a message like:

```
[Codebook] Updates available!
  To update: cd ~/.claude/codebook-cache && git pull
  Then re-run bootstrap in your project
```

Updates are **notify-only** - they won't automatically change your project files.

## Updating Your Project

When you want to apply codebook updates:

```bash
# Update the cache
cd ~/.claude/codebook-cache && git pull

# Re-run bootstrap in your project
bash ~/.claude/codebook-cache/bootstrap/init.sh /path/to/your/project
```

The bootstrap script preserves existing files, only adding new ones.

## Files in This Directory

| File | Purpose |
|------|---------|
| `init.sh` | One-liner bootstrap script |
| `CLAUDE.seed.md` | Minimal seed file for manual bootstrap |
| `README.md` | This documentation |

## Troubleshooting

### "git is required but not installed"

Install git for your platform:
- macOS: `xcode-select --install` or `brew install git`
- Ubuntu/Debian: `sudo apt install git`
- Windows: Download from https://git-scm.com/

### "Permission denied" when running init.sh

Make sure you're running with bash:
```bash
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh)
```

### Existing CLAUDE.md not replaced

The bootstrap script preserves existing CLAUDE.md files (unless they're seed files). To force update:
```bash
cp ~/.claude/codebook-cache/CLAUDE.md ./CLAUDE.md
```

### Hook not working

Verify the hook exists and is executable:
```bash
ls -la .claude/hooks/check-codebook-updates.sh
```

Check that `settings.local.json` has the SessionStart hook configured.

### APS setup incomplete

If you used `--with-aps` but some files are missing:
```bash
# Manually create APS scaffolding
mkdir -p .aps/agents .aps/prompts .aps/sessions .aps/reports
cp ~/.claude/codebook-cache/templates/aps/registry.template.yaml .aps/registry.yaml
cp ~/.claude/codebook-cache/templates/aps/git-hooks/* .git/hooks/
chmod +x .git/hooks/prepare-commit-msg .git/hooks/commit-msg
```

## Security

The bootstrap script:
- Uses `set -e` to fail fast on errors
- Doesn't overwrite existing files (merge only)
- Uses HTTPS for all git operations
- Hook script only reads git status, makes no writes
- No data is sent anywhere except git clone/fetch operations

You can review the script before running:
```bash
curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh | less
```

## APS (Agentic Provenance Standard)

To initialize Codebook with APS support:

```bash
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --with-aps
```

This creates:
- `.aps/` directory structure (agents/, prompts/, sessions/, reports/)
- `.aps/registry.yaml` - Agent registry template
- Git hooks for automatic trailer addition
- Session tracking infrastructure

**What you get:**
- Bronze tier APS compliance (basic attribution)
- Git hooks for automatic AI trailer addition
- Agent registry for tracking authorized agents
- Session tracking for cost management

**Next steps after APS setup:**
1. Edit `.aps/registry.yaml` to register your agents
2. Read `guides/aps-adoption.md` for adoption guide
3. See `standards/agentic-provenance.md` for full specification

**Without --with-aps:**
Codebook installs without APS scaffolding. You can add it later by:
1. Manually copying templates from `templates/aps/`
2. Running the bootstrap script again with `--with-aps`
