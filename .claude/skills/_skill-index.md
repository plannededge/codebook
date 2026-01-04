---
document_name: "_skill-index.md"
location: ".claude/skills/_skill-index.md"
codebook_id: "CB-SKILL-INDEX"
version: "2.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-04"
document_type: "index"
purpose: "Registry of all skills available to agents - defines what procedural capabilities exist"
category: "skills"
status: "active"
ai_parser_instructions: |
  This is the skill registry. Use to find available skills.
  Reference skills using: @skill(skill-name)
  Each skill has procedures that agents can follow.
  Skills are organized by category.
---

# Skill Registry

[!FIXED!]
## About Skills

Skills are **detailed procedural manuals** that define HOW to do specific tasks. Unlike agents (which define roles), skills are step-by-step guides that agents reference.

### Skill vs Agent

| Aspect | Skill | Agent |
|--------|-------|-------|
| Purpose | How to do something | Who does what |
| Granularity | Detailed procedures | Role definition |
| Reusability | Used by multiple agents | Unique identity |
| Location | `.claude/skills/` | `agentdocs/` |
[!FIXED!]

---

=== REGISTERED SKILLS ===
<!-- AI:REGISTRY:START -->

### Core Skills (Shared)

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-SETUP-001 | project-setup | project-setup.skill.md | Head Cook |
| CB-SKILL-GITFLOW-001 | git-workflow | git-workflow.skill.md | All developers |
| CB-SKILL-CODEQUAL-001 | code-quality | code-quality.skill.md | All developers |
| CB-SKILL-AGENTCREATE-001 | agent-creation | agent-creation.skill.md | Head Cook |

### Product Management Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-REQGATHER-001 | requirements-gathering | requirements-gathering.skill.md | Product Manager |
| CB-SKILL-ISSUEMGMT-001 | issue-management | issue-management.skill.md | Product Manager |
| CB-SKILL-ROADMAP-001 | roadmap-planning | roadmap-planning.skill.md | Product Manager |

### Delivery Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-RELEASE-001 | release-management | release-management.skill.md | Delivery Lead |
| CB-SKILL-CHANGELOG-001 | changelog-maintenance | changelog-maintenance.skill.md | Delivery Lead |
| CB-SKILL-VERSION-001 | versioning | versioning.skill.md | Delivery Lead |

### DevOps Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-CICD-001 | cicd-pipeline | cicd-pipeline.skill.md | DevOps Engineer |
| CB-SKILL-INFRA-001 | infrastructure | infrastructure.skill.md | DevOps Engineer |
| CB-SKILL-DEPLOY-001 | deployment | deployment.skill.md | DevOps Engineer |

### Security Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-SECREVIEW-001 | security-review | security-review.skill.md | Security Lead |
| CB-SKILL-VULN-001 | vulnerability-assessment | vulnerability-assessment.skill.md | Security Lead |
| CB-SKILL-COMPLIANCE-001 | compliance-check | compliance-check.skill.md | Security Lead |

### Quality Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-QUALREVIEW-001 | quality-review | quality-review.skill.md | QA Lead |
| CB-SKILL-TESTSTRAT-001 | testing-strategy | testing-strategy.skill.md | QA Lead |
| CB-SKILL-QUALGATE-001 | quality-gates | quality-gates.skill.md | QA Lead |

### Backend Development Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-APIDEV-001 | api-development | api-development.skill.md | Backend Engineer |
| CB-SKILL-BACKPAT-001 | backend-patterns | backend-patterns.skill.md | Backend Engineer |

### Frontend Development Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-COMPDEV-001 | component-development | component-development.skill.md | Frontend Engineer |
| CB-SKILL-FRONTPAT-001 | frontend-patterns | frontend-patterns.skill.md | Frontend Engineer |

### Database Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-SCHEMA-001 | schema-design | schema-design.skill.md | Database Engineer |
| CB-SKILL-MIGRATE-001 | migration-management | migration-management.skill.md | Database Engineer |

### UI Design Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-DESIGNSYS-001 | design-system | design-system.skill.md | UI Designer |
| CB-SKILL-VISUALDES-001 | visual-design | visual-design.skill.md | UI Designer |
| CB-SKILL-TOKENS-001 | design-tokens | design-tokens.skill.md | UI Designer |

### UX Design Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-USERFLOW-001 | user-flows | user-flows.skill.md | UX Designer |
| CB-SKILL-USABILITY-001 | usability-review | usability-review.skill.md | UX Designer |
| CB-SKILL-A11Y-001 | accessibility | accessibility.skill.md | UX Designer |

### Marketing Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-POSITION-001 | positioning | positioning.skill.md | PMM |
| CB-SKILL-MESSAGE-001 | messaging | messaging.skill.md | PMM |
| CB-SKILL-GTM-001 | gtm-planning | gtm-planning.skill.md | PMM |

