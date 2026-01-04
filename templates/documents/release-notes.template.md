---
document_name: "release-notes.template.md"
location: "templates/documents/release-notes.template.md"
codebook_id: "CB-TPL-RELEASE-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "template"
purpose: "Template for GitHub release notes"
category: "templates"
subcategory: "documents"
used_by:
  - "@agent(delivery-lead)"
status: "active"
tags:
  - "template"
  - "release"
  - "github"
ai_parser_instructions: |
  This template is for GitHub release notes.
  Used by Delivery Lead agent via @skill(release-management).
---

# Release Notes Template

**Used by:** @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001)
**Skill:** @skill(release-management) @ref(CB-SKILL-RELEASE-001)

---

## GitHub Release Notes Format

```markdown
## Highlights

🎉 **[Major Feature Name]** - Brief description of the most important change.

<!-- Add 1-3 highlights for significant releases -->

## What's Changed

### ✨ New Features
- Feature description (#123) @contributor
- Feature description (#124) @contributor

### 🔧 Improvements
- Improvement description (#125) @contributor

### 🐛 Bug Fixes
- Fix description (#126) @contributor
- Fix description (#127) @contributor

### 🔒 Security
- Security fix description (#128) @contributor

### 📚 Documentation
- Documentation update (#129) @contributor

## Breaking Changes

⚠️ **[Breaking Change Title]**

Description of what changed and why.

**Migration Steps:**
1. Step one
2. Step two
3. Step three

## Upgrade Notes

### From v1.2.x to v1.3.0

1. Update your configuration file:
   ```yaml
   # Old
   setting: old_value

   # New
   setting: new_value
   ```

2. Run database migrations:
   ```bash
   npm run migrate
   ```

## Dependencies Updated

| Package | From | To |
|---------|------|-----|
| package-name | 1.0.0 | 2.0.0 |

## Known Issues

- Issue description (#130) - Workaround available
- Issue description (#131) - Fix planned for next release

## Contributors

Thanks to all contributors who made this release possible!

@contributor1, @contributor2, @contributor3

## Full Changelog

See [CHANGELOG.md](./CHANGELOG.md) for detailed changes.

**Full Changelog**: https://github.com/org/repo/compare/v1.2.0...v1.3.0
```

---

## Release Types

### Major Release (X.0.0)
- Include migration guide
- List all breaking changes
- Highlight major features
- Extended upgrade notes

### Minor Release (x.Y.0)
- Highlight new features
- List improvements and fixes
- Note any deprecations

### Patch Release (x.y.Z)
- Focus on fixes
- Keep notes brief
- Include security fixes prominently

---

## Emoji Guide (Optional)

| Emoji | Category |
|-------|----------|
| ✨ | New features |
| 🔧 | Improvements |
| 🐛 | Bug fixes |
| 🔒 | Security |
| 📚 | Documentation |
| ⚠️ | Breaking changes |
| 🎉 | Highlights |
| 🗑️ | Deprecations |

---

## Pre-release Notes

For alpha/beta/rc releases:

```markdown
## ⚠️ Pre-release Notice

This is a **[alpha/beta/rc]** release. It may contain bugs and is not recommended for production use.

### Testing Needed
- [ ] Feature A
- [ ] Feature B
- [ ] Feature C

### Known Issues
- Issue description

### Feedback
Please report issues at [GitHub Issues](link).
```
