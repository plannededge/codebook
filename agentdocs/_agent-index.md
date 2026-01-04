---
document_name: "_agent-index.md"
location: "agentdocs/_agent-index.md"
codebook_id: "CB-AGENT-INDEX"
version: "2.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-04"
document_type: "index"
purpose: "Registry of all agents - defines what roles exist in the development kitchen"
category: "agents"
status: "active"
ai_parser_instructions: |
  This is the agent registry. Use to find available agents.
  Reference agents using: @agent(agent-name)
  Each agent has a defined role and set of skills.
  Agents are organized by tier: Core (always active) and Optional (on-demand).
---

# Agent Registry

[!FIXED!]
## About Agents

Agents are **role definitions** that specify WHO does WHAT. They define responsibilities, boundaries, and required skills.

### Core vs Optional Agents

- **Core Agents:** Always active, essential for project operation
- **Optional Agents:** Created on-demand as project complexity requires

### Agent vs Skill

| Aspect | Agent | Skill |
|--------|-------|-------|
| Purpose | Who does what | How to do something |
| Granularity | Role definition | Detailed procedures |
| Creation | Core always, Optional on-demand | Upfront |
| Location | `agentdocs/` | `.claude/skills/` |
[!FIXED!]

---

=== REGISTERED AGENTS ===
<!-- AI:REGISTRY:START -->

### Tier 0: Orchestration (CORE)

| Codebook ID | Agent | File | Role | Status |
|-------------|-------|------|------|--------|
| CB-AGENT-HEAD-001 | Head Cook | head-cook.agent.md | Orchestrator - ensures kitchen runs smoothly | active |

### Tier 1: Management (CORE)

| Codebook ID | Agent | File | Role | Status |
|-------------|-------|------|------|--------|
| CB-AGENT-PM-001 | Product Manager | templates/product-manager.template.md | Requirements, Issues, Roadmap | active |
| CB-AGENT-DELIVERY-001 | Delivery Lead | templates/delivery-lead.template.md | Releases, Versioning, Changelog | active |
| CB-AGENT-DEVOPS-001 | DevOps Engineer | templates/devops-engineer.template.md | CI/CD, Infrastructure, Deployment | active |

### Tier 2: Quality (OPTIONAL)

| Codebook ID | Agent | File | Role | Status |
|-------------|-------|------|------|--------|
| CB-AGENT-SECURITY-001 | Security Lead | templates/security-lead.template.md | Security Audits, Compliance | active |
| CB-AGENT-QA-001 | QA Lead | templates/qa-lead.template.md | Testing, Quality Gates | active |

### Tier 3: Development (OPTIONAL)

| Codebook ID | Agent | File | Role | Status |
|-------------|-------|------|------|--------|
| CB-AGENT-BACKEND-001 | Backend Engineer | templates/backend-engineer.template.md | API, Services, Business Logic | active |
| CB-AGENT-FRONTEND-001 | Frontend Engineer | templates/frontend-engineer.template.md | UI Components, State Management | active |
| CB-AGENT-DATABASE-001 | Database Engineer | templates/database-engineer.template.md | Schema, Migrations, Queries | active |

### Tier 4: Design (OPTIONAL)

| Codebook ID | Agent | File | Role | Status |
|-------------|-------|------|------|--------|
| CB-AGENT-UIDESIGN-001 | UI Designer | templates/ui-designer.template.md | Visual Design, Design System | active |
| CB-AGENT-UXDESIGN-001 | UX Designer | templates/ux-designer.template.md | User Flows, Usability, A11y | active |

### Tier 5: Communication (OPTIONAL)

| Codebook ID | Agent | File | Role | Status |
|-------------|-------|------|------|--------|
| CB-AGENT-PMM-001 | Product Marketing Manager | templates/product-marketing-manager.template.md | Positioning, Messaging, GTM | active |
| CB-AGENT-DOC-001 | Doc Chef | templates/doc-chef.template.md | Technical Documentation | active |
| CB-AGENT-COPY-001 | Copywriter | templates/copywriter.template.md | UI Copy, User-Facing Content | active |

<!-- AI:REGISTRY:END -->

---

=== AGENT HIERARCHY ===
<!-- AI:HIERARCHY:START -->

