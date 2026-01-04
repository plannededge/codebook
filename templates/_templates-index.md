---
document_name: "_templates-index.md"
location: "templates/_templates-index.md"
codebook_id: "CB-TPL-INDEX"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
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

- **documents/** - Document templates (preamble, readme, etc.)
- **github/** - GitHub-specific templates (issues, PRs, labels)
- **project/** - Project setup templates
[!FIXED!]

---

=== DIRECTORY STRUCTURE ===
<!-- AI:STRUCTURE:START -->

```
templates/
├── _templates-index.md     # This file
├── documents/
│   ├── preamble.template.md
│   └── readme.template.md
├── github/
│   ├── issue.template.md
│   ├── pr.template.md
│   └── labels.md
└── project/
    └── gitignore.template
```

<!-- AI:STRUCTURE:END -->

---

=== REGISTERED TEMPLATES ===
<!-- AI:REGISTRY:START -->

[?DYNAMIC?]
### Document Templates

| Codebook ID | Template | Purpose |
|-------------|----------|---------|
| CB-TPL-PREAMBLE-001 | documents/preamble.template.md | Standard YAML preamble |
| CB-TPL-README-001 | documents/readme.template.md | Project README template |

### GitHub Templates

| Codebook ID | Template | Purpose |
|-------------|----------|---------|
| CB-TPL-ISSUE-001 | github/issue.template.md | GitHub issue template |
| CB-TPL-PR-001 | github/pr.template.md | Pull request template |
| CB-TPL-LABELS-001 | github/labels.md | Label conventions |

### Project Templates

| Codebook ID | Template | Purpose |
|-------------|----------|---------|
| CB-TPL-GITIGNORE-001 | project/gitignore.template | .gitignore starter |
[?DYNAMIC?]

<!-- AI:REGISTRY:END -->

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
4. Add to this registry
5. Document in buildlog

<!-- AI:USAGE:END -->
