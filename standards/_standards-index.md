---
document_name: "_standards-index.md"
location: "standards/_standards-index.md"
codebook_id: "CB-STD-INDEX"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "index"
purpose: "Registry of all development standards - coding patterns, naming conventions, and formatting rules"
category: "standards"
status: "active"
ai_parser_instructions: |
  This is the standards registry.
  Standards are rules that must be followed.
  Reference using @ref(CB-STD-XXX-NNN).
  Section markers: === SECTION ===
---

# Standards Registry

[!FIXED!]
## About Standards

Standards define the rules and conventions that must be followed across the project. They ensure consistency and quality.

### Standards vs Skills

| Aspect | Standard | Skill |
|--------|----------|-------|
| Purpose | Rules to follow | How to do things |
| Nature | Prescriptive | Procedural |
| Example | "Use camelCase for variables" | "How to name variables" |
[!FIXED!]

---

=== REGISTERED STANDARDS ===
<!-- AI:REGISTRY:START -->

[?DYNAMIC?]
| Codebook ID | Standard | File | Purpose | Status |
|-------------|----------|------|---------|--------|
| CB-STD-NAMING-001 | Naming Conventions | naming-conventions.md | How to name things | active |
| CB-STD-PATTERNS-001 | Code Patterns | code-patterns.md | Coding patterns to follow | active |
| CB-STD-COMMITS-001 | Commit Messages | commit-messages.md | Commit message format | active |
| CB-STD-PR-001 | PR Structure | pr-structure.md | Pull request standards | active |
| CB-STD-DOC-001 | Documentation | documentation.md | Documentation standards | active |
| CB-STD-APS-001 | Agentic Provenance | agentic-provenance.md | AI attribution & versioning | active |
[?DYNAMIC?]

<!-- AI:REGISTRY:END -->

---

=== STANDARD CATEGORIES ===
<!-- AI:CATEGORIES:START -->

### Code Quality
- @ref(CB-STD-NAMING-001) - Naming conventions
- @ref(CB-STD-PATTERNS-001) - Code patterns

### Version Control
- @ref(CB-STD-COMMITS-001) - Commit messages
- @ref(CB-STD-PR-001) - PR structure

### Documentation
- @ref(CB-STD-DOC-001) - Documentation standards

### AI & Provenance
- @ref(CB-STD-APS-001) - Agentic provenance standard

<!-- AI:CATEGORIES:END -->

---

=== ENFORCEMENT ===
<!-- AI:ENFORCEMENT:START -->

### Automated

| Standard | Enforcement |
|----------|-------------|
| Naming | Linter rules |
| Code patterns | Linter/formatter |
| Commits | Git hooks |
| PR structure | PR template |
| AI attribution | Git hooks + CI |

### Manual

| Standard | Enforcement |
|----------|-------------|
| Documentation | Code review |
| Complex patterns | Code review |
| PR quality | Review process |
| AI human review | Code review |

<!-- AI:ENFORCEMENT:END -->
