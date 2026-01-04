---
document_name: "vercel-cli.rule.md"
location: ".claude/rules/vercel-cli.rule.md"
codebook_id: "CB-RULE-VERCEL-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of Vercel CLI"
cli_metadata:
  command: "vercel"
  documentation_url: "https://vercel.com/docs/cli"
  version_check: "vercel --version"
  install_docs: "https://vercel.com/docs/cli#installing-vercel-cli"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "vercel"
  - "deployment"
  - "serverless"
ai_parser_instructions: |
  This rule defines safe usage of Vercel CLI.
  Used for frontend and serverless deployments.
  Be careful with production deployments.
---

# Vercel CLI Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://vercel.com/docs/cli

| Resource | URL |
|----------|-----|
| CLI Reference | https://vercel.com/docs/cli |
| Deployment | https://vercel.com/docs/cli/deploy |
| Environment Variables | https://vercel.com/docs/cli/env |
| Project Configuration | https://vercel.com/docs/project-configuration |

**IMPORTANT**: Use WebFetch or WebSearch to review documentation for:
- Framework-specific configurations
- Environment variable management
- Team and project settings

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Verify project context**
   ```bash
   vercel whoami        # Check logged in user
   vercel project ls    # Check project
   ```

2. **Production deployments**
   - `vercel --prod` deploys to production
   - Preview deployments are safer for testing

3. **Environment variables**
   - Don't expose in commands
   - Use `vercel env pull` for local development

4. **Team awareness**
   - Commands may affect team projects
   - Verify scope before operations

### Never Do

```bash
# NEVER deploy to prod without testing preview first
vercel --prod  # Test preview deployment first

# NEVER expose secrets in commands
vercel env add SECRET_KEY=value  # Use interactive mode

# NEVER remove projects without confirmation
vercel rm PROJECT_NAME
```

### Pre-Flight Check

```bash
# 1. Check login
vercel whoami

# 2. Check linked project
vercel project ls

# 3. Check current deployments
vercel ls
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Deployment

```bash
# Deploy (preview)
vercel

# Deploy to production
vercel --prod

# Deploy specific directory
vercel ./dist

# Deploy with build command
vercel --build-command "npm run build"
```

### Project Management

```bash
# Link to existing project
vercel link

# List projects
vercel project ls

# Remove project (careful!)
vercel rm PROJECT_NAME
```

### Environment Variables

```bash
# Add environment variable (interactive)
vercel env add

# Pull environment to local
vercel env pull

# List environment variables
vercel env ls

# Remove environment variable
vercel env rm VAR_NAME
```

### Deployments

```bash
# List deployments
vercel ls

# Inspect deployment
vercel inspect DEPLOYMENT_URL

# View logs
vercel logs DEPLOYMENT_URL

# Alias deployment
vercel alias DEPLOYMENT_URL custom.domain.com
```

### Development

```bash
# Local development server
vercel dev

# Pull project settings
vercel pull
```

### Domains

```bash
# List domains
vercel domains ls

# Add domain
vercel domains add DOMAIN

# Remove domain
vercel domains rm DOMAIN
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `vercel --prod` | Production deployment | Test preview first |
| `vercel rm` | Removes project | Confirm project name |
| `vercel domains rm` | Removes domain | Check DNS dependencies |
| `vercel env rm` | May break deployments | Check usage |
| `vercel alias rm` | Removes custom domain | Check traffic |

### Production Impact

```bash
# These affect production - confirm first!
vercel --prod              # Deploys to production
vercel alias DEPLOYMENT    # Changes production URL
vercel rollback           # Reverts production
```

### Rollback

```bash
# Rollback to previous deployment
vercel rollback

# Rollback to specific deployment
vercel rollback DEPLOYMENT_URL
```

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Login Methods

```bash
# Login (interactive)
vercel login

# Login with email
vercel login email@example.com

# Check current login
vercel whoami

# Logout
vercel logout
```

### Token Authentication (CI/CD)

```bash
# Set token in environment
export VERCEL_TOKEN=xxx

# Or use --token flag
vercel --token xxx deploy
```

### Team Context

```bash
# Switch to team
vercel switch TEAM_NAME

# List teams
vercel teams ls

# Use specific team
vercel --scope TEAM_NAME COMMAND
```

### Never Do

```bash
# NEVER expose tokens
echo $VERCEL_TOKEN  # BAD

# NEVER commit tokens
# NEVER share personal tokens
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "Not logged in" | Auth expired | Run `vercel login` |
| "Project not found" | Wrong directory | Run `vercel link` |
| "Build failed" | Build error | Check build logs |
| "Domain not verified" | DNS not configured | Add DNS records |
| "Rate limited" | Too many deployments | Wait or upgrade plan |

### Debugging

```bash
# Verbose output
vercel --debug

# Check deployment logs
vercel logs DEPLOYMENT_URL

# Inspect deployment
vercel inspect DEPLOYMENT_URL

# Check project settings
vercel project ls
```

<!-- AI:ERRORS:END -->

---

=== VERCEL.JSON CONFIGURATION ===
<!-- AI:CONFIG:START -->

### Common Configuration

```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "dist",
  "installCommand": "npm ci",
  "framework": "nextjs",
  "regions": ["iad1"],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        { "key": "X-Frame-Options", "value": "DENY" }
      ]
    }
  ]
}
```

### Environment-Specific

```json
{
  "env": {
    "MY_VAR": "@my-secret"
  }
}
```

Reference secrets with `@` prefix.

<!-- AI:CONFIG:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Deployment configuration |
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | Frontend deployments |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(npm) | Package management |
| @rule(github-cli) | Git integration |
| @skill(deployment) | Deployment procedures |

<!-- AI:RELATED:END -->
