---
document_name: "bug-report.template.md"
location: "templates/github/bug-report.template.md"
codebook_id: "CB-TPL-ISSUE-BUG-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "GitHub issue template for bug reports"
category: "templates"
subcategory: "github"
used_by:
  - "@agent(product-manager)"
status: "active"
tags:
  - "template"
  - "github"
  - "issue"
  - "bug"
ai_parser_instructions: |
  This is a GitHub issue template for bug reports.
  Used by Product Manager agent via @skill(issue-management).
  Copy content below the --- to GitHub issue.
---

# Bug Report Template

**Used by:** @agent(product-manager) @ref(CB-AGENT-PM-001)
**Skill:** @skill(issue-management) @ref(CB-SKILL-ISSUEMGMT-001)

---

## GitHub Issue Content (Copy Below)

```markdown
---
name: Bug Report
about: Report a bug to help us improve
title: '[BUG] '
labels: 'type: bug, status: triage'
assignees: ''
---

## Bug Description
<!-- A clear and concise description of the bug -->

## Environment
- **OS:** [e.g., macOS 14.0, Windows 11, Ubuntu 22.04]
- **Browser:** [e.g., Chrome 120, Firefox 121, Safari 17]
- **App Version:** [e.g., 1.2.3]
- **Device:** [e.g., Desktop, iPhone 15, Pixel 8]

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## Expected Behavior
<!-- What you expected to happen -->

## Actual Behavior
<!-- What actually happened -->

## Screenshots
<!-- If applicable, add screenshots to help explain your problem -->

## Console Errors
<!-- If applicable, paste any console errors -->
```
<details>
<summary>Console output</summary>

```
Paste console errors here
```
</details>

## Additional Context
<!-- Add any other context about the problem here -->

## Possible Solution
<!-- Optional: If you have suggestions on how to fix the bug -->
```

---

## Labels to Apply
- `type: bug`
- `status: triage`
- Priority: `priority: critical` | `priority: high` | `priority: medium` | `priority: low`
- Component: `component: [area]`

## Priority Definitions
- **Critical:** Production down, security issue, data loss
- **High:** Major feature broken, many users affected
- **Medium:** Feature impaired, workaround exists
- **Low:** Minor issue, cosmetic