### Documentation Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-TECHWRITE-001 | technical-writing | technical-writing.skill.md | Doc Chef |
| CB-SKILL-APIDOC-001 | api-documentation | api-documentation.skill.md | Doc Chef |

### Content Skills

| Codebook ID | Skill Name | File | Used By |
|-------------|------------|------|---------|
| CB-SKILL-MICROCOPY-001 | microcopy | microcopy.skill.md | Copywriter |
| CB-SKILL-USERCONTENT-001 | user-content | user-content.skill.md | Copywriter |
| CB-SKILL-VOICETONE-001 | voice-tone | voice-tone.skill.md | Copywriter |

<!-- AI:REGISTRY:END -->

---

=== SKILL CATEGORIES ===
<!-- AI:CATEGORIES:START -->

### Core (4 skills)
- @skill(project-setup) - Initialize and verify project fundamentals
- @skill(git-workflow) - Git operations and workflows
- @skill(code-quality) - Code standards and best practices
- @skill(agent-creation) - Creating and registering new agents

### Product Management (3 skills)
- @skill(requirements-gathering) - User stories, requirements docs
- @skill(issue-management) - GitHub issues workflow
- @skill(roadmap-planning) - Product roadmap and milestones

### Delivery (3 skills)
- @skill(release-management) - Release process and coordination
- @skill(changelog-maintenance) - Changelog updates (keepachangelog.org)
- @skill(versioning) - Semantic versioning

### DevOps (3 skills)
- @skill(cicd-pipeline) - CI/CD workflow creation
- @skill(infrastructure) - Environment and config management
- @skill(deployment) - Deployment procedures

### Security (3 skills)
- @skill(security-review) - Security code review
- @skill(vulnerability-assessment) - Dependency scanning
- @skill(compliance-check) - Compliance verification

### Quality (3 skills)
- @skill(quality-review) - Quality code review
- @skill(testing-strategy) - Test pyramid and coverage
- @skill(quality-gates) - Quality gate enforcement

### Backend Development (2 skills)
- @skill(api-development) - REST/GraphQL API design
- @skill(backend-patterns) - Architecture patterns

### Frontend Development (2 skills)
- @skill(component-development) - UI component creation
- @skill(frontend-patterns) - Frontend architecture

### Database (2 skills)
- @skill(schema-design) - Database schema design
- @skill(migration-management) - Migration workflows

### UI Design (3 skills)
- @skill(design-system) - Design system management
- @skill(visual-design) - Visual design work
- @skill(design-tokens) - Token management

### UX Design (3 skills)
- @skill(user-flows) - User flow design
- @skill(usability-review) - Usability audits
- @skill(accessibility) - WCAG compliance

### Marketing (3 skills)
- @skill(positioning) - Product positioning
- @skill(messaging) - Messaging frameworks
- @skill(gtm-planning) - Go-to-market planning

### Documentation (2 skills)
- @skill(technical-writing) - Technical writing
- @skill(api-documentation) - API documentation

### Content (3 skills)
- @skill(microcopy) - UI microcopy
- @skill(user-content) - User-facing content
- @skill(voice-tone) - Voice and tone consistency

<!-- AI:CATEGORIES:END -->

---

=== SKILL FILE STRUCTURE ===
<!-- AI:STRUCTURE:START -->

All skill files must follow this structure:

```markdown
---
# YAML preamble with required fields
document_name: "{name}.skill.md"
location: ".claude/skills/{name}.skill.md"
codebook_id: "CB-SKILL-{ID}-001"
# ... other required fields
skill_metadata:
  category: ""           # Category from list above
  complexity: ""         # simple|intermediate|advanced
  estimated_time: ""     # Typical time to complete
  prerequisites: []      # Required knowledge/skills
---

# {Skill Name} Skill

=== PURPOSE ===
What this skill accomplishes.

=== USED BY ===
Table of agents that use this skill.

=== PROCEDURES ===
Step-by-step procedures with clear instructions.

=== RELATED SKILLS ===
Links to related skills.
```

<!-- AI:STRUCTURE:END -->

---

=== ADDING NEW SKILLS ===
<!-- AI:ADDING:START -->

To add a new skill:

1. Create skill file in `.claude/skills/` following naming pattern: `{name}.skill.md`
2. Use the skill file structure above
3. Include USED BY section referencing the agent
4. Assign a unique Codebook ID: `CB-SKILL-{SHORTNAME}-NNN`
5. Add entry to the REGISTERED SKILLS table in this file
6. Log creation in buildlog with `#micro-decision`

<!-- AI:ADDING:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Review skill accuracy | Monthly | Head Cook |
| Update outdated procedures | As needed | Assigned Agent |
| Archive deprecated skills | Quarterly | Head Cook |
| Add new skills | As project evolves | Head Cook |

<!-- AI:MAINTENANCE:END -->
