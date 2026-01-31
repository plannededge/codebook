---
document_name: "architectural-review.skill.md"
location: ".claude/skills/architectural-review.skill.md"
codebook_id: "CB-SKILL-ARCH-REVIEW-001"
version: "1.0.0"
date_created: "2026-01-31"
date_last_edited: "2026-01-31"
document_type: "skill"
purpose: "Enforces architectural governance and reuse before implementation"
category: "skills"
status: "active"
ai_parser_instructions: |
  Use this skill to validate plans against the Master Architecture.
  Trigger: @skill(architectural-review)
---

# SKILL: Architectural Review Gate

## Trigger Conditions
This skill **MUST** be triggered for:
1.  ANY plan creation in Plan Mode.
2.  ANY implementation that spans multiple files.
3.  ANY new component, service, or module creation.
4.  ANY refactoring proposal.

## Execution Protocol

### Phase 1: Context Loading
**BEFORE** analysis, you MUST read:
1.  `CLAUDE.md` (North Star & Rules)
2.  `devdocs/architecture/master.md` (Current vs. Directional)
3.  Relevant domain documentation (if exists)

### Phase 2: The Reuse Hierarchy (Mandatory Scan)
You must attempt to solve the problem in this order:

1.  **USE EXISTING**: specific components/services that already do this.
    *   *Action*: Search `src/components`, `src/services`, `src/utils`.
2.  **EXTEND EXISTING**: existing items that can be configured.
    *   *Action*: Check props/methods of similar items.
3.  **COMPOSE EXISTING**: combining primitives.
    *   *Action*: Sketch composition of existing atoms.
4.  **CREATE NEW**: Only if 1-3 fail.
    *   *Action*: Document *why* existing solutions failed.

### Phase 3: Rubric Evaluation
Score your plan against these criteria. **If ANY fail, you must Revise.**

| Category | Criterion | Pass Condition |
|----------|-----------|----------------|
| **Direction** | **North Star** | Does this improve Robustness, Resilience, Effectiveness, & Scalability? |
| **Structure** | **Hexagonal Fit** | Does domain logic rely ONLY on ports (not infrastructure)? |
| **Structure** | **Layering** | Are imports strictly `Infrastructure -> Domain` (never reverse)? |
| **Frontend** | **Styling** | Are Design Tokens used? (Zero inline styles) |
| **Code** | **Duplication** | Did the Reuse Scan confirm no duplicates? |
| **Quality** | **Tests** | Are tests planned for new logic? |
| **Quality** | **Errors** | Is error handling explicit (no swallowing)? |

## Output Format
You MUST output this report in your response:

```markdown
## 🛡️ Architectural Review Report

### Reuse Analysis
- **Search Scope**: [Paths searched]
- **Findings**: [What was found]
- **Decision**: [USE / EXTEND / COMPOSE / CREATE]
- **Justification**: [Why this decision was made]

### Rubric Scorecard
| Criterion | Status | Notes |
|-----------|--------|-------|
| North Star | ✅/❌ | ... |
| Hexagonal Fit | ✅/❌ | ... |
| Layering | ✅/❌ | ... |
| Styling | ✅/❌ | ... |
| No Duplicates | ✅/❌ | ... |
| Tests | ✅/❌ | ... |

### Verdict
[ PASS / FAIL ]
*(If FAIL, list specific remediation steps and re-run)*
```
