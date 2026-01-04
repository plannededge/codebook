---
document_name: "changelog-entry.template.md"
location: "templates/documents/changelog-entry.template.md"
codebook_id: "CB-TPL-CHANGELOG-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "Template for CHANGELOG.md following keepachangelog.org format"
category: "templates"
subcategory: "documents"
used_by:
  - "@agent(delivery-lead)"
status: "active"
tags:
  - "template"
  - "changelog"
  - "keepachangelog"
ai_parser_instructions: |
  This template follows keepachangelog.org format.
  Used by Delivery Lead agent via @skill(changelog-maintenance).
---

# Changelog Entry Template

**Used by:** @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001)
**Skill:** @skill(changelog-maintenance) @ref(CB-SKILL-CHANGELOG-001)
**Format:** [Keep a Changelog](https://keepachangelog.org/en/1.1.0/)

---

## Full CHANGELOG.md Structure

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.org/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New feature description (#issue)

### Changed
- Change description (#issue)

### Fixed
- Fix description (#issue)

## [1.2.3] - 2026-01-04

### Added
- New user authentication flow with OAuth support (#123)
- Dark mode toggle in settings (#124)
- Export to CSV functionality (#125)

### Changed
- Updated dashboard layout for better usability (#126)
- Improved error messages for form validation (#127)

### Deprecated
- Legacy API endpoints (will be removed in v2.0.0) (#128)

### Removed
- Unused analytics tracking code (#129)

### Fixed
- Login timeout issue on slow connections (#130)
- Form validation failing on mobile devices (#131)
- Memory leak in dashboard component (#132)

### Security
- Patched XSS vulnerability in comments section (#133)
- Updated dependencies with known vulnerabilities (#134)

## [1.2.2] - 2026-01-01

### Fixed
- Hotfix for critical login issue (#120)

[Unreleased]: https://github.com/org/repo/compare/v1.2.3...HEAD
[1.2.3]: https://github.com/org/repo/compare/v1.2.2...v1.2.3
[1.2.2]: https://github.com/org/repo/compare/v1.2.1...v1.2.2
```

---

## Category Definitions

| Category | Use For | Example |
|----------|---------|---------|
| **Added** | New features | "New user dashboard" |
| **Changed** | Changes to existing functionality | "Updated API response format" |
| **Deprecated** | Features soon to be removed | "Legacy auth (use OAuth)" |
| **Removed** | Features now removed | "Removed v1 API endpoints" |
| **Fixed** | Bug fixes | "Fixed login timeout" |
| **Security** | Security fixes | "Patched XSS vulnerability" |

---

## Entry Format Rules

1. **Start with verb:** "Added", "Fixed", "Updated", "Removed"
2. **Be specific:** "Fixed login timeout" not "Fixed bug"
3. **Link issues:** Always include (#issue) reference
4. **User-focused:** Describe impact, not implementation
5. **Concise:** One line per entry when possible

---

## Version Section Format

```markdown
## [X.Y.Z] - YYYY-MM-DD
```

- Version in brackets
- Date in ISO format (YYYY-MM-DD)
- Unreleased section always at top

---

## Comparison Links

Always add comparison links at the bottom of the file:

```markdown
[Unreleased]: https://github.com/org/repo/compare/vX.Y.Z...HEAD
[X.Y.Z]: https://github.com/org/repo/compare/vX.Y.Z-1...vX.Y.Z
```
