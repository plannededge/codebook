---
document_name: "pr-structure.md"
location: "standards/pr-structure.md"
codebook_id: "CB-STD-PR-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "standard"
purpose: "Standard structure and requirements for pull requests"
category: "standards"
subcategory: "version-control"
related_docs:
  - "templates/github/pr.template.md"
  - "workflows/git-flow.md"
  - "standards/commit-messages.md"
status: "active"
ai_parser_instructions: |
  This document defines PR standards.
  Reference @ref(CB-TPL-PR-001) for template.
  Section markers: === SECTION ===
---

# Pull Request Standard

[!FIXED!]
## Purpose

Consistent PR structure ensures reviewers have necessary context, changes are well-documented, and history is traceable.

**Template:** @ref(CB-TPL-PR-001)
[!FIXED!]

---

=== TITLE FORMAT ===
<!-- AI:TITLE:START -->

### Format

Same as commit message format:

```
<type>(<scope>): <description>
```

### Examples

```
feat(auth): add OAuth2 login support
fix(api): handle null response from endpoint
docs(readme): add installation instructions
refactor(utils): extract date formatting logic
```

### Rules

- Use conventional commit format
- Max 72 characters
- Imperative mood
- Lowercase (except proper nouns)

<!-- AI:TITLE:END -->

---

=== DESCRIPTION REQUIREMENTS ===
<!-- AI:DESCRIPTION:START -->

### Required Sections

| Section | Purpose |
|---------|---------|
| Summary | What this PR does (1-3 sentences) |
| Type of Change | Checkbox selection |
| Changes | Bullet list of significant changes |
| Testing | How it was tested |

### Optional Sections

| Section | When to Include |
|---------|-----------------|
| Screenshots | UI changes |
| Related Issues | Links to issues |
| Breaking Changes | If applicable |
| Migration Steps | If breaking |
| Performance Impact | If relevant |
| Security Considerations | If applicable |

### Example

```markdown
## Summary
Add OAuth2 login support with Google and GitHub providers.

## Type of Change
- [x] New feature (non-breaking change that adds functionality)
- [ ] Bug fix
- [ ] Breaking change

## Changes
- Add OAuth2 client configuration
- Implement callback handling
- Add social account linking UI
- Update user model with social provider fields

## Testing
- [x] Unit tests added for OAuth flow
- [x] Integration tests with mock providers
- [x] Manual testing with real Google/GitHub accounts

## Related Issues
Closes #123
```

<!-- AI:DESCRIPTION:END -->

---

=== SIZE GUIDELINES ===
<!-- AI:SIZE:START -->

### Ideal PR Size

| Lines Changed | Assessment |
|---------------|------------|
| < 100 | Ideal - quick review |
| 100-300 | Good - manageable review |
| 300-500 | Consider splitting |
| > 500 | Split required |

### When Large PRs Are Acceptable

- Automated refactoring (rename, format)
- Generated code
- Large feature with single logical unit
- Initial project setup

### Splitting Strategy

1. Extract preparatory refactoring
2. Separate infrastructure from logic
3. Split by feature boundary
4. Separate tests if large

<!-- AI:SIZE:END -->

---

=== REVIEW REQUIREMENTS ===
<!-- AI:REVIEW:START -->

### Approval Requirements

| Change Type | Required Approvals |
|-------------|-------------------|
| Standard change | 1 |
| Critical path | 2 |
| Breaking change | 2 + maintainer |
| Security-related | 2 + security review |

### Required Checks

- [ ] CI passes
- [ ] Tests pass
- [ ] Linter passes
- [ ] Coverage maintained
- [ ] No merge conflicts

### Reviewer Selection

| Area | Preferred Reviewers |
|------|---------------------|
| Feature code | Team members familiar with area |
| Architecture | Senior developers |
| Security | Security team |
| Performance | Performance-focused developers |

<!-- AI:REVIEW:END -->

---

=== COMMIT HYGIENE ===
<!-- AI:COMMITS:START -->

### Before Review

- Squash WIP commits
- Ensure each commit is logical unit
- All commits follow @ref(CB-STD-COMMITS-001)
- Rebase if necessary

### Commit Strategy

| Approach | When |
|----------|------|
| Single commit | Simple changes |
| Logical commits | Complex changes with clear stages |
| Preserve history | Important decision points |

### During Review

- Don't force push after review starts
- Use fixup commits for review feedback
- Squash fixups before merge

<!-- AI:COMMITS:END -->

---

=== MERGE STRATEGY ===
<!-- AI:MERGE:START -->

### Recommended Strategies

| Strategy | When to Use |
|----------|-------------|
| Squash and Merge | Most feature branches |
| Rebase and Merge | Linear history needed |
| Merge Commit | Preserve detailed history |

### Default: Squash and Merge

Benefits:
- Clean main branch history
- Easy to revert entire feature
- Single commit per feature

### Merge Checklist

- [ ] All reviews approved
- [ ] CI green
- [ ] Up to date with target
- [ ] No unresolved comments
- [ ] CHANGELOG updated if needed
- [ ] Documentation updated if needed

<!-- AI:MERGE:END -->

---

=== LABELS ===
<!-- AI:LABELS:START -->

Apply appropriate labels from @ref(CB-TPL-LABELS-001):

### Required Labels

| Label | Apply When |
|-------|------------|
| `type:*` | Always (bug, feature, etc.) |
| `priority:*` | If urgency is known |

### Optional Labels

| Label | Apply When |
|-------|------------|
| `needs review` | Ready for review |
| `in progress` | Still working |
| `blocked` | Waiting on something |
| `breaking` | Breaking changes |

<!-- AI:LABELS:END -->

---

=== DRAFT PR USAGE ===
<!-- AI:DRAFT:START -->

### When to Use Draft

- Work in progress
- Early feedback needed
- CI validation needed
- Documentation of approach

### Draft to Ready

When converting to ready:
- [ ] All sections completed
- [ ] Tests pass
- [ ] Self-review done
- [ ] Ready for review

<!-- AI:DRAFT:END -->

---

=== BUILDLOG INTEGRATION ===
<!-- AI:BUILDLOG:START -->

Log PR creation:
```markdown
| 14:00 | #micro-decision | Created PR #42 for OAuth feature | PR #42 |
```

Log merge:
```markdown
| 16:30 | #commit | Merged feat(auth): OAuth support | PR #42 |
```

<!-- AI:BUILDLOG:END -->
