---
document_name: "sentry-cli.rule.md"
location: ".claude/rules/sentry-cli.rule.md"
codebook_id: "CB-RULE-SENTRY-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of Sentry CLI"
cli_metadata:
  command: "sentry-cli"
  documentation_url: "https://docs.sentry.io/cli/"
  version_check: "sentry-cli --version"
  install_docs: "https://docs.sentry.io/cli/installation/"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "sentry"
  - "monitoring"
  - "error-tracking"
ai_parser_instructions: |
  This rule defines safe usage of Sentry CLI.
  Used for release tracking and source map uploads.
  Handle auth tokens securely.
---

# Sentry CLI Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://docs.sentry.io/cli/

| Resource | URL |
|----------|-----|
| CLI Reference | https://docs.sentry.io/cli/ |
| Releases | https://docs.sentry.io/cli/releases/ |
| Source Maps | https://docs.sentry.io/cli/sourcemaps/ |
| dSYMs | https://docs.sentry.io/cli/dif/ |

**IMPORTANT**: Use WebFetch or WebSearch to review current documentation for:
- Source map configurations
- Release associations
- Organization/project settings

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Protect auth tokens**
   - Never expose SENTRY_AUTH_TOKEN
   - Use environment variables

2. **Verify organization/project**
   - Commands target specific org/project
   - Wrong target uploads to wrong project

3. **Release names matter**
   - Consistent naming for tracking
   - Typically match git SHA or version

4. **Source maps contain source code**
   - Don't upload to wrong project
   - Can expose proprietary code

### Never Do

```bash
# NEVER expose tokens
sentry-cli --auth-token xxx  # Visible in history!

# NEVER upload to production without verification
sentry-cli releases finalize VERSION  # Verify version first

# NEVER use hardcoded org/project in scripts
sentry-cli --org=myorg --project=myproj  # Use env vars
```

### Pre-Flight Check

```bash
# 1. Check auth
sentry-cli info

# 2. Verify organization
sentry-cli organizations list

# 3. Verify project
sentry-cli projects list
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Releases

```bash
# Create release
sentry-cli releases new VERSION

# Set commits for release
sentry-cli releases set-commits VERSION --auto

# Finalize release
sentry-cli releases finalize VERSION

# List releases
sentry-cli releases list

# Delete release (careful!)
sentry-cli releases delete VERSION
```

### Source Maps

```bash
# Upload source maps
sentry-cli sourcemaps upload --release=VERSION ./dist

# Inject debug IDs
sentry-cli sourcemaps inject ./dist

# Explain source map issues
sentry-cli sourcemaps explain
```

### Deploys

```bash
# Create deploy
sentry-cli releases deploys VERSION new -e production

# List deploys
sentry-cli releases deploys VERSION list
```

### Debug Files (iOS/Android)

```bash
# Upload dSYMs
sentry-cli dif upload path/to/dSYMs

# Check dSYM
sentry-cli dif check path/to/dSYM
```

### Events

```bash
# Send test event
sentry-cli send-event -m "Test message"

# Send with extra data
sentry-cli send-event -m "Test" -e key:value
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `releases delete` | Removes release data | Confirm version |
| `releases finalize` | Marks release live | Verify version correct |
| `sourcemaps upload` | Overwrites existing | Confirm release version |

### Irreversible Operations

```bash
# Deleting releases removes associated data
sentry-cli releases delete VERSION

# Always verify the release version before finalizing
sentry-cli releases finalize VERSION
```

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Safe Authentication

```bash
# Login (interactive)
sentry-cli login

# Check current auth
sentry-cli info
```

### Environment Variables (Preferred)

```bash
export SENTRY_AUTH_TOKEN=xxx
export SENTRY_ORG=organization-slug
export SENTRY_PROJECT=project-slug
```

### Configuration File

`.sentryclirc`:
```ini
[auth]
token=YOUR_TOKEN

[defaults]
org=your-org
project=your-project
```

**Important**: Add `.sentryclirc` to `.gitignore`!

### Never Do

```bash
# NEVER pass token in command
sentry-cli --auth-token TOKEN  # BAD

# NEVER commit .sentryclirc with real token
# NEVER echo or log tokens
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "authentication required" | No token set | Set SENTRY_AUTH_TOKEN |
| "project not found" | Wrong org/project | Check SENTRY_ORG/PROJECT |
| "release not found" | Release doesn't exist | Create release first |
| "invalid auth token" | Token expired/wrong | Generate new token |

### Debugging

```bash
# Verbose output
sentry-cli --log-level=debug COMMAND

# Check configuration
sentry-cli info

# Test authentication
sentry-cli organizations list
```

<!-- AI:ERRORS:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Release automation |
| @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001) | Release tracking |
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | Source map uploads |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @skill(release-management) | Release procedures |
| @rule(github-cli) | Release coordination |

<!-- AI:RELATED:END -->
