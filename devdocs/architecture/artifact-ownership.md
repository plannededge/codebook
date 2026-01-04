---
document_name: "artifact-ownership.md"
location: "devdocs/architecture/artifact-ownership.md"
codebook_id: "CB-DEVDOC-ARTIFACT-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "devdoc"
purpose: "Single source of truth for artifact ownership - which agent owns which artifacts"
category: "architecture"
status: "active"
ai_parser_instructions: |
  This document defines artifact ownership across all agents.
  Use this to determine which agent should create/modify specific artifacts.
  Cross-reference format: @agent(name) @ref(CB-AGENT-XXX-001)
---

# Artifact Ownership Matrix

This document is the **single source of truth** for artifact ownership. When determining which agent should handle a task, consult this matrix.

---

## Quick Reference

| Artifact Type | Owner Agent | Location |
|--------------|-------------|----------|
| GitHub Issues | @agent(product-manager) | GitHub |
| CHANGELOG.md | @agent(delivery-lead) | /CHANGELOG.md |
| Release Notes | @agent(delivery-lead) | GitHub Releases |
| CI/CD Workflows | @agent(devops-engineer) | .github/workflows/ |
| Infrastructure Code | @agent(devops-engineer) | infrastructure/ |
| Security Reviews | @agent(security-lead) | PR Comments |
| Quality Reviews | @agent(qa-lead) | PR Comments |
| Backend Code | @agent(backend-engineer) | src/server/, src/api/ |
| Frontend Code | @agent(frontend-engineer) | src/components/, src/pages/ |
| Database Migrations | @agent(database-engineer) | migrations/, prisma/ |
| Design System | @agent(ui-designer) | devdocs/ui/design-system.md |
| User Flows | @agent(ux-designer) | devdocs/ui/user-flows.md |
| Marketing Docs | @agent(product-marketing-manager) | devdocs/marketing/ |
| Technical Docs | @agent(doc-chef) | devdocs/, guides/ |
| User-facing Copy | @agent(copywriter) | UI text, help docs |
| Buildlog Entries | All Agents | buildlogs/ |
| Codebook Maintenance | @agent(head-cook) | All codebook files |

---

## Detailed Ownership

### Version Control Artifacts

| Artifact | Owner | Collaborators | Notes |
|----------|-------|---------------|-------|
| **Commits (Backend)** | @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | - | Must follow @ref(CB-STD-COMMITS-001) |
| **Commits (Frontend)** | @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | - | Must follow @ref(CB-STD-COMMITS-001) |
| **Commits (Database)** | @agent(database-engineer) @ref(CB-AGENT-DATABASE-001) | - | Must follow @ref(CB-STD-COMMITS-001) |
| **Commits (Infrastructure)** | @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | - | Must follow @ref(CB-STD-COMMITS-001) |
| **Pull Requests** | Creating Developer | Security Lead, QA Lead | Must follow @ref(CB-STD-PR-001) |
| **Branch Creation** | Creating Developer | - | Must follow @ref(CB-STD-NAMING-001) |

### Release Artifacts

| Artifact | Owner | Collaborators | Notes |
|----------|-------|---------------|-------|
| **CHANGELOG.md** | @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001) | All | Follows keepachangelog.org |
| **Release Notes** | @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001) | PMM | Uses @ref(CB-TPL-RELEASE-001) |
| **Version Tags** | @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001) | DevOps | Semantic versioning |
| **GitHub Releases** | @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001) | - | Links to changelog |

### GitHub Artifacts

| Artifact | Owner | Collaborators | Notes |
|----------|-------|---------------|-------|
| **Bug Reports** | @agent(product-manager) @ref(CB-AGENT-PM-001) | QA Lead | Uses @ref(CB-TPL-ISSUE-BUG-001) |
| **Feature Requests** | @agent(product-manager) @ref(CB-AGENT-PM-001) | UX Designer | Uses @ref(CB-TPL-ISSUE-FEATURE-001) |
| **Tasks** | @agent(product-manager) @ref(CB-AGENT-PM-001) | Developers | Uses @ref(CB-TPL-ISSUE-TASK-001) |
| **Epics** | @agent(product-manager) @ref(CB-AGENT-PM-001) | All | Uses @ref(CB-TPL-ISSUE-EPIC-001) |
| **Labels** | @agent(product-manager) @ref(CB-AGENT-PM-001) | - | Uses @ref(CB-TPL-LABELS-001) |
| **Milestones** | @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001) | PM | Tied to releases |

### Infrastructure Artifacts

| Artifact | Owner | Collaborators | Notes |
|----------|-------|---------------|-------|
| **CI/CD Pipelines** | @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | - | .github/workflows/ |
| **Deployment Scripts** | @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | - | scripts/deploy/ |
| **Infrastructure Code** | @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Security Lead | IaC files |
| **Environment Configs** | @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | - | .env.example |
| **Docker Files** | @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | - | Dockerfile, compose |

