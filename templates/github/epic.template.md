---
document_name: "epic.template.md"
location: "templates/github/epic.template.md"
codebook_id: "CB-TPL-ISSUE-EPIC-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "GitHub issue template for epics"
category: "templates"
subcategory: "github"
used_by:
  - "@agent(product-manager)"
status: "active"
tags:
  - "template"
  - "github"
  - "issue"
  - "epic"
ai_parser_instructions: |
  This is a GitHub issue template for epics.
  Used by Product Manager agent via @skill(issue-management).
  Copy content below the --- to GitHub issue.
---

# Epic Template

**Used by:** @agent(product-manager) @ref(CB-AGENT-PM-001)
**Skill:** @skill(issue-management) @ref(CB-SKILL-ISSUEMGMT-001)

---

## GitHub Issue Content (Copy Below)

```markdown
---
name: Epic
about: A large feature or initiative containing multiple issues
title: '[EPIC] '
labels: 'type: epic'
assignees: ''
---

## Epic Overview
<!-- High-level description of this epic -->

## Goals
<!-- What does this epic achieve? -->
1.
2.
3.

## Success Metrics
<!-- How do we measure success? -->
- [ ] Metric 1: [target]
- [ ] Metric 2: [target]

## User Stories
<!-- List of user stories in this epic -->

### Must Have
- [ ] #issue - [Description]
- [ ] #issue - [Description]

### Should Have
- [ ] #issue - [Description]

### Could Have
- [ ] #issue - [Description]

## Dependencies
<!-- External dependencies or blockers -->
- Depends on: #
- Blocked by: #

## Timeline
- **Target Start:** YYYY-MM-DD
- **Target Complete:** YYYY-MM-DD
- **Milestone:** [Milestone name]

## Stakeholders
- **Product:** @username
- **Engineering:** @username
- **Design:** @username

## Risks
<!-- Known risks and mitigation -->
| Risk | Impact | Mitigation |
|------|--------|------------|
| | | |

## Progress Tracking
<!-- Updated as work progresses -->
- **Total Issues:** X
- **Completed:** X (X%)
- **In Progress:** X
- **Not Started:** X

## Notes
<!-- Additional context, decisions, or discussion -->
```

---

## Labels to Apply
- `type: epic`
- Priority: `priority: high` | `priority: medium` | `priority: low`
- Theme: `theme: [area]`

## Epic Management
- Link all child issues to epic
- Update progress regularly
- Close epic when all children complete
