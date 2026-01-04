---
document_name: "_templates-index.md"
location: "templates/_templates-index.md"
codebook_id: "CB-TPL-INDEX"
version: "2.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-04"
document_type: "index"
purpose: "Registry of all reusable templates for documents, GitHub artifacts, and project setup"
category: "templates"
status: "active"
ai_parser_instructions: |
  This is the template registry.
  Templates are organized by category.
  Section markers: === SECTION ===
---

# Templates Registry

[!FIXED!]
## About Templates

Templates provide reusable starting points for common documents and artifacts. They ensure consistency and reduce setup time.

### Template Categories

- **documents/** - Document templates (changelog, release notes, etc.)
- **github/** - GitHub-specific templates (issues, PRs, reviews)
- **project/** - Project setup templates
- **email/** - Email templates (when needed)
[!FIXED!]

---

=== DIRECTORY STRUCTURE ===
<!-- AI:STRUCTURE:START -->

```
templates/
├── _templates-index.md        # This file
├── documents/
│   ├── preamble.template.md
│   ├── readme.template.md
│   ├── changelog-entry.template.md
│   └── release-notes.template.md
├── github/
│   ├── issue.template.md
│   ├── pr.template.md
│   ├── labels.md
│   ├── bug-report.template.md
│   ├── feature-request.template.md
│   ├── task.template.md
│   ├── epic.template.md
│   ├── security-review.template.md
│   └── quality-review.template.md
└── project/
    └── gitignore.template
```

<!-- AI:STRUCTURE:END -->

---

=== REGISTERED TEMPLATES ===
<!-- AI:REGISTRY:START -->

### Document Templates

| Codebook ID | Template | Purpose | Used By |
|-------------|----------|---------|---------|
| CB-TPL-PREAMBLE-001 | documents/preamble.template.md | Standard YAML preamble | All |
| CB-TPL-README-001 | documents/readme.template.md | Project README | Doc Chef |
| CB-TPL-CHANGELOG-001 | documents/changelog-entry.template.md | Changelog entry (keepachangelog) | Delivery Lead |
| CB-TPL-RELEASE-001 | documents/release-notes.template.md | Release notes | Delivery Lead |

### GitHub Issue Templates

| Codebook ID | Template | Purpose | Used By |
|-------------|----------|---------|---------|
| CB-TPL-ISSUE-001 | github/issue.template.md | Generic issue | Product Manager |
| CB-TPL-ISSUE-BUG-001 | github/bug-report.template.md | Bug report | Product Manager |
| CB-TPL-ISSUE-FEATURE-001 | github/feature-request.template.md | Feature request | Product Manager |
| CB-TPL-ISSUE-TASK-001 | github/task.template.md | Task | Product Manager |
| CB-TPL-ISSUE-EPIC-001 | github/epic.template.md | Epic | Product Manager |

### GitHub PR/Review Templates

| Codebook ID | Template | Purpose | Used By |
|-------------|----------|---------|---------|
| CB-TPL-PR-001 | github/pr.template.md | Pull request | All developers |
| CB-TPL-LABELS-001 | github/labels.md | Label conventions | All |
| CB-TPL-SECREVIEW-001 | github/security-review.template.md | Security review comment | Security Lead |
| CB-TPL-QUALREVIEW-001 | github/quality-review.template.md | Quality review comment | QA Lead |

### Project Templates

| Codebook ID | Template | Purpose | Used By |
|-------------|----------|---------|---------|
| CB-TPL-GITIGNORE-001 | project/gitignore.template | .gitignore starter | DevOps, Head Cook |

<!-- AI:REGISTRY:END -->

---

=== TEMPLATE BY AGENT ===
<!-- AI:BY-AGENT:START -->

| Agent | Templates Used |
|-------|---------------|
| Product Manager | bug-report, feature-request, task, epic, issue |
| Delivery Lead | changelog-entry, release-notes |
| Security Lead | security-review |
| QA Lead | quality-review |
| Doc Chef | readme, preamble |
| All Developers | pr, preamble |

<!-- AI:BY-AGENT:END -->

---

=== USAGE ===
<!-- AI:USAGE:START -->

### Using Templates

1. Copy template to destination
2. Rename removing `.template` suffix
3. Replace all `<< placeholder >>` values
4. Update YAML preamble with actual values
5. Register in appropriate index

### Creating New Templates

1. Create template file with placeholders
2. Use `<< placeholder >>` for values to replace
3. Include complete YAML preamble (with placeholders)
4. Assign Codebook ID: `CB-TPL-{NAME}-001`
5. Add to this registry
6. Document in buildlog

<!-- AI:USAGE:END -->

---

=== TEMPLATE STANDARDS ===
<!-- AI:STANDARDS:START -->

### Issue Templates (used by Product Manager)

All issue templates follow @skill(issue-management) format:
- Clear title pattern
- Labels specification
- Required sections (Summary, Details, Acceptance Criteria)

### Review Templates (used by Security/QA Leads)

Review templates include:
- Status (APPROVED / CHANGES REQUESTED / BLOCKED)
- Checklist items
- Findings format
- Recommendations

### Document Templates (used by Delivery Lead, Doc Chef)

Document templates follow:
- keepachangelog.org format for changelogs
- Semantic versioning for releases
- YAML preamble requirements

<!-- AI:STANDARDS:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Review template accuracy | Monthly | Head Cook |
| Update outdated templates | As needed | Template owner |
| Add new templates | As project evolves | Head Cook |
| Archive unused templates | Quarterly | Head Cook |

<!-- AI:MAINTENANCE:END -->