### Review Artifacts

| Artifact | Owner | Aspect | Authority |
|----------|-------|--------|-----------|
| **Security Reviews** | @agent(security-lead) @ref(CB-AGENT-SECURITY-001) | Auth, Data, Deps | CAN BLOCK |
| **Quality Reviews** | @agent(qa-lead) @ref(CB-AGENT-QA-001) | Tests, Quality | CAN BLOCK |
| **Design Reviews** | @agent(ui-designer) @ref(CB-AGENT-UIDESIGN-001) | Visual consistency | Advisory |
| **UX Reviews** | @agent(ux-designer) @ref(CB-AGENT-UXDESIGN-001) | Usability | Advisory |

### Documentation Artifacts

| Artifact | Owner | Collaborators | Notes |
|----------|-------|---------------|-------|
| **Architecture Docs** | @agent(doc-chef) @ref(CB-AGENT-DOC-001) | Backend, DevOps | devdocs/architecture/ |
| **API Documentation** | @agent(doc-chef) @ref(CB-AGENT-DOC-001) | Backend | OpenAPI/Swagger |
| **Developer Guides** | @agent(doc-chef) @ref(CB-AGENT-DOC-001) | All devs | guides/ |
| **Design System Docs** | @agent(ui-designer) @ref(CB-AGENT-UIDESIGN-001) | Frontend | devdocs/ui/design-system.md |
| **User Flow Docs** | @agent(ux-designer) @ref(CB-AGENT-UXDESIGN-001) | PM | devdocs/ui/user-flows.md |
| **Business Docs** | @agent(product-manager) @ref(CB-AGENT-PM-001) | PMM | devdocs/business/ |
| **Marketing Docs** | @agent(product-marketing-manager) @ref(CB-AGENT-PMM-001) | PM | devdocs/marketing/ |

### Content Artifacts

| Artifact | Owner | Collaborators | Notes |
|----------|-------|---------------|-------|
| **UI Microcopy** | @agent(copywriter) @ref(CB-AGENT-COPY-001) | UX Designer | Button labels, errors |
| **Help Content** | @agent(copywriter) @ref(CB-AGENT-COPY-001) | Doc Chef | User-facing help |
| **Onboarding Text** | @agent(copywriter) @ref(CB-AGENT-COPY-001) | UX Designer | Welcome flows |
| **Marketing Copy** | @agent(copywriter) @ref(CB-AGENT-COPY-001) | PMM | Landing pages |
| **Email Templates** | @agent(copywriter) @ref(CB-AGENT-COPY-001) | PMM | Transactional |

### Codebook Artifacts

| Artifact | Owner | Collaborators | Notes |
|----------|-------|---------------|-------|
| **CLAUDE.md** | @agent(head-cook) @ref(CB-AGENT-HEAD-001) | - | Master orchestration |
| **Agent Definitions** | @agent(head-cook) @ref(CB-AGENT-HEAD-001) | - | agentdocs/ |
| **Skills** | @agent(head-cook) @ref(CB-AGENT-HEAD-001) | Domain agents | .claude/skills/ |
| **Standards** | @agent(head-cook) @ref(CB-AGENT-HEAD-001) | All | standards/ |
| **Buildlogs** | All Agents | - | Their own entries |
| **Index Files** | @agent(head-cook) @ref(CB-AGENT-HEAD-001) | - | _*-index.md |

---

## Handoff Protocols

### When Ownership is Unclear

1. Check this matrix first
2. If not listed, escalate to @agent(head-cook)
3. Head Cook will assign ownership and update this matrix
4. Log decision in buildlog with `#micro-decision`

### Cross-Domain Artifacts

Some artifacts span multiple domains:

| Artifact | Primary Owner | Secondary Owner | Resolution |
|----------|--------------|-----------------|------------|
| API + Frontend integration | Backend Engineer | Frontend Engineer | Backend defines contract |
| UI + UX conflicts | UI Designer | UX Designer | UX has final say on flows |
| Security + Performance tradeoffs | Security Lead | DevOps | Security takes precedence |
| Copy + Brand consistency | Copywriter | PMM | PMM defines brand, Copywriter executes |

---

## Buildlog Attribution

All buildlog entries MUST include agent attribution:

```markdown
| Time | Tag | Agent | Entry | Related |
|------|-----|-------|-------|---------|
| 14:30 | #commit | @agent(backend-engineer) | Added user auth endpoint | CB-SKILL-APIDEV-001 |
```

---

## Related Documents

- @ref(CB-AGENT-INDEX) - Agent registry
- @ref(CB-SKILL-INDEX) - Skill registry
- @ref(CB-STD-COMMITS-001) - Commit message standard
- @ref(CB-STD-PR-001) - Pull request standard
