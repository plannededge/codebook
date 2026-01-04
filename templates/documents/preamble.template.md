---
document_name: "preamble.template.md"
location: "templates/documents/preamble.template.md"
codebook_id: "CB-TPL-PREAMBLE-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "template"
purpose: "Standard YAML preamble template for all codebook documents"
category: "templates"
subcategory: "documents"
status: "active"
ai_parser_instructions: |
  This is the master template for YAML preambles.
  All codebook documents must have this preamble structure.
  Replace << placeholders >> with actual values.
---

# YAML Preamble Template

[!FIXED!]
## Purpose

All codebook documents MUST have a YAML preamble for machine-readability and tracking. This template defines the required and optional fields.
[!FIXED!]

---

=== REQUIRED FIELDS ===

```yaml
---
# === IDENTIFICATION (Required) ===
document_name: "<< filename.ext >>"      # Filename including extension
location: "<< path/to/file.ext >>"       # Path from repo root
codebook_id: "<< CB-XXX-NNN >>"          # Unique identifier

# === METADATA (Required) ===
version: "1.0.0"                         # Semantic version
date_created: "<< YYYY-MM-DD >>"         # Creation date
date_last_edited: "<< YYYY-MM-DD >>"     # Last edit date
document_type: "<< type >>"              # See type list below
purpose: "<< description >>"             # 1-2 sentence description

# === AI PARSING (Required) ===
ai_parser_instructions: |
  << Instructions for AI agents parsing this document >>
---
```

---

=== OPTIONAL FIELDS ===

```yaml
---
# === CATEGORIZATION (Optional) ===
category: "<< primary category >>"
subcategory: "<< secondary category >>"
tags:
  - "<< tag1 >>"
  - "<< tag2 >>"

# === RELATIONSHIPS (Optional) ===
related_docs:
  - "<< path/to/related1.md >>"
  - "<< path/to/related2.md >>"
imports:
  - path: "<< path/to/imported.md >>"
    alias: "<< ALIAS >>"

# === OWNERSHIP (Optional) ===
maintainers:
  - "<< role or name >>"
status: "<< draft|active|deprecated|archived >>"

# === SKILL-SPECIFIC (For skills only) ===
skill_metadata:
  category: "<< skill category >>"
  complexity: "<< simple|intermediate|advanced >>"
  estimated_time: "<< time estimate >>"
  prerequisites:
    - "<< prerequisite >>"
---
```

---

=== DOCUMENT TYPES ===

| Type | Use For |
|------|---------|
| `orchestration` | CLAUDE.md only |
| `index` | Registry/index files |
| `agent` | Agent definitions |
| `skill` | Skill files |
| `standard` | Standards documents |
| `devdoc` | Development documentation |
| `template` | Template files |
| `guide` | How-to guides |
| `buildlog` | Weekly buildlogs |
| `workflow` | Process documentation |

---

=== CODEBOOK ID FORMAT ===

```
CB-{CATEGORY}-{SUBCATEGORY}-{SEQUENCE}

Categories:
- MASTER    : Root documents
- AGENT     : Agent definitions
- SKILL     : Skill files
- ARCH      : Architecture docs
- BIZ       : Business docs
- DATA      : Data docs
- UI        : UI docs
- STD       : Standards
- WF        : Workflows
- TPL       : Templates
- BUILD     : Buildlogs
- GUIDE     : Guides

Special IDs (no sequence):
- CB-MASTER-001     : CLAUDE.md
- CB-AGENT-INDEX    : _agent-index.md
- CB-SKILL-INDEX    : _skill-index.md
- CB-DEVDOCS-INDEX  : _devdocs-index.md
```

---

=== COMPLETE EXAMPLE ===

```yaml
---
document_name: "code-quality.skill.md"
location: ".claude/skills/code-quality.skill.md"
codebook_id: "CB-SKILL-CODEQUAL-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "skill"
purpose: "Procedural guide for maintaining high code quality standards"
category: "skills"
subcategory: "development"
skill_metadata:
  category: "development"
  complexity: "intermediate"
  estimated_time: "varies"
  prerequisites:
    - "Access to codebase"
    - "Understanding of project standards"
related_docs:
  - "standards/code-patterns.md"
  - "standards/naming-conventions.md"
maintainers:
  - "head-cook"
status: "active"
tags:
  - "skill"
  - "code-quality"
  - "standards"
ai_parser_instructions: |
  This skill covers code quality procedures.
  Section markers: === SECTION ===
  Procedure markers: <!-- PROCEDURE:name:START/END -->
  Checklists use - [ ] format.
---
```

---

=== AI PARSER INSTRUCTIONS GUIDELINES ===

Include in `ai_parser_instructions`:

1. **Section markers** used in document
2. **Special syntax** (placeholders, markers)
3. **Content types** (fixed vs dynamic)
4. **Reference syntax** used
5. **Any special handling required**

Example:
```yaml
ai_parser_instructions: |
  This document uses standard markers:
  === SECTION === for main sections
  [!FIXED!] for immutable content
  [?DYNAMIC?] for updateable content
  << placeholder >> for values to replace
  @ref(CB-XXX-NNN) for cross-references
```
