---
document_name: "deployment.md"
location: "workflows/deployment.md"
codebook_id: "CB-WF-DEPLOY-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-05"
document_type: "workflow"
purpose: "End-to-end deployment workflow - from code merge to production"
category: "workflows"
status: "active"
ai_parser_instructions: |
  This document describes the deployment workflow.
  Use markers: === SECTION ===, [!FIXED!], [?DYNAMIC?].
  Reference using @ref(CB-WF-DEPLOY-001).
---

# Deployment Workflow

[!FIXED!]
## Overview

This workflow describes the end-to-end process for deploying code changes to production environments. It covers the steps from code merge through production deployment and verification.

### When to Use

- Deploying new features to production
- Deploying bug fixes and patches
- Scheduled release deployments
- Hotfix deployments
[!FIXED!]

---

=== DEPLOYMENT STAGES ===
<!-- AI:STAGES:START -->

[?DYNAMIC?]
```
1. Pre-Deployment Checks
   └── Verify all CI checks pass
   └── Confirm QA approval
   └── Review changelog

2. Staging Deployment
   └── Deploy to staging environment
   └── Run smoke tests
   └── Verify functionality

3. Production Deployment
   └── Create deployment tag
   └── Deploy to production
   └── Monitor for errors

4. Post-Deployment
   └── Verify production health
   └── Update status page
   └── Notify stakeholders
```
[?DYNAMIC?]

<!-- AI:STAGES:END -->

---

=== PRE-DEPLOYMENT CHECKLIST ===
<!-- AI:PREDEPLOY:START -->

[?DYNAMIC?]
Before deploying, verify:

- [ ] All CI/CD checks pass on the target branch
- [ ] Code review completed and approved
- [ ] QA sign-off received (if applicable)
- [ ] Database migrations tested in staging
- [ ] Feature flags configured correctly
- [ ] Rollback plan documented
- [ ] On-call team notified
[?DYNAMIC?]

<!-- AI:PREDEPLOY:END -->

---

=== DEPLOYMENT PROCESS ===
<!-- AI:PROCESS:START -->

### 1. Staging Deployment

```bash
# Deploy to staging
<< deployment_command_staging >>

# Run smoke tests
<< smoke_test_command >>

# Verify staging health
<< health_check_command >>
```

### 2. Production Deployment

```bash
# Create release tag
git tag -a v<version> -m "Release v<version>"
git push origin v<version>

# Deploy to production
<< deployment_command_production >>

# Monitor deployment
<< monitoring_command >>
```

### 3. Verification

```bash
# Check application health
<< health_check_production >>

# Verify key functionality
<< verification_steps >>
```

<!-- AI:PROCESS:END -->

---

=== ROLLBACK PROCEDURE ===
<!-- AI:ROLLBACK:START -->

[?DYNAMIC?]
If issues are detected after deployment:

1. **Assess Severity**
   - Critical: Immediate rollback
   - Major: Rollback within 15 minutes
   - Minor: Fix forward if possible

2. **Execute Rollback**
   ```bash
   # Rollback to previous version
   << rollback_command >>
   ```

3. **Post-Rollback**
   - Notify stakeholders
   - Create incident report
   - Schedule post-mortem
[?DYNAMIC?]

<!-- AI:ROLLBACK:END -->

---

=== POST-DEPLOYMENT ===
<!-- AI:POSTDEPLOY:START -->

[?DYNAMIC?]
After successful deployment:

- [ ] Verify production metrics are normal
- [ ] Check error rates in monitoring
- [ ] Update deployment log
- [ ] Close related tickets/issues
- [ ] Send deployment notification
- [ ] Update CHANGELOG.md
[?DYNAMIC?]

<!-- AI:POSTDEPLOY:END -->

---

=== RELATED DOCUMENTS ===
<!-- AI:RELATED:START -->

| Document | Purpose |
|----------|---------|
| @ref(CB-WF-GITFLOW-001) | Git branching workflow |
| @ref(CB-WF-CICD-001) | CI/CD pipeline workflow |
| @rule(flyctl) | Fly.io deployment CLI |
| @rule(vercel-cli) | Vercel deployment CLI |
| @rule(gcloud-cli) | GCP deployment CLI |

<!-- AI:RELATED:END -->
