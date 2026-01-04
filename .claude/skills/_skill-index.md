---
document_name: "_skill-index.md"
location: ".claude/skills/_skill-index.md"
codebook_id: "CB-SKILL-INDEX"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "index"
purpose: "Registry of all skills available to agents - defines what procedural capabilities exist"
category: "skills"
status: "active"
ai_parser_instructions: |
  This is the skill registry. Use to find available skills.
  Reference skills using: @skill(skill-name)
  Each skill has procedures that agents can follow.
  Skills are project-specific and detailed.
---

# Skill Registry

[!FIXED!]
## About Skills

Skills are **detailed procedural manuals** that define HOW to do specific tasks. Unlike agents (which define roles), skills are step-by-step guides that any agent can reference.

### Skill vs Agent

| Aspect | Skill | Agent |
|--------|-------|-------|
| Purpose | How to do something | Who does what |
| Granularity | Detailed procedures | Role definition |
| Reusability | Used by multiple agents | Unique identity |
| Location | `.claude/skills/` | `agentdocs/` |
[!FIXED!]

---

=== REGISTERED SKILLS ===
<!-- AI:REGISTRY:START -->

[?DYNAMIC?]
| Codebook ID | Skill Name | File | Purpose | Status |
|-------------|------------|------|---------|--------|
| CB-SKILL-SETUP-001 | project-setup | project-setup.skill.md | Initialize new projects with all fundamentals | active |
| CB-SKILL-GITFLOW-001 | git-workflow | git-workflow.skill.md | Git operations, branching, commits | active |
| CB-SKILL-CODEQUAL-001 | code-quality | code-quality.skill.md | Code standards and quality checks | active |
| CB-SKILL-AGENTCREATE-001 | agent-creation | agent-creation.skill.md | Create new agents from templates | active |
[?DYNAMIC?]

<!-- AI:REGISTRY:END -->

---

=== SKILL CATEGORIES ===
<!-- AI:CATEGORIES:START -->

### Project Management
- @skill(project-setup) - Initialize and verify project fundamentals

### Development
- @skill(code-quality) - Code standards and best practices
- @skill(git-workflow) - Git operations and workflows

### Orchestration
- @skill(agent-creation) - Creating and registering new agents

<!-- AI:CATEGORIES:END -->

---

=== SKILL FILE STRUCTURE ===
<!-- AI:STRUCTURE:START -->

All skill files must follow this structure:

```markdown
---
# YAML preamble with required fields
document_name: "{name}.skill.md"
location: ".claude/skills/{name}.skill.md"
codebook_id: "CB-SKILL-{ID}-001"
# ... other required fields
skill_metadata:
  category: ""           # Category from list above
  complexity: ""         # simple|intermediate|advanced
  estimated_time: ""     # Typical time to complete
  prerequisites: []      # Required knowledge/skills
---

# {Skill Name} Skill

=== PURPOSE ===
What this skill accomplishes.

=== PREREQUISITES ===
What's needed before using this skill.

=== PROCEDURES ===
Step-by-step procedures with clear instructions.

=== ANTI-PATTERNS ===
What NOT to do.

=== RELATED SKILLS ===
Links to related skills.
```

<!-- AI:STRUCTURE:END -->

---

=== ADDING NEW SKILLS ===
<!-- AI:ADDING:START -->

To add a new skill:

1. Create skill file in `.claude/skills/` following naming pattern: `{name}.skill.md`
2. Use the skill file structure above
3. Assign a unique Codebook ID: `CB-SKILL-{SHORTNAME}-NNN`
4. Add entry to the REGISTERED SKILLS table in this file
5. Log creation in buildlog with `#micro-decision`

<!-- AI:ADDING:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Review skill accuracy | Monthly | Head Cook |
| Update outdated procedures | As needed | Head Cook |
| Archive deprecated skills | Quarterly | Head Cook |
| Add new skills | As project evolves | Head Cook |

<!-- AI:MAINTENANCE:END -->
