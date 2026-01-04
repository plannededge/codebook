---
document_name: "_agent-index.md"
location: "agentdocs/_agent-index.md"
codebook_id: "CB-AGENT-INDEX"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "index"
purpose: "Registry of all agents - defines what roles exist in the development kitchen"
category: "agents"
status: "active"
ai_parser_instructions: |
  This is the agent registry. Use to find available agents.
  Reference agents using: @agent(agent-name)
  Each agent has a defined role and set of skills.
  Agents are created on-demand as project complexity requires.
---

# Agent Registry

[!FIXED!]
## About Agents

Agents are **role definitions** that specify WHO does WHAT. They define responsibilities, boundaries, and required skills. Agents are created on-demand as project complexity increases.

### Head Cook Philosophy

The Head Cook (Claude) starts alone and creates specialized agents when:
- Task complexity warrants delegation
- Specialized expertise is needed
- Parallel work would be beneficial

### Agent vs Skill

| Aspect | Agent | Skill |
|--------|-------|-------|
| Purpose | Who does what | How to do something |
| Granularity | Role definition | Detailed procedures |
| Creation | On-demand | Upfront |
| Location | `agentdocs/` | `.claude/skills/` |
[!FIXED!]

---

=== REGISTERED AGENTS ===
<!-- AI:REGISTRY:START -->

[?DYNAMIC?]
| Codebook ID | Agent Name | File | Role | Status |
|-------------|------------|------|------|--------|
| CB-AGENT-HEAD-001 | Head Cook | head-cook.agent.md | Orchestrator - ensures kitchen runs smoothly | active |
[?DYNAMIC?]

<!-- AI:REGISTRY:END -->

---

=== AVAILABLE TEMPLATES ===
<!-- AI:TEMPLATES:START -->

These templates are used by Head Cook to create new agents on-demand.

| Template | Creates | Use When |
|----------|---------|----------|
| agent.template.md | Base agent | Starting point for any agent |
| code-chef.template.md | Code Chef | Need dedicated coding agent |
| review-chef.template.md | Review Chef | Need code review specialist |
| doc-chef.template.md | Doc Chef | Need documentation specialist |

Templates location: `agentdocs/templates/`

<!-- AI:TEMPLATES:END -->

---

=== AGENT HIERARCHY ===
<!-- AI:HIERARCHY:START -->

```
HEAD COOK (Orchestrator)
├── Code Chef (when created)
├── Review Chef (when created)
├── Doc Chef (when created)
└── [Custom agents as needed]
```

All agents report to Head Cook. Head Cook delegates but maintains oversight.

<!-- AI:HIERARCHY:END -->

---

=== CREATING NEW AGENTS ===
<!-- AI:CREATING:START -->

To create a new agent:

1. Use @skill(agent-creation) for the full procedure
2. Select appropriate template from `agentdocs/templates/`
3. Customize for project-specific needs
4. Assign unique Codebook ID: `CB-AGENT-{NAME}-NNN`
5. Register in the REGISTERED AGENTS table above
6. Log creation in buildlog with `#micro-decision`

**Note:** Only create agents when complexity warrants it. Head Cook can handle most tasks directly.

<!-- AI:CREATING:END -->

---

=== AGENT LIFECYCLE ===
<!-- AI:LIFECYCLE:START -->

| Stage | Action | Who |
|-------|--------|-----|
| Creation | Use agent-creation skill | Head Cook |
| Activation | Register in this index | Head Cook |
| Delegation | Assign tasks via protocols | Head Cook |
| Retirement | Mark as deprecated, archive | Head Cook |

<!-- AI:LIFECYCLE:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Review agent effectiveness | Weekly | Head Cook |
| Update agent skills | As skills evolve | Head Cook |
| Retire unused agents | Quarterly | Head Cook |
| Update this registry | When agents change | Head Cook |

<!-- AI:MAINTENANCE:END -->
