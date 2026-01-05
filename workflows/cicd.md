---
document_name: "cicd.md"
location: "workflows/cicd.md"
codebook_id: "CB-WF-CICD-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-05"
document_type: "workflow"
purpose: "CI/CD pipeline workflow - automated testing, building, and deployment"
category: "workflows"
status: "active"
ai_parser_instructions: |
  This document describes the CI/CD pipeline workflow.
  Use markers: === SECTION ===, [!FIXED!], [?DYNAMIC?].
  Reference using @ref(CB-WF-CICD-001).
---

# CI/CD Pipeline Workflow

[!FIXED!]
## Overview

This workflow describes the Continuous Integration and Continuous Deployment pipeline. It covers automated testing, building, and deployment processes that run on every code change.

### Purpose

- Automate code quality checks
- Ensure consistent builds
- Enable rapid, reliable deployments
- Catch issues early in development
[!FIXED!]

---

=== PIPELINE STAGES ===
<!-- AI:PIPELINE:START -->

[?DYNAMIC?]
```
Push/PR
    │
    ▼
┌─────────────┐
│  CI Stage   │
├─────────────┤
│ • Lint      │
│ • Type Check│
│ • Unit Tests│
│ • Build     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  CD Stage   │
├─────────────┤
│ • Deploy    │
│   Preview   │
│ (on PR)     │
└──────┬──────┘
       │
       ▼ (on main)
┌─────────────┐
│ Production  │
├─────────────┤
│ • Deploy    │
│   Staging   │
│ • Deploy    │
│   Prod      │
└─────────────┘
```
[?DYNAMIC?]

<!-- AI:PIPELINE:END -->

---

=== CI STAGE ===
<!-- AI:CI:START -->

### Triggered On
- Every push to any branch
- Every pull request

### Jobs

#### 1. Lint
```yaml
<< linter_configuration >>
```
- Check code formatting
- Enforce style rules
- Catch common errors

#### 2. Type Check
```yaml
<< typecheck_configuration >>
```
- Validate TypeScript/type annotations
- Ensure type safety

#### 3. Unit Tests
```yaml
<< test_configuration >>
```
- Run test suite
- Generate coverage report
- Fail if coverage drops

#### 4. Build
```yaml
<< build_configuration >>
```
- Compile application
- Generate production bundle
- Verify build succeeds

<!-- AI:CI:END -->

---

=== CD STAGE ===
<!-- AI:CD:START -->

### Preview Deployments (PRs)

[?DYNAMIC?]
- Deploy preview environment for each PR
- Provide unique preview URL
- Run integration tests
- Auto-cleanup on PR close
[?DYNAMIC?]

### Production Deployments (main)

[?DYNAMIC?]
1. **Staging Deployment**
   - Auto-deploy on merge to main
   - Run smoke tests
   - Wait for manual approval

2. **Production Deployment**
   - Deploy after staging approval
   - Blue-green deployment
   - Health check verification
[?DYNAMIC?]

<!-- AI:CD:END -->

---

=== CONFIGURATION ===
<!-- AI:CONFIG:START -->

### GitHub Actions Example

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm ci
      - run: npm run lint
      - run: npm run typecheck
      - run: npm test
      - run: npm run build

  deploy-preview:
    needs: ci
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - << preview_deployment_steps >>

  deploy-production:
    needs: ci
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - << production_deployment_steps >>
```

<!-- AI:CONFIG:END -->

---

=== QUALITY GATES ===
<!-- AI:GATES:START -->

[?DYNAMIC?]
| Gate | Requirement | Enforcement |
|------|-------------|-------------|
| Lint | No errors | Block merge |
| Types | No type errors | Block merge |
| Tests | All pass | Block merge |
| Coverage | >= 80% | Warn on drop |
| Build | Successful | Block merge |
| Security | No critical vulnerabilities | Block merge |
[?DYNAMIC?]

<!-- AI:GATES:END -->

---

=== ENVIRONMENT VARIABLES ===
<!-- AI:ENV:START -->

[?DYNAMIC?]
### Required Secrets

| Secret | Purpose | Where Set |
|--------|---------|-----------|
| `DEPLOY_TOKEN` | Deployment authentication | Repository secrets |
| `DATABASE_URL` | Database connection | Environment secrets |
| `API_KEY` | External service auth | Environment secrets |

### Environment-Specific

| Variable | Development | Staging | Production |
|----------|-------------|---------|------------|
| `NODE_ENV` | development | staging | production |
| `API_URL` | localhost | staging.api | api |
| `DEBUG` | true | true | false |
[?DYNAMIC?]

<!-- AI:ENV:END -->

---

=== TROUBLESHOOTING ===
<!-- AI:TROUBLESHOOT:START -->

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| Build fails | Missing dependencies | Clear cache, reinstall |
| Tests timeout | Slow CI runner | Increase timeout, parallelize |
| Deploy fails | Auth expired | Refresh deployment tokens |
| Flaky tests | Race conditions | Add proper async handling |

### Debugging CI

```bash
# View workflow runs
gh run list

# Watch specific run
gh run watch <run-id>

# View run logs
gh run view <run-id> --log
```

<!-- AI:TROUBLESHOOT:END -->

---

=== RELATED DOCUMENTS ===
<!-- AI:RELATED:START -->

| Document | Purpose |
|----------|---------|
| @ref(CB-WF-DEPLOY-001) | Deployment workflow |
| @ref(CB-WF-GITFLOW-001) | Git branching workflow |
| @rule(github-cli) | GitHub CLI for workflow management |
| @rule(docker-cli) | Container builds |

<!-- AI:RELATED:END -->
