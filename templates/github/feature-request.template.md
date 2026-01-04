---
document_name: "feature-request.template.md"
location: "templates/github/feature-request.template.md"
codebook_id: "CB-TPL-ISSUE-FEATURE-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "GitHub issue template for feature requests"
category: "templates"
subcategory: "github"
used_by:
  - "@agent(product-manager)"
status: "active"
tags:
  - "template"
  - "github"
  - "issue"
  - "feature"
ai_parser_instructions: |
  This is a GitHub issue template for feature requests.
  Used by Product Manager agent via @skill(issue-management).
  Copy content below the --- to GitHub issue.
---

# Feature Request Template

**Used by:** @agent(product-manager) @ref(CB-AGENT-PM-001)
**Skill:** @skill(issue-management) @ref(CB-SKILL-ISSUEMGMT-001)

---

## GitHub Issue Content (Copy Below)

```markdown
---
name: Feature Request
about: Suggest a new feature or enhancement
title: '[FEATURE] '
labels: 'type: feature, status: triage'
assignees: ''
---

## User Story
**As a** [type of user]
**I want** [goal/desire]
**So that** [benefit/value]

## Problem Statement
<!-- What problem does this feature solve? -->

## Proposed Solution
<!-- Describe the solution you'd like -->

## Acceptance Criteria
- [ ] Given [context], when [action], then [outcome]
- [ ] Given [context], when [action], then [outcome]
- [ ] Given [context], when [action], then [outcome]

## Alternatives Considered
<!-- Describe alternatives you've considered -->

## User Impact
- **Users affected:** [All users / Specific segment]
- **Frequency of use:** [Daily / Weekly / Occasionally]
- **Business value:** [High / Medium / Low]

## Technical Considerations
<!-- Optional: Any technical constraints or considerations -->

## Dependencies
<!-- List any dependencies on other features or issues -->
- Depends on #
- Blocked by #

## Mockups / Wireframes
<!-- If applicable, add mockups or wireframes -->

## Additional Context
<!-- Add any other context about the feature request -->
```

---

## Labels to Apply
- `type: feature`
- `status: triage`
- Priority: `priority: high` | `priority: medium` | `priority: low`
- Component: `component: [area]`
- Size: `size: S` | `size: M` | `size: L` | `size: XL`

## Size Definitions
- **S (Small):** < 1 day, single component
- **M (Medium):** 1-3 days, few components
- **L (Large):** 1-2 weeks, multiple components
- **XL (Extra Large):** 2+ weeks, major feature (consider epic)
