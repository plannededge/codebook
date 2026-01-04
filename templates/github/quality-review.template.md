---
document_name: "quality-review.template.md"
location: "templates/github/quality-review.template.md"
codebook_id: "CB-TPL-QUALREVIEW-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "Template for quality review comments on PRs"
category: "templates"
subcategory: "github"
used_by:
  - "@agent(qa-lead)"
status: "active"
tags:
  - "template"
  - "quality"
  - "review"
ai_parser_instructions: |
  This template is for PR quality review comments.
  Used by QA Lead agent via @skill(quality-review).
---

# Quality Review Template

**Used by:** @agent(qa-lead) @ref(CB-AGENT-QA-001)
**Skill:** @skill(quality-review) @ref(CB-SKILL-QUALREVIEW-001)

---

## PR Comment Format

```markdown
## Quality Review

**Reviewer:** @qa-lead
**Date:** YYYY-MM-DD
**Status:** [APPROVED / CHANGES REQUESTED / BLOCKED]

### Summary
Brief summary of quality assessment.

### Coverage Report
- **Line Coverage:** XX%
- **Branch Coverage:** XX%
- **Function Coverage:** XX%
- **Threshold Met:** [Yes / No]

### Checklist

#### Test Quality
- [x] Unit tests cover new functionality
- [x] Edge cases tested
- [ ] Issue: [Description]

#### Code Quality
- [x] No code smells
- [x] Clear naming
- [x] DRY principle followed

#### Maintainability
- [x] Code is readable
- [x] Consistent patterns

### Findings

#### [HIGH/MEDIUM/LOW] Finding Title
**Location:** `path/to/file.js:123`
**Issue:** Description of the quality issue
**Recommendation:** How to improve

### Recommendation
[Approve / Request specific changes / Block until fixed]

---
*This review covers quality aspects only. See @security-lead for security review.*
```

---

## Quick Templates

### Approved (No Issues)
```markdown
## Quality Review ✅

**Status:** APPROVED

### Coverage
- Line: 85% ✓
- Branch: 78% ✓
- Functions: 90% ✓

Code quality is good. Tests are comprehensive. Ready for merge pending security approval.

→ Next: @delivery-lead for merge coordination
```

### Changes Requested
```markdown
## Quality Review ⚠️

**Status:** CHANGES REQUESTED

### Coverage
- Line: 65% ✗ (threshold: 80%)

### Issues Found

#### [MEDIUM] Missing Test Coverage
**Location:** `src/utils/helper.js`
**Issue:** New utility functions lack unit tests
**Recommendation:** Add tests for `formatDate()` and `parseInput()`

#### [LOW] Long Method
**Location:** `src/api/handler.js:45-120`
**Recommendation:** Consider breaking into smaller functions

Please address coverage and re-request review.
```

### Blocked
```markdown
## Quality Review 🛑

**Status:** BLOCKED

### Critical Issue

#### [HIGH] No Tests for Critical Feature
**Location:** `src/payments/processor.js`
**Issue:** Payment processing logic has zero test coverage
**Risk:** Regressions could cause financial issues

This PR cannot be merged without tests for the payment processor.

→ Recommend: @backend-engineer add comprehensive tests
```

---

## Coverage Assessment Guide

| Coverage | Status |
|----------|--------|
| ≥80% | Meets threshold |
| 70-79% | Review required |
| <70% | Block by default |
