---
document_name: "_devdocs-index.md"
location: "devdocs/_devdocs-index.md"
codebook_id: "CB-DEVDOCS-INDEX"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "index"
purpose: "Master index for all development documentation - architecture, business, data, and UI docs"
category: "devdocs"
status: "active"
ai_parser_instructions: |
  This is the development documentation master index.
  Each subdirectory has its own index.md file.
  Reference using @ref(CB-DEVDOCS-XXX-NNN).
  Section markers: === SECTION ===
---

# Development Documentation Index

[!FIXED!]
## About DevDocs

Development documentation (`devdocs/`) contains all technical and business documentation for the project. It is organized by category:

- **architecture/** - System design, components, integration
- **business/** - Goals, requirements, constraints
- **data/** - Schema, relationships, migrations
- **ui/** - Design system, components, layouts
[!FIXED!]

---

=== DIRECTORY STRUCTURE ===
<!-- AI:STRUCTURE:START -->

```
devdocs/
├── _devdocs-index.md      # This file
├── architecture/
│   ├── index.md           # Architecture index
│   ├── architecture-overview.md
│   ├── components.md
│   ├── deployment-architecture-v1.md
│   └── integration-points-v1.md
├── business/
│   ├── index.md           # Business index
│   ├── goals.md
│   ├── requirements.md
│   ├── scope.md
│   └── constraints.md
├── data/
│   ├── index.md           # Data index
│   ├── schema-design.md
│   ├── migrations.md
│   ├── relationships.md
│   └── seed-data.md
└── ui/
    ├── index.md           # UI index
    ├── design-system.md
    ├── components.md
    ├── layouts.md
    ├── animations.md
    └── user-flows.md
```

<!-- AI:STRUCTURE:END -->

---

=== DOCUMENTATION REGISTRY ===
<!-- AI:REGISTRY:START -->

[?DYNAMIC?]
### Architecture Documentation

| Codebook ID | Document | Purpose | Status |
|-------------|----------|---------|--------|
| CB-ARCH-INDEX | architecture/index.md | Architecture index | active |
| CB-ARCH-OVERVIEW-001 | architecture/architecture-overview.md | System overview template | active |
| CB-ARCH-COMPONENTS-001 | architecture/components.md | Component catalog | active |
| CB-ARCH-DEPLOY-001 | architecture/deployment-architecture-v1.md | Deployment patterns | active |
| CB-ARCH-INTEGRATION-001 | architecture/integration-points-v1.md | Integration points | active |

### Business Documentation

| Codebook ID | Document | Purpose | Status |
|-------------|----------|---------|--------|
| CB-BIZ-INDEX | business/index.md | Business index | active |
| CB-BIZ-GOALS-001 | business/goals.md | Business objectives | active |
| CB-BIZ-REQUIREMENTS-001 | business/requirements.md | Requirements | active |
| CB-BIZ-SCOPE-001 | business/scope.md | Project scope | active |
| CB-BIZ-CONSTRAINTS-001 | business/constraints.md | Constraints | active |

### Data Documentation

| Codebook ID | Document | Purpose | Status |
|-------------|----------|---------|--------|
| CB-DATA-INDEX | data/index.md | Data index | active |
| CB-DATA-SCHEMA-001 | data/schema-design.md | Database schema | active |
| CB-DATA-MIGRATIONS-001 | data/migrations.md | Migration patterns | active |
| CB-DATA-RELATIONS-001 | data/relationships.md | Entity relationships | active |
| CB-DATA-SEED-001 | data/seed-data.md | Seed data | active |

### UI Documentation

| Codebook ID | Document | Purpose | Status |
|-------------|----------|---------|--------|
| CB-UI-INDEX | ui/index.md | UI index | active |
| CB-UI-DESIGN-001 | ui/design-system.md | Design system | active |
| CB-UI-COMPONENTS-001 | ui/components.md | UI components | active |
| CB-UI-LAYOUTS-001 | ui/layouts.md | Layout system | active |
| CB-UI-ANIMATIONS-001 | ui/animations.md | Animation guidelines | active |
| CB-UI-FLOWS-001 | ui/user-flows.md | User flows | active |
[?DYNAMIC?]

<!-- AI:REGISTRY:END -->

---

=== USAGE GUIDELINES ===
<!-- AI:USAGE:START -->

### For Developers

1. Check relevant devdocs before implementing features
2. Update documentation when making changes
3. Reference using Codebook IDs

### For Head Cook

1. Verify devdocs currency in pre-flight checklist
2. Delegate documentation updates to Doc Chef if available
3. Log gaps with `#gap-identified`

### For AI Agents

1. Reference devdocs for context before coding
2. Use Codebook IDs for precise references
3. Update devdocs after significant changes

<!-- AI:USAGE:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Verify currency | Weekly | Head Cook |
| Update after changes | As needed | Relevant agent |
| Archive deprecated | Quarterly | Head Cook |
| Add new docs | As project grows | Doc Chef / Head Cook |

### Staleness Rules

Documents are considered stale if:
- Architecture: Not updated in 30 days
- Business: Not reviewed in 60 days
- Data: Not matching current schema
- UI: Not matching current components

<!-- AI:MAINTENANCE:END -->
