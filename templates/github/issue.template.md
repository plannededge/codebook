---
document_name: "issue.template.md"
location: "templates/github/issue.template.md"
codebook_id: "CB-TPL-ISSUE-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "template"
purpose: "Template for creating consistent GitHub issues"
category: "templates"
subcategory: "github"
status: "active"
ai_parser_instructions: |
  This is a template for GitHub issues.
  Replace << placeholders >> with actual values.
  Use for both .github/ISSUE_TEMPLATE/ or manual issues.
---

# GitHub Issue Template

[!FIXED!]
## Purpose

Provide a consistent structure for creating GitHub issues. Use this template to ensure clarity and facilitate issue triage and resolution.
[!FIXED!]

---

=== ISSUE TEMPLATE ===

```markdown
## Summary
<!-- Brief description of the issue (1-2 sentences) -->
<< summary >>

## Type
<!-- Select one: Bug | Feature | Enhancement | Documentation | Question -->
<< type >>

## Description
<!-- Detailed explanation including context -->
<< description >>

## Expected Behavior
<!-- What should happen -->
<< expected >>

## Actual Behavior
<!-- What actually happens (for bugs) -->
<< actual >>

## Steps to Reproduce
<!-- For bugs: step-by-step to reproduce -->
1. << step >>
2. << step >>
3. << step >>

## Environment
<!-- Relevant environment details -->
- OS: << os >>
- Version: << version >>
- Browser (if applicable): << browser >>

## Additional Context
<!-- Any other context, screenshots, logs -->
<< context >>

## Acceptance Criteria
<!-- For features: when is this done? -->
- [ ] << criterion >>
- [ ] << criterion >>

## Related Issues
<!-- Links to related issues/PRs -->
- << related >>
```

---

=== LABELS ===
<!-- AI:LABELS:START -->

Apply appropriate labels from @ref(CB-TPL-LABELS-001):

| Label | When to Use |
|-------|-------------|
| `bug` | Defects, unexpected behavior |
| `enhancement` | Improvements to existing features |
| `feature` | New features |
| `documentation` | Documentation changes |
| `question` | Needs clarification |
| `priority: high` | Urgent issues |
| `priority: medium` | Normal priority |
| `priority: low` | Nice to have |

<!-- AI:LABELS:END -->

---

=== BEST PRACTICES ===
<!-- AI:PRACTICES:START -->

1. **Title:** Clear, concise (max 60 chars)
   - Good: "Login fails with special characters in password"
   - Bad: "Bug"

2. **Description:** Provide context
   - What were you trying to do?
   - Why is this important?

3. **Reproduction:** Be specific
   - Include exact steps
   - Note any preconditions

4. **Environment:** Include relevant details
   - OS, browser, version
   - Any non-standard configuration

5. **References:** Link related items
   - Related issues
   - Relevant documentation
   - Related PRs

<!-- AI:PRACTICES:END -->
