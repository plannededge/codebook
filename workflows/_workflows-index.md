---
document_name: "_workflows-index.md"
location: "workflows/_workflows-index.md"
codebook_id: "CB-WF-INDEX"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "index"
purpose: "Registry of all workflow documentation - process guides for development activities"
category: "workflows"
status: "active"
ai_parser_instructions: |
  This is the workflow registry.
  Workflows describe end-to-end processes.
  Section markers: === SECTION ===
---

# Workflows Registry

[!FIXED!]
## About Workflows

Workflows document end-to-end processes for development activities. They describe the overall flow, not individual procedures (those are in skills).

### Workflow vs Skill

| Aspect | Workflow | Skill |
|--------|----------|-------|
| Scope | End-to-end process | Specific procedure |
| Detail | High-level steps | Detailed instructions |
| Example | "Code Review Process" | "How to review a PR" |
[!FIXED!]

---

=== REGISTERED WORKFLOWS ===
<!-- AI:REGISTRY:START -->

[?DYNAMIC?]
| Codebook ID | Workflow | File | Purpose | Status |
|-------------|----------|------|---------|--------|
| CB-WF-GITFLOW-001 | Git Flow | git-flow.md | Branching and merge workflow | active |
| CB-WF-CODEREVIEW-001 | Code Review | code-review.md | PR review process | active |
| CB-WF-DEPLOY-001 | Deployment | deployment.md | Deployment process | active |
[?DYNAMIC?]

<!-- AI:REGISTRY:END -->

---

=== WORKFLOW CATEGORIES ===
<!-- AI:CATEGORIES:START -->

### Version Control
- @ref(CB-WF-GITFLOW-001) - Git branching and merging

### Quality
- @ref(CB-WF-CODEREVIEW-001) - Code review process

### Operations
- @ref(CB-WF-DEPLOY-001) - Deployment process

<!-- AI:CATEGORIES:END -->
