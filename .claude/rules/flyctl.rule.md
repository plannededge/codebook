---
document_name: "flyctl.rule.md"
location: ".claude/rules/flyctl.rule.md"
codebook_id: "CB-RULE-FLYCTL-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of Fly.io CLI (flyctl/fly)"
cli_metadata:
  command: "fly"
  documentation_url: "https://fly.io/docs/flyctl/"
  version_check: "fly version"
  install_docs: "https://fly.io/docs/flyctl/install/"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "fly"
  - "flyctl"
  - "deployment"
ai_parser_instructions: |
  This rule defines safe usage of Fly.io CLI.
  Fly.io manages production deployments - be careful.
  Always verify app context before operations.
---

# Fly.io CLI (flyctl) Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://fly.io/docs/flyctl/

| Resource | URL |
|----------|-----|
| Command Reference | https://fly.io/docs/flyctl/ |
| Apps Documentation | https://fly.io/docs/apps/ |
| Machines Reference | https://fly.io/docs/machines/ |
| Postgres on Fly | https://fly.io/docs/postgres/ |

**IMPORTANT**: Use WebFetch or WebSearch to review current documentation for:
- Deployment configurations
- Scaling operations
- Database management
- Network configurations

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Always verify app context**
   ```bash
   fly status  # Check which app you're targeting
   ```

2. **Production awareness**
   - Fly.io apps are typically production services
   - Deployments affect live users

3. **Secrets are sensitive**
   - Never log or echo secrets
   - Use `fly secrets set` not command line args

4. **Database operations**
   - Postgres operations can cause data loss
   - Always have backups before destructive ops

### Never Do

```bash
# NEVER destroy without confirmation
fly apps destroy APP_NAME

# NEVER scale to zero in production without warning
fly scale count 0

# NEVER expose secrets in commands
fly secrets set API_KEY=actual_value  # Value visible in history!
```

### Pre-Flight Check

Before any fly command:
```bash
# 1. Check current app
fly status

# 2. Verify you're in correct directory (with fly.toml)
ls fly.toml

# 3. Check organization
fly orgs list
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### App Management

```bash
# Check app status
fly status

# List all apps
fly apps list

# View app info
fly apps show APP_NAME

# Open app in browser
fly apps open
```

### Deployment

```bash
# Deploy current directory
fly deploy

# Deploy with specific config
fly deploy --config fly.toml

# Deploy specific image
fly deploy --image IMAGE_URL

# Check deployment status
fly status
```

### Scaling

```bash
# Scale instances
fly scale count N

# Scale memory
fly scale memory 512

# Scale VM size
fly scale vm shared-cpu-1x

# View current scale
fly scale show
```

### Logs and Monitoring

```bash
# Tail logs
fly logs

# View specific instance logs
fly logs --instance INSTANCE_ID

# Check metrics
fly status --all
```

### Machines

```bash
# List machines
fly machines list

# Stop machine
fly machines stop MACHINE_ID

# Start machine
fly machines start MACHINE_ID
```

### Secrets

```bash
# Set secret (use stdin for values!)
echo "value" | fly secrets set SECRET_NAME=-

# List secrets (names only)
fly secrets list

# Remove secret
fly secrets unset SECRET_NAME
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `fly apps destroy` | Complete app deletion | Confirm app name, check dependencies |
| `fly scale count 0` | Service downtime | Confirm intentional |
| `fly volumes delete` | Data loss | Verify backups |
| `fly postgres destroy` | Database destruction | Confirm backups exist |
| `fly secrets unset` | May break app | Check app dependencies |

### Production Impact

| Command | Impact |
|---------|--------|
| `fly deploy` | Replaces running app |
| `fly scale` | Changes capacity |
| `fly secrets set` | Restarts app |
| `fly restart` | Brief downtime |

Always warn user about production impact before these operations.

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Safe Authentication Practices

1. **Use `fly auth login`** - Browser-based auth
2. **Tokens for CI/CD**: Use `FLY_API_TOKEN` env var
3. **Never commit tokens**
4. **Organization access**: Verify org membership

### Authentication Commands

```bash
# Login (interactive)
fly auth login

# Check auth status
fly auth whoami

# Create deploy token (CI/CD)
fly tokens create deploy

# Logout
fly auth logout
```

### CI/CD Token Usage

```bash
# Set in CI environment
export FLY_API_TOKEN=fo1_xxx

# Token is automatically used by flyctl
fly deploy
```

### Never Do

```bash
# NEVER expose tokens
echo $FLY_API_TOKEN  # BAD

# NEVER commit tokens or .fly directories with tokens
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "app not found" | Wrong directory or app | Check fly.toml |
| "not authenticated" | Auth expired | Run `fly auth login` |
| "no machines running" | App scaled to 0 | Scale up or deploy |
| "out of capacity" | Region at capacity | Try different region |
| "deployment failed" | Build or health check failed | Check logs |

### Debugging

```bash
# Verbose output
fly deploy --verbose

# Check app configuration
fly config show

# SSH into machine
fly ssh console

# Check machine status
fly machines list --json
```

<!-- AI:ERRORS:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Deployment management |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Service deployments |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(docker-cli) | Container builds |
| @skill(deployment) | Deployment procedures |
| @skill(infrastructure) | Infrastructure management |

<!-- AI:RELATED:END -->
