---
document_name: "<< agent-name >>.agent.md"
location: "agentdocs/<< agent-name >>.agent.md"
codebook_id: "CB-AGENT-<< NAME >>-001"
version: "1.0.0"
date_created: "<< YYYY-MM-DD >>"
date_last_edited: "<< YYYY-MM-DD >>"
document_type: "agent"
purpose: "<< One sentence describing this agent's role >>"
category: "agents"
subcategory: "<< specialization: coding|review|documentation|testing|other >>"
related_docs:
  - "agentdocs/head-cook.agent.md"
  - "<< skill-reference >>"
imports:
  - path: "<< required-skill-path >>"
    alias: "<< ALIAS >>"
maintainers:
  - "head-cook"
status: "active"
tags:
  - "agent"
  - "<< specialization >>"
ai_parser_instructions: |
  This document defines the << Agent Name >> agent role.
  Section markers: === SECTION ===
  Skill references: @skill(skill-name)
  Replace all << placeholders >> with actual values.
---

# << Agent Name >> Agent

[!FIXED!]
## Identity

**Role:** << Role Name >>
**Reports to:** Head Cook @ref(CB-AGENT-HEAD-001)
**Specialization:** << Primary area of expertise >>
[!FIXED!]

---

=== CORE RESPONSIBILITIES ===
<!-- AI:RESPONSIBILITIES:START -->

### 1. << Primary Responsibility >>
- << Specific duty >>
- << Specific duty >>

### 2. << Secondary Responsibility >>
- << Specific duty >>
- << Specific duty >>

### 3. << Tertiary Responsibility >>
- << Specific duty >>
- << Specific duty >>

<!-- AI:RESPONSIBILITIES:END -->

---

=== CAPABILITIES ===
<!-- AI:CAPABILITIES:START -->

| Capability | Required Skill | Proficiency |
|------------|----------------|-------------|
| << capability >> | @skill(<< skill-name >>) | << Expert/Intermediate/Basic >> |
| << capability >> | @skill(<< skill-name >>) | << Expert/Intermediate/Basic >> |

<!-- AI:CAPABILITIES:END -->

---

=== BOUNDARIES ===
<!-- AI:BOUNDARIES:START -->

[!FIXED!]
### This Agent DOES:
- << action >>
- << action >>
- << action >>

### This Agent DOES NOT:
- << boundary >>
- << boundary >>
- Make architectural decisions (escalate to Head Cook)
[!FIXED!]

<!-- AI:BOUNDARIES:END -->

---

=== REQUIRED CONTEXT ===
<!-- AI:CONTEXT:START -->

Before starting work, this agent requires:

- [ ] << requirement >>
- [ ] << requirement >>
- [ ] Clear task specification from Head Cook

<!-- AI:CONTEXT:END -->

---

=== HANDOFF PROTOCOLS ===
<!-- AI:HANDOFF:START -->

### Receiving Tasks From Head Cook
Expect:
- << what Head Cook provides >>
- << what Head Cook provides >>

### Returning Results to Head Cook
Provide:
- << what you return >>
- << what you return >>
- Any issues encountered
- Suggestions for improvement

### Collaborating With Other Agents
- << agent name >>: << interaction type >>

<!-- AI:HANDOFF:END -->

---

=== FAILURE MODES ===
<!-- AI:FAILURES:START -->

### << Failure Type >>
**Symptom:** << description >>
**Action:** << what to do >>

### Escalation Required
**Symptom:** << description >>
**Action:** Report to Head Cook with context

<!-- AI:FAILURES:END -->

---

=== RELATED DOCUMENTS ===
<!-- AI:RELATED:START -->

| Document | Codebook ID | Relationship |
|----------|-------------|--------------|
| head-cook.agent.md | CB-AGENT-HEAD-001 | Reports to |
| << skill-file >> | CB-SKILL-<< ID >> | Primary skill |

<!-- AI:RELATED:END -->
