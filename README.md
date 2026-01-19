# Codebook

**A "Turnkey Kitchen" for AI-Assisted Software Development**

Codebook provides everything you need to "vibe code" high-quality, production-ready software with AI assistance. It's not just templates—it's a complete orchestration system with a Head Cook (Claude) at the helm.

## What is Codebook?

Codebook is a structured system that transforms how you work with AI coding assistants. Instead of ad-hoc prompting, you get:

- **Head Cook (Claude)** - An orchestrating agent that ensures your project runs smoothly
- **Agents** - Specialized roles created on-demand as project complexity grows
- **Skills** - Detailed procedural guides for common tasks
- **Standards** - Consistent rules and conventions
- **Buildlogs** - Recommended tracking that prevents context loss
- **DevDocs** - Comprehensive development documentation

## Why Codebook?

### The Problem

Working on software projects with AI assistants gets complicated:
- Projects start unstructured, leading to inconsistency
- As projects grow, AI context becomes stale
- Code gets duplicated, errors get re-introduced
- Decisions are lost, patterns forgotten

### The Solution

Codebook solves this by:
1. **Pre-flight checks** - Nothing starts until fundamentals are in place
2. **Buildlog tracking** - Every decision, issue, and resolution is tracked
3. **Skills and standards** - Consistent procedures and rules
4. **Agent delegation** - Specialized roles for complex tasks
5. **Cross-referenced documentation** - Everything links together with unique IDs

## Quick Start

### One-liner Install (Recommended)

Run this in your project directory:

```bash
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh)
```

Then start Claude Code - it will read CLAUDE.md and become the Head Cook.

### With APS (AI Attribution)

To include Agentic Provenance Standard scaffolding:

```bash
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --with-aps
```

This adds:
- `.aps/` directory structure
- Agent registry template
- Git hooks for automatic AI attribution
- Session tracking infrastructure

### Manual Install

```bash
# Clone codebook
git clone --depth 1 https://github.com/plannededge/codebook.git /tmp/codebook

# Copy to your project
cp -r /tmp/codebook/.claude your-project/
cp -r /tmp/codebook/agentdocs your-project/
cp -r /tmp/codebook/buildlogs your-project/
cp -r /tmp/codebook/checklists your-project/
cp -r /tmp/codebook/devdocs your-project/
cp -r /tmp/codebook/guides your-project/
cp -r /tmp/codebook/standards your-project/
cp -r /tmp/codebook/templates your-project/
cp -r /tmp/codebook/workflows your-project/
cp /tmp/codebook/CLAUDE.md your-project/

# Clean up
rm -rf /tmp/codebook
```

See [Quickstart Guide](guides/quickstart.md) for detailed instructions.

## Directory Structure

```
codebook/
├── CLAUDE.md                 # Head Cook operating manual (START HERE)
├── bootstrap/                # Bootstrap scripts for new projects
│   ├── init.sh               # One-liner install script
│   ├── CLAUDE.seed.md        # Minimal seed for manual bootstrap
│   └── README.md             # Bootstrap documentation
├── .claude/
│   ├── skills/               # Procedural guides (how to do things)
│   └── rules/                # CLI usage rules (safe CLI patterns)
├── agentdocs/                # Agent definitions (who does what)
├── checklists/               # Verification checklists (security, quality)
├── devdocs/                  # Development documentation
│   ├── architecture/         # System design
│   ├── business/             # Business requirements
│   ├── data/                 # Database design
│   └── ui/                   # UI documentation
├── buildlogs/                # Weekly development logs
├── standards/                # Rules and conventions
├── templates/                # Reusable templates
│   ├── aps/                  # APS scaffolding (optional)
│   ├── documents/            # Document templates
│   └── github/               # GitHub templates
├── workflows/                # Process documentation
└── guides/                   # How-to guides
```

## Core Concepts

### Head Cook

