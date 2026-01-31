---
document_name: "documentation-integrity.skill.md"
location: ".claude/skills/documentation-integrity.skill.md"
codebook_id: "CB-SKILL-DOC-INTEGRITY-001"
version: "1.0.0"
date_created: "2026-01-31"
date_last_edited: "2026-01-31"
document_type: "skill"
purpose: "Ensures documentation remains accurate, current, and aligned with architecture"
category: "skills"
status: "active"
ai_parser_instructions: |
  Use this skill to audit documentation against code.
  Trigger: @skill(documentation-integrity)
---

# SKILL: Documentation Integrity Check

## Trigger Conditions
- After ANY implementation that changes interfaces (props, API signatures).
- Weekly scheduled audit.
- On-demand when referencing potentially stale docs.

## Protocol

### Step 1: Identify Changed Entities
List all components, services, and APIs modified in recent changes.

### Step 2: Code-to-Doc Sync Check
For each changed entity:
1.  **Locate**: Find the corresponding documentation file.
2.  **Extract**: Get the documented signature/interface.
3.  **Compare**: Check against the actual code.
    *   Parameter names & types?
    *   Return types?
    *   Thrown errors?
    *   Side effects?
4.  **Flag**: Note any discrepancies.

### Step 3: Pattern Regression Scan
Check recent code against `devdocs/architecture/master.md` patterns:
*   [ ] **Frontend**: Uses Design Tokens? (No inline styles)
*   [ ] **Backend**: Uses Repository Pattern? (No direct DB calls in controllers)
*   [ ] **Structure**: Dependencies point inward (Domain independent)?

### Step 4: Directional Consistency
Verify new code moves *toward* the Directional Architecture:
*   [ ] New components are designed for reuse?
*   [ ] New services follow hexagonal boundaries?

## Output Format

```markdown
## 📝 Documentation Integrity Report

### Sync Status
| Entity | Doc Status | Action Required |
|--------|------------|-----------------|
| [Name] | ✅ In Sync | None |
| [Name] | ❌ Out of Sync | Update doc |
| [Name] | ⚠️ Missing | Create doc |

### Pattern Regressions
| File | Violation | Severity | Fix |
|------|-----------|----------|-----|
| [Path] | [Issue] | High/Med | [Fix] |

### Required Actions
1. [Specific action]
2. [Specific action]
```
