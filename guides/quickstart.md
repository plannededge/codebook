---
document_name: "quickstart.md"
location: "guides/quickstart.md"
codebook_id: "CB-GUIDE-QUICKSTART-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "guide"
purpose: "Quick introduction to using codebook as your development kitchen"
category: "guides"
subcategory: "getting-started"
status: "active"
ai_parser_instructions: |
  This is a quickstart guide for new users.
  Section markers: === SECTION ===
---

# Codebook Quickstart Guide

[!FIXED!]
## What is Codebook?

Codebook is a "turnkey kitchen" for AI-assisted software development. It provides:

- **Head Cook** (Claude) - An orchestrating agent that ensures your project runs smoothly
- **Agents** - Specialized roles for different tasks
- **Skills** - Detailed procedural guides
- **Standards** - Rules and conventions to follow
- **Buildlogs** - Mandatory development tracking

Think of it as a complete system for building production-quality software with AI assistance.
[!FIXED!]

---

=== 5-MINUTE SETUP ===
<!-- AI:SETUP:START -->

### Step 1: Copy Codebook

```bash
# Clone the codebook repository
git clone https://github.com/your-org/codebook.git

# Or copy to an existing project
cp -r codebook/.claude your-project/
cp -r codebook/agentdocs your-project/
cp -r codebook/buildlogs your-project/
cp codebook/CLAUDE.md your-project/
```

### Step 2: Customize CLAUDE.md

Edit `CLAUDE.md` for your project:
- Update project-specific sections
- Adjust pre-flight checklist if needed

### Step 3: Create First Buildlog

```bash
mkdir -p buildlogs/2026
cp buildlogs/templates/weekly.buildlog.template.md buildlogs/2026/week-XX.buildlog.md
```

### Step 4: Run Pre-Flight

Read CLAUDE.md and verify:
- [ ] .gitignore exists
- [ ] README.md exists
- [ ] Buildlog exists
- [ ] Basic structure is in place

**You're ready to start!**

<!-- AI:SETUP:END -->

---

=== KEY CONCEPTS ===
<!-- AI:CONCEPTS:START -->

### Head Cook

You (Claude) are the Head Cook. Your job is to:
- **Orchestrate** - Ensure the kitchen runs smoothly
- **NOT cook everything** - Delegate when appropriate
- **Maintain** - Keep documentation current

### Pre-Flight Checklist

Before ANY coding:
1. Check CLAUDE.md pre-flight checklist
2. Ensure buildlog is current
3. Verify documentation is accurate

**Never skip pre-flight.**

### Buildlogs

Buildlogs are **mandatory**. They capture:
- `#micro-decision` - Why you chose something
- `#commit` - What was committed
- `#issue-encountered` - Problems found
- `#resolution` - How problems were solved
- `#gap-identified` - Missing documentation

### Skills vs Agents

| Skills | Agents |
|--------|--------|
| How to do things | Who does what |
| Detailed procedures | Role definitions |
| Everyone can use | Specialized roles |

<!-- AI:CONCEPTS:END -->

---

=== DAILY WORKFLOW ===
<!-- AI:WORKFLOW:START -->

### Start of Session

1. Open CLAUDE.md
2. Run pre-flight checklist
3. Check current buildlog
4. Start work

### During Work

1. Log decisions with `#micro-decision`
2. Reference relevant devdocs
3. Follow applicable skills
4. Commit with proper messages

### End of Session

1. Update buildlog
2. Note any unresolved items
3. Update documentation if needed

<!-- AI:WORKFLOW:END -->

---

=== COMMON TASKS ===
<!-- AI:TASKS:START -->

### Adding a Feature

1. Check pre-flight
2. Review relevant devdocs
3. Log start in buildlog
4. Implement following standards
5. Commit with conventional format
6. Update buildlog with `#commit`

### Fixing a Bug

1. Log issue with `#issue-encountered`
2. Investigate and fix
3. Log fix with `#resolution`
4. Commit with `fix(scope): description`

### Creating Documentation

1. Identify type (devdoc, guide, etc.)
2. Use appropriate template
3. Add YAML preamble
4. Register in relevant index
5. Log with `#micro-decision`

### Creating an Agent

When complexity requires delegation:
1. Use @skill(agent-creation)
2. Select appropriate template
3. Customize for project
4. Register in agent index

<!-- AI:TASKS:END -->

---

=== DIRECTORY MAP ===
<!-- AI:MAP:START -->

```
your-project/
├── CLAUDE.md              # Start here - Head Cook manual
├── .claude/skills/        # How to do things
├── agentdocs/             # Who does what
├── devdocs/               # Project documentation
├── buildlogs/             # MANDATORY development logs
├── standards/             # Rules to follow
├── templates/             # Reusable templates
├── workflows/             # Process documentation
└── guides/                # How-to guides
```

<!-- AI:MAP:END -->

---

=== NEXT STEPS ===
<!-- AI:NEXT:START -->

1. **Read CLAUDE.md thoroughly** - It's your operating manual
2. **Explore skills** - See what procedures are available
3. **Check standards** - Know the rules
4. **Start a buildlog** - Begin tracking immediately
5. **Create agents as needed** - Don't over-engineer upfront

<!-- AI:NEXT:END -->
