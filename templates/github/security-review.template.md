---
document_name: "security-review.template.md"
location: "templates/github/security-review.template.md"
codebook_id: "CB-TPL-SECREVIEW-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "Template for security review comments on PRs"
category: "templates"
subcategory: "github"
used_by:
  - "@agent(security-lead)"
status: "active"
tags:
  - "template"
  - "security"
  - "review"
ai_parser_instructions: |
  This template is for PR security review comments.
  Used by Security Lead agent via @skill(security-review).
---

# Security Review Template

**Used by:** @agent(security-lead) @ref(CB-AGENT-SECURITY-001)
**Skill:** @skill(security-review) @ref(CB-SKILL-SECREVIEW-001)

---

## PR Comment Format

```markdown
## Security Review

**Reviewer:** @security-lead
**Date:** YYYY-MM-DD
**Status:** [APPROVED / CHANGES REQUESTED / BLOCKED]

### Summary
Brief summary of security findings.

### Checklist

#### Authentication & Authorization
- [x] Authentication required for protected routes
- [x] Authorization checks implemented
- [ ] Issue: [Description]

#### Input Validation
- [x] Inputs validated and sanitized
- [x] No SQL injection risk
- [x] No XSS risk

#### Data Protection
- [x] Sensitive data encrypted
- [x] No secrets in code

#### Dependencies
- [x] No vulnerable dependencies

### Findings

#### [CRITICAL/HIGH/MEDIUM/LOW] Finding Title
**Location:** `path/to/file.js:123`
**Issue:** Description of the security issue
**Risk:** What could happen if exploited
**Fix:** How to remediate

### Recommendation
[Approve / Request specific changes / Block until fixed]

---
*This review covers security aspects only. See @qa-lead for quality review.*
```

---

## Quick Templates

### Approved (No Issues)
```markdown
## Security Review ✅

**Status:** APPROVED

No security issues found. All authentication, authorization, input validation, and data protection checks pass.

Ready for quality review by @qa-lead.
```

### Changes Requested
```markdown
## Security Review ⚠️

**Status:** CHANGES REQUESTED

### Issues Found

#### [MEDIUM] Unsanitized User Input
**Location:** `src/api/handler.js:45`
**Issue:** User input is not sanitized before use
**Fix:** Add input validation using [library]

Please address and re-request review.
```

### Blocked
```markdown
## Security Review 🛑

**Status:** BLOCKED

### Critical Issue

#### [CRITICAL] SQL Injection Vulnerability
**Location:** `src/db/query.js:78`
**Issue:** Raw SQL query with user input
**Risk:** Complete database compromise
**Fix:** Use parameterized queries

This PR cannot be merged until this critical issue is resolved.
```
