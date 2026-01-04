---
document_name: "_checklists-index.md"
location: "checklists/_checklists-index.md"
codebook_id: "CB-CHECK-INDEX"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "index"
purpose: "Registry of all checklists - quality, security, and process verification"
category: "checklists"
status: "active"
ai_parser_instructions: |
  This is the checklist registry.
  Checklists define verification criteria for various domains.
  Reference checklists using: @checklist(checklist-name)
  Agents should use checklists to verify completeness.
---

# Checklists Registry

[!FIXED!]
## About Checklists

Checklists are **verification tools** that ensure completeness and quality. They help agents:
- Verify all required steps are completed
- Ensure security and quality standards are met
- Provide consistent evaluation criteria
- Document compliance with best practices

### How to Use Checklists

1. Before starting a task, review the relevant checklist
2. Work through items systematically
3. Mark items as complete when verified
4. Document any items that cannot be completed with rationale

### Checklist vs Skill

| Aspect | Checklist | Skill |
|--------|-----------|-------|
| Purpose | Verification | Execution |
| Format | Checkbox items | Step-by-step procedures |
| When | After/during work | During work |
| Output | Pass/fail assessment | Completed work |
[!FIXED!]

---

=== REGISTERED CHECKLISTS ===
<!-- AI:REGISTRY:START -->

### Security Checklists

| Codebook ID | Checklist | Purpose | Source |
|-------------|-----------|---------|--------|
| CB-CHECK-OPENSSF-001 | security-openssf.checklist.md | Security for AI-generated code | OpenSSF |

### Design Checklists

| Codebook ID | Checklist | Purpose | Source |
|-------------|-----------|---------|--------|
| CB-CHECK-DESIGNSYS-001 | design-system-scalability.checklist.md | Design system maturity | Best practices |

<!-- AI:REGISTRY:END -->

---

=== CHECKLIST CATEGORIES ===
<!-- AI:CATEGORIES:START -->

### Security (1 checklist)
- @checklist(security-openssf) - Security guidelines for AI code assistants

### Design (1 checklist)
- @checklist(design-system-scalability) - Design system scalability assessment

<!-- AI:CATEGORIES:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Checklists Used |
|-------|-----------------|
| @agent(security-lead) @ref(CB-AGENT-SECURITY-001) | security-openssf |
| @agent(ui-designer) @ref(CB-AGENT-UIDESIGN-001) | design-system-scalability |
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | design-system-scalability |
| All developers | security-openssf |

<!-- AI:USEDBY:END -->

---

=== COMPLETION TRACKING ===
<!-- AI:COMPLETION:START -->

### Checklist States

| State | Meaning |
|-------|---------|
| Not Started | Checklist not yet reviewed |
| In Progress | Some items verified |
| Completed | All items verified |
| Blocked | Cannot complete due to dependency |
| N/A | Checklist not applicable |

### Documentation

When completing a checklist, document:
1. Date of completion
2. Items that couldn't be completed (with reason)
3. Any exceptions granted
4. Follow-up actions needed

<!-- AI:COMPLETION:END -->

---

=== ADDING NEW CHECKLISTS ===
<!-- AI:ADDING:START -->

To add a new checklist:

1. Create checklist file in `checklists/` following naming pattern: `{name}.checklist.md`
2. Use the checklist file structure (see existing checklists)
3. Include source attribution if adapted
4. Organize items into logical sections
5. Assign a unique Codebook ID: `CB-CHECK-{NAME}-001`
6. Add entry to the REGISTERED CHECKLISTS table above
7. Log creation in buildlog with `#micro-decision`

<!-- AI:ADDING:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Review checklist accuracy | Quarterly | Head Cook |
| Update from source changes | As sources update | Assigned Agent |
| Add new checklists | As needs emerge | Head Cook |
| Archive deprecated checklists | Annually | Head Cook |

<!-- AI:MAINTENANCE:END -->