```
HEAD COOK (Tier 0 - Orchestrator)
│
├── CORE AGENTS (Tier 1 - Always Active)
│   ├── Product Manager      → Issues, Requirements
│   ├── Delivery Lead        → Releases, Changelog
│   └── DevOps Engineer      → CI/CD, Infrastructure
│
├── QUALITY AGENTS (Tier 2 - On-Demand)
│   ├── Security Lead        → CAN BLOCK for security
│   └── QA Lead              → CAN BLOCK for quality
│
├── DEVELOPMENT AGENTS (Tier 3 - On-Demand)
│   ├── Backend Engineer     → API, Services
│   ├── Frontend Engineer    → Components, UI
│   └── Database Engineer    → Schema, Migrations
│
├── DESIGN AGENTS (Tier 4 - On-Demand)
│   ├── UI Designer          → Visual Design
│   └── UX Designer          → User Experience
│
└── COMMUNICATION AGENTS (Tier 5 - On-Demand)
    ├── PMM                  → Positioning, GTM
    ├── Doc Chef             → Technical Docs
    └── Copywriter           → User-Facing Copy
```

<!-- AI:HIERARCHY:END -->

---

=== REVIEW MODEL ===
<!-- AI:REVIEW:START -->

```
Developer creates PR
    │
    ├──> Security Lead reviews (security aspects)
    │    Uses: @skill(security-review)
    │    Authority: CAN BLOCK for security issues
    │
    └──> QA Lead reviews (quality aspects)
         Uses: @skill(quality-review)
         Authority: CAN BLOCK for quality issues
              │
              v
         Both approve → Delivery Lead coordinates merge
```

<!-- AI:REVIEW:END -->

---

=== AGENT SKILLS MAPPING ===
<!-- AI:SKILLS:START -->

| Agent | Required Skills |
|-------|-----------------|
| Head Cook | project-setup, git-workflow, code-quality, agent-creation |
| Product Manager | requirements-gathering, issue-management, roadmap-planning |
| Delivery Lead | release-management, changelog-maintenance, versioning |
| DevOps Engineer | cicd-pipeline, infrastructure, deployment |
| Security Lead | security-review, vulnerability-assessment, compliance-check |
| QA Lead | quality-review, testing-strategy, quality-gates |
| Backend Engineer | api-development, backend-patterns, code-quality, git-workflow |
| Frontend Engineer | component-development, frontend-patterns, code-quality, git-workflow |
| Database Engineer | schema-design, migration-management, code-quality, git-workflow |
| UI Designer | design-system, visual-design, design-tokens |
| UX Designer | user-flows, usability-review, accessibility |
| PMM | positioning, messaging, gtm-planning |
| Doc Chef | technical-writing, api-documentation |
| Copywriter | microcopy, user-content, voice-tone |

<!-- AI:SKILLS:END -->

---

=== AVAILABLE TEMPLATES ===
<!-- AI:TEMPLATES:START -->

Templates location: `agentdocs/templates/`

| Template | Creates | Tier |
|----------|---------|------|
| agent.template.md | Base agent | Any |
| product-manager.template.md | Product Manager | Core |
| delivery-lead.template.md | Delivery Lead | Core |
| devops-engineer.template.md | DevOps Engineer | Core |
| security-lead.template.md | Security Lead | Quality |
| qa-lead.template.md | QA Lead | Quality |
| backend-engineer.template.md | Backend Engineer | Development |
| frontend-engineer.template.md | Frontend Engineer | Development |
| database-engineer.template.md | Database Engineer | Development |
| ui-designer.template.md | UI Designer | Design |
| ux-designer.template.md | UX Designer | Design |
| product-marketing-manager.template.md | PMM | Communication |
| doc-chef.template.md | Doc Chef | Communication |
| copywriter.template.md | Copywriter | Communication |
| code-chef.template.md | Code Chef | Custom |
| review-chef.template.md | Review Chef | Custom |

<!-- AI:TEMPLATES:END -->

---

=== CREATING NEW AGENTS ===
<!-- AI:CREATING:START -->

To create a new agent:

1. Use @skill(agent-creation) for the full procedure
2. Select appropriate template from `agentdocs/templates/`
3. Customize for project-specific needs
4. Assign unique Codebook ID: `CB-AGENT-{NAME}-NNN`
5. Register in the REGISTERED AGENTS table above
6. Log creation in buildlog with `#micro-decision`

<!-- AI:CREATING:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Review agent effectiveness | Weekly | Head Cook |
| Update agent skills | As skills evolve | Head Cook |
| Retire unused agents | Quarterly | Head Cook |
| Update this registry | When agents change | Head Cook |

<!-- AI:MAINTENANCE:END -->
