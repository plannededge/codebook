---
document_name: "task.template.md"
location: "templates/github/task.template.md"
codebook_id: "CB-TPL-ISSUE-TASK-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "GitHub issue template for tasks and chores"
category: "templates"
subcategory: "github"
used_by:
  - "@agent(product-manager)"
status: "active"
tags:
  - "template"
  - "github"
  - "issue"
  - "task"
ai_parser_instructions: |
  This is a GitHub issue template for tasks.
  Used by Product Manager agent via @skill(issue-management).
  Copy content below the --- to GitHub issue.
---

# Task Template

**Used by:** @agent(product-manager) @ref(CB-AGENT-PM-001)
**Skill:** @skill(issue-management) @ref(CB-SKILL-ISSUEMGMT-001)

---

## GitHub Issue Content (Copy Below)

```markdown
---
name: Task
about: A development or maintenance task
title: '[TASK] '
labels: 'type: task'
assignees: ''
---

## Task Description
<!-- What needs to be done? -->

## Context
<!-- Why is this task needed? What's the background? -->

## Subtasks
- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

## Definition of Done
- [ ] Code complete
- [ ] Tests written and passing
- [ ] Documentation updated (if applicable)
- [ ] PR reviewed and approved
- [ ] Deployed to staging

## Technical Notes
<!-- Any technical details, approaches, or constraints -->

## Related Issues
- Part of #
- Related to #

## Assigned Agent
<!-- Which agent should handle this? -->
- [ ] @agent(backend-engineer)
- [ ] @agent(frontend-engineer)
- [ ] @agent(database-engineer)
- [ ] @agent(devops-engineer)
```

---

## Labels to Apply
- `type: task` or `type: chore`
- Component: `component: [area]`
- Size: `size: S` | `size: M` | `size: L`

## Task vs Chore
- **Task:** Development work with clear deliverable
- **Chore:** Maintenance, refactoring, technical debt