Claude acts as the Head Cook—an orchestrator who ensures the kitchen runs smoothly. The Head Cook:
- Runs pre-flight checks before any work
- Delegates to specialized agents when needed
- Maintains documentation and buildlogs
- Prevents knowledge decay

### Agents and Skills

| Concept | Purpose | Example |
|---------|---------|---------|
| **Agent** | Who does what (role definition) | Code Chef, Review Chef |
| **Skill** | How to do things (procedure) | git-workflow, code-quality |

Agents are created on-demand as project complexity requires. Start with just Head Cook.

### Buildlogs

Buildlogs are **recommended** for complex projects. They track:
- `#micro-decision` - Why you chose something
- `#commit` - What was committed
- `#issue-encountered` - Problems found
- `#resolution` - How problems were solved
- `#gap-identified` - Missing documentation

### Codebook IDs

Every document has a unique identifier for reliable cross-referencing:

```
CB-{CATEGORY}-{SUBCATEGORY}-{SEQUENCE}

Examples:
CB-MASTER-001     → CLAUDE.md
CB-AGENT-HEAD-001 → head-cook.agent.md
CB-SKILL-GIT-001  → git-workflow.skill.md
CB-STD-APS-001    → agentic-provenance.md
```

### Agentic Provenance Standard (APS)

**Optional** framework for AI attribution and auditability. When enabled, APS provides:
- Unique agent identifiers with versioning
- Git trailer-based attribution in commits
- Token and cost tracking per session
- Multi-agent collaboration support

Enable during bootstrap with `--with-aps` flag. See `standards/agentic-provenance.md` for details.

## Key Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Head Cook operating manual |
| `bootstrap/init.sh` | One-liner install script |
| `.claude/skills/_skill-index.md` | Registry of all skills |
| `.claude/rules/_rules-index.md` | Registry of CLI rules |
| `agentdocs/_agent-index.md` | Registry of all agents |
| `checklists/_checklists-index.md` | Registry of checklists |
| `buildlogs/_buildlog-index.md` | Buildlog registry |
| `.aps/registry.yaml` | Agent registry (if using APS) |
| `standards/_standards-index.md` | Standards registry |

## Getting Started

1. **Read CLAUDE.md** - Understand how Head Cook operates
2. **Run Pre-Flight** - Ensure fundamentals are in place
3. **Create Buildlog** - Start tracking from day one
4. **Follow Standards** - Consistent patterns from the start
5. **Create Agents As Needed** - Don't over-engineer upfront

## Documentation

- [Quickstart Guide](guides/quickstart.md) - Get started in 5 minutes
- [Project Setup Guide](guides/project-setup.md) - Set up a new project
- [Standards Overview](standards/_standards-index.md) - Rules to follow
- [Skills Overview](.claude/skills/_skill-index.md) - Available procedures

## Contributing

1. Fork the repository
2. Create a feature branch following `standards/naming-conventions.md`
3. Make changes following `standards/code-patterns.md`
4. Commit using `standards/commit-messages.md` format
5. Submit PR using `templates/github/pr.template.md`

## Versioning

Codebook follows semantic versioning:
- **Major** - Breaking changes to structure
- **Minor** - New features, agents, skills
- **Patch** - Fixes and improvements

See [CHANGELOG.md](CHANGELOG.md) for version history.

## Updating Codebook

### Update to Latest

```bash
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --update
```

This will:
1. Back up your existing files to `.codebook-backup/`
2. Update all codebook files to the latest version
3. Preserve the backup so you can restore if needed

### Pin to Specific Version

For reproducible installs, pin to a specific release tag:

```bash
# Install specific version
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/v1.0.0/bootstrap/init.sh)

# Update to specific version
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/v1.0.0/bootstrap/init.sh) --update
```

### Version Tracking

After installation, your codebook version is tracked in `.claude/codebook-version`. The bootstrap script will notify you when updates are available.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Remember:** The kitchen is only as good as it is maintained. A stale codebook leads to stale code.
