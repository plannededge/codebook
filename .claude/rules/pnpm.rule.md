---
document_name: "pnpm.rule.md"
location: ".claude/rules/pnpm.rule.md"
codebook_id: "CB-RULE-PNPM-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of pnpm"
cli_metadata:
  command: "pnpm"
  documentation_url: "https://pnpm.io/"
  version_check: "pnpm --version"
  install_docs: "https://pnpm.io/installation"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "pnpm"
  - "nodejs"
  - "package-manager"
ai_parser_instructions: |
  This rule defines safe usage of pnpm.
  pnpm uses hard links and is stricter than npm.
  Understand workspace and monorepo features.
---

# pnpm Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://pnpm.io/

| Resource | URL |
|----------|-----|
| CLI Reference | https://pnpm.io/cli/add |
| Workspaces | https://pnpm.io/workspaces |
| pnpm-lock.yaml | https://pnpm.io/git#lockfiles |
| Configuration | https://pnpm.io/npmrc |

**IMPORTANT**: Use WebFetch or WebSearch to review documentation for:
- Workspace configurations
- Filtering commands
- Monorepo patterns

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Stricter than npm**
   - pnpm enforces proper peer dependencies
   - Packages can't access undeclared dependencies

2. **Content-addressable store**
   - Packages shared via hard links
   - Don't manually modify node_modules

3. **Workspace awareness**
   - Commands may affect all packages
   - Use filters for specific packages

4. **Lock file is critical**
   - `pnpm-lock.yaml` must be committed
   - Don't mix with npm/yarn lock files

### Never Do

```bash
# NEVER modify node_modules directly
# pnpm uses hard links - changes affect store

# NEVER mix package managers
npm install  # BAD in pnpm project

# NEVER ignore peer dependency warnings
pnpm install --ignore-peer-deps  # Use shamefully-hoist if needed
```

### Pre-Flight Check

```bash
# 1. Check for outdated
pnpm outdated

# 2. Audit dependencies
pnpm audit

# 3. Verify workspace
pnpm list --depth=0
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Installation

```bash
# Install all dependencies
pnpm install

# Add dependency
pnpm add PACKAGE

# Add dev dependency
pnpm add -D PACKAGE

# Add to specific workspace
pnpm add PACKAGE --filter WORKSPACE

# Install specific version
pnpm add PACKAGE@VERSION

# Install globally
pnpm add -g PACKAGE
```

### Scripts

```bash
# Run script
pnpm run SCRIPT_NAME

# Run in all workspaces
pnpm run -r SCRIPT_NAME

# Run in specific workspace
pnpm --filter WORKSPACE run SCRIPT_NAME

# Common shortcuts
pnpm start
pnpm test
pnpm build
```

### Workspace Commands

```bash
# Run in all packages
pnpm -r COMMAND

# Filter by name
pnpm --filter "package-name" COMMAND

# Filter by directory
pnpm --filter "./packages/*" COMMAND

# Filter by dependency
pnpm --filter "...package-name" COMMAND
```

### Package Management

```bash
# List packages
pnpm list

# List workspaces
pnpm list --depth=-1

# Check outdated
pnpm outdated

# Update packages
pnpm update

# Remove package
pnpm remove PACKAGE
```

### Security

```bash
# Audit for vulnerabilities
pnpm audit

# Fix vulnerabilities
pnpm audit --fix

# Check licenses
pnpm licenses list
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `pnpm publish` | Makes package public | Use --dry-run first |
| `pnpm -r update` | Updates all workspaces | Review changes |
| `pnpm store prune` | Removes unused packages | Check store size |
| `pnpm deploy` | Copies to target | Verify destination |

### Workspace Operations

```bash
# These affect multiple packages - be careful!
pnpm -r update           # Updates ALL workspaces
pnpm -r publish          # Publishes ALL packages
pnpm -r exec COMMAND     # Runs in ALL packages
```

Always use `--filter` when targeting specific packages.

### Store Commands

```bash
# Prune store (usually safe)
pnpm store prune

# Check store status
pnpm store status
```

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Registry Authentication

```bash
# Login
pnpm login

# Set auth token in .npmrc
//registry.npmjs.org/:_authToken=xxx
```

### .npmrc Configuration

```ini
# Project .npmrc
registry=https://registry.npmjs.org/
strict-peer-dependencies=true

# Never commit auth tokens
```

### Private Registries

```bash
# Configure scoped registry
pnpm config set @myorg:registry https://npm.myorg.com/
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "Peer dependencies not met" | Strict peer deps | Install missing peers |
| "Not found in workspace" | Wrong filter | Check package name |
| "ENOENT" | Missing pnpm-lock.yaml | Run `pnpm install` |
| "ERR_PNPM_REGISTRIES_MISMATCH" | Mixed registries | Check .npmrc |

### Debugging

```bash
# Verbose output
pnpm install --reporter=default

# Why is package installed
pnpm why PACKAGE

# Check configuration
pnpm config list

# Verify store integrity
pnpm store status
```

### Migration from npm/yarn

```bash
# Import existing lock file
pnpm import

# Generate new lock file
rm -rf node_modules
pnpm install
```

<!-- AI:ERRORS:END -->

---

=== PNPM SPECIFIC FEATURES ===
<!-- AI:FEATURES:START -->

### Workspace Protocol

```json
{
  "dependencies": {
    "my-package": "workspace:*"
  }
}
```

### Catalog (pnpm 9+)

```yaml
# pnpm-workspace.yaml
catalog:
  react: ^18.2.0
```

### Side Effects Cache

```json
{
  "pnpm": {
    "neverBuiltDependencies": ["fsevents"]
  }
}
```

<!-- AI:FEATURES:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | Dependency management |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Monorepo projects |
| All developers | Package installation |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(npm) | Alternative package manager |
| @rule(yarn) | Alternative package manager |
| @checklist(security-openssf) | Dependency security |

<!-- AI:RELATED:END -->
