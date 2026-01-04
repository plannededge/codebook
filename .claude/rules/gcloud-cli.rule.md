---
document_name: "gcloud-cli.rule.md"
location: ".claude/rules/gcloud-cli.rule.md"
codebook_id: "CB-RULE-GCLOUD-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of Google Cloud CLI (gcloud)"
cli_metadata:
  command: "gcloud"
  documentation_url: "https://cloud.google.com/sdk/gcloud/reference"
  version_check: "gcloud --version"
  install_docs: "https://cloud.google.com/sdk/docs/install"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "gcloud"
  - "google-cloud"
  - "infrastructure"
ai_parser_instructions: |
  This rule defines safe usage of Google Cloud CLI.
  Cloud operations can be expensive and destructive.
  Always verify project and region before operations.
---

# Google Cloud CLI (gcloud) Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://cloud.google.com/sdk/gcloud/reference

| Resource | URL |
|----------|-----|
| Command Reference | https://cloud.google.com/sdk/gcloud/reference |
| Quickstart | https://cloud.google.com/sdk/docs/quickstart |
| Configurations | https://cloud.google.com/sdk/docs/configurations |
| IAM Reference | https://cloud.google.com/iam/docs/understanding-roles |

**IMPORTANT**: Use WebFetch or WebSearch to review current documentation for:
- Service-specific commands
- IAM role configurations
- Billing-related operations
- Organization policy changes

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Always verify project context**
   ```bash
   gcloud config get-value project  # Check before ANY operation
   ```

2. **Double-check region/zone**
   - Resources are regional/zonal
   - Mistakes can cause data locality issues

3. **Billing awareness**
   - Many operations create billable resources
   - Check pricing before creating resources

4. **IAM changes are powerful**
   - Can lock yourself out
   - Can grant excessive permissions

### Never Do

```bash
# NEVER run without checking project first
gcloud compute instances delete INSTANCE  # Could be wrong project!

# NEVER grant owner to service accounts without review
gcloud projects add-iam-policy-binding PROJECT \
  --member="serviceAccount:SA" --role="roles/owner"

# NEVER delete without confirmation
gcloud projects delete PROJECT_ID
```

### Pre-Flight Check

Before any gcloud command:
```bash
# 1. Check current project
gcloud config get-value project

# 2. Check current account
gcloud auth list

# 3. Check current region/zone (if applicable)
gcloud config get-value compute/region
gcloud config get-value compute/zone
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Configuration

```bash
# List configurations
gcloud config configurations list

# Create new config
gcloud config configurations create CONFIG_NAME

# Switch configuration
gcloud config configurations activate CONFIG_NAME

# Set project
gcloud config set project PROJECT_ID

# Set region/zone
gcloud config set compute/region REGION
gcloud config set compute/zone ZONE
```

### Compute Engine

```bash
# List instances
gcloud compute instances list

# Describe instance
gcloud compute instances describe INSTANCE_NAME

# Start/stop instance
gcloud compute instances start INSTANCE_NAME
gcloud compute instances stop INSTANCE_NAME

# SSH to instance
gcloud compute ssh INSTANCE_NAME
```

### Cloud Run

```bash
# List services
gcloud run services list

# Deploy service
gcloud run deploy SERVICE_NAME --image IMAGE_URL

# View logs
gcloud run services logs read SERVICE_NAME
```

### Cloud Storage

```bash
# List buckets
gcloud storage buckets list

# Create bucket
gcloud storage buckets create gs://BUCKET_NAME

# Copy files
gcloud storage cp SOURCE gs://BUCKET/PATH
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `gcloud projects delete` | Irreversible project deletion | Confirm project, check resources |
| `gcloud compute instances delete` | Data loss | Confirm instance, check disks |
| `gcloud iam service-accounts delete` | Breaks dependent services | Check dependencies |
| `gcloud sql instances delete` | Database loss | Verify backups exist |
| `gcloud container clusters delete` | Destroys Kubernetes cluster | Check workloads |

### Cost Implications

| Command | Cost Risk |
|---------|-----------|
| `gcloud compute instances create` | Ongoing VM costs |
| `gcloud sql instances create` | Database hosting costs |
| `gcloud container clusters create` | GKE cluster costs |
| `gcloud storage buckets create` | Storage costs |

Always inform user of potential costs before creating resources.

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Safe Authentication Practices

1. **Use `gcloud auth login`** - Interactive browser auth
2. **Service accounts**: Use for automation only
3. **Application default**: `gcloud auth application-default login`
4. **Never store keys in code**

### Authentication Commands

```bash
# Login (interactive)
gcloud auth login

# List authenticated accounts
gcloud auth list

# Set active account
gcloud config set account ACCOUNT_EMAIL

# Application default credentials
gcloud auth application-default login

# Revoke credentials
gcloud auth revoke
```

### Service Account Usage

```bash
# Activate service account (automation only)
gcloud auth activate-service-account --key-file=KEY_FILE.json

# List service accounts
gcloud iam service-accounts list
```

### Never Do

```bash
# NEVER commit service account keys
# NEVER use personal auth in production scripts
# NEVER share key files
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "permission denied" | Insufficient IAM roles | Check user permissions |
| "not found" | Wrong project or deleted resource | Verify project/resource |
| "quota exceeded" | Hit project quota | Request quota increase |
| "billing not enabled" | No billing account | Enable billing |
| "invalid argument" | Wrong syntax | Check command reference |

### Debugging

```bash
# Verbose output
gcloud COMMAND --verbosity=debug

# Check project access
gcloud projects describe PROJECT_ID

# Check IAM permissions
gcloud projects get-iam-policy PROJECT_ID

# Test API access
gcloud services list --enabled
```

<!-- AI:ERRORS:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Infrastructure management |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Cloud Run deployments |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(docker-cli) | Container image builds |
| @rule(aws-cli) | Alternative cloud provider |
| @skill(deployment) | Deployment procedures |

<!-- AI:RELATED:END -->
