Based on the search results and current best practices, I'll outline a comprehensive documentation structure optimized for both human developers and AI agents.

## Standard Documentation Structure

**Root Directory Organization**
```
docs/
├── index.md
├── architecture/
├── data/
├── business/
├── ui/
├── logic/
├── features/
├── technical/
└── roadmap/
```

## File Naming Convention

- All lowercase
- Use hyphens for spaces
- Include version numbers where applicable
- Format: `category-description-v1.md`

Example:
```
architecture-system-overview-v1.md
data-schema-v1.md
ui-components-v1.md
```

## Core Documentation Files

**Architecture Documentation**
```
docs/architecture/
├── index.md
├── system-overview.md
├── components.md
├── integration-points.md
└── deployment-architecture.md
```

**Data Documentation**
```
docs/data/
├── index.md
├── schema-design.md
├── migrations.md
├── seed-data.md
└── relationships.md
```

**Business Documentation**
```
docs/business/
├── index.md
├── goals.md
├── requirements.md
├── constraints.md
└── scope.md
```

**UI Documentation**
```
docs/ui/
├── index.md
├── design-system.md
├── components.md
├── layouts.md
├── animations.md
└── user-flows.md
```

## Machine-Readable Format Guidelines

1. Use structured headers with clear hierarchical levels[1]:
```markdown
## Main Section
### Subsection
#### Component
```

2. Include YAML frontmatter for AI parsing[3]:
```markdown
---
title: Component Documentation
version: 1.0
last_updated: 2025-02-24
ai_context: This document describes UI components
---
```

3. Use tables for structured data:
```markdown
| Component | Purpose | Dependencies |
|-----------|---------|--------------|
| Auth      | Login   | JWT         |
```

## Documentation Maintenance

1. Implement automated review cycles[8]:
- Set up automated reminders every 3 months
- Use git hooks to enforce documentation updates with code changes
- Include documentation review in PR checklists

2. Version Control Integration[7]:
- Store documentation in the same repository as code
- Use branch protection rules to ensure documentation updates
- Implement markdown linting in CI/CD pipeline

3. AI-Specific Sections[3]:
- Include clear context boundaries
- Define relationships between components
- Use consistent terminology across documents

## Best Practices for AI Readability

1. Clear Section Demarcation:
```markdown

Content specifically formatted for AI parsing

```

2. Component Relationships:
```markdown

- Component A depends on Component B
- Component B requires Service C

```

3. Implementation Constraints:
```markdown

- Memory limit: 512MB
- Response time: 
```

## Documentation Update Process

1. Automated Triggers[9]:
- Documentation review required for any major version change
- Automated staleness checks
- Integration with issue tracking system

2. Validation Process[12]:
- Automated markdown validation
- Link checking
- Terminology consistency verification

I'll create an AI-optimized template system for documentation that's both human-readable and machine-parseable.

## Master Template Structure

Every document will follow this base structure:

```markdown
---
# Document Metadata (YAML Frontmatter)
title: ""
file_name: ""
version: ""
last_updated: ""
category: ""
related_docs: 
  - ""
  - ""
ai_parser_instructions: |
  This document uses the following markers:
  === SECTION START === : Indicates a main section
  --- SUBSECTION --- : Indicates a subsection
  > : Placeholder to be filled
  [!FIXED!] : Content that should not be modified
  [?DYNAMIC?] : Content that should be updated regularly
---

[!FIXED!]
# Document Guide
This document follows the standard documentation template v1.0.
All sections marked with [!FIXED!] must not be modified.
Content marked with [?DYNAMIC?] should be regularly updated.
Replace > with actual content.
[!FIXED!]

=== TABLE OF CONTENTS ===
[?DYNAMIC?]
1. >
[?DYNAMIC?]

=== PURPOSE ===
[?DYNAMIC?]
>
[?DYNAMIC?]

=== DOCUMENT RELATIONSHIPS ===
[?DYNAMIC?]
- Parent: >
- Children: >
- Dependencies: >
[?DYNAMIC?]
```

## Architecture Document Template

```markdown
=== SYSTEM OVERVIEW ===
[?DYNAMIC?]
>
[?DYNAMIC?]

--- COMPONENTS ---
[?DYNAMIC?]
| Component | Purpose | Dependencies |
|-----------|---------|--------------|
| > | > | > |
[?DYNAMIC?]

--- INTERFACES ---
[?DYNAMIC?]
| Interface | Type | Protocol |
|-----------|------|----------|
| > | > | > |
[?DYNAMIC?]
```

## Data Schema Document Template

```markdown
=== DATABASE OVERVIEW ===
[!FIXED!]
This section describes the database architecture and schema.
[!FIXED!]

--- ENTITIES ---
[?DYNAMIC?]
| Entity | Description | Primary Key |
|--------|-------------|-------------|
| > | > | > |
[?DYNAMIC?]

--- RELATIONSHIPS ---
[?DYNAMIC?]
| Entity 1 | Relationship | Entity 2 |
|----------|--------------|----------|
| > | > | > |
[?DYNAMIC?]
```

## UI Documentation Template

```markdown
=== DESIGN SYSTEM ===
[?DYNAMIC?]
>
[?DYNAMIC?]

--- COMPONENTS ---
[?DYNAMIC?]

Component: >
Usage: >
Props: >

[?DYNAMIC?]

--- LAYOUTS ---
[?DYNAMIC?]

Layout: >
Breakpoints: >
Grid: >

[?DYNAMIC?]
```

## Business Requirements Template

```markdown
=== BUSINESS GOALS ===
[?DYNAMIC?]

1. >
2. >

[?DYNAMIC?]

--- SUCCESS METRICS ---
[?DYNAMIC?]
| Metric | Target | Measurement |
|--------|--------|-------------|
| > | > | > |
[?DYNAMIC?]

--- CONSTRAINTS ---
[?DYNAMIC?]

- >
- >

[?DYNAMIC?]
```

## AI Parser Guidelines

1. Section Markers:
```markdown

Content

```

2. Relationship Definitions:
```markdown

{
  "depends_on": ["doc1", "doc2"],
  "implements": ["req1", "req2"],
  "affects": ["component1", "component2"]
}

```

3. Version Control:
```markdown

{
  "version": "1.0",
  "changes": [
    {"date": "2025-02-24", "type": "update", "description": "Updated component X"}
  ]
}

```

## Maintenance Guidelines

1. Document Updates:
- Use git hooks to trigger documentation validation
- Implement automated version incrementing
- Include AI-readable changelog entries

2. Validation Rules:
- All sections must be properly marked with start/end tags
- YAML frontmatter must be complete
- Relationships must be valid and reciprocal

3. AI Integration Points:
- Include machine-readable metadata for each section
- Maintain consistent terminology across documents
- Use structured data formats for complex information

This template system ensures both human readability and machine parseability while maintaining clear boundaries between fixed and dynamic content[1][3][13]. The structured format allows AI agents to easily identify relationships between components and maintain context across multiple documents[11][12].
