---
document_name: "yarn.rule.md"
location: ".claude/rules/yarn.rule.md"
codebook_id: "CB-RULE-YARN-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of Yarn"
cli_metadata:
  command: "yarn"
  documentation_url: "https://yarnpkg.com/"
  version_check: "yarn --version"
  install_docs: "https://yarnpkg.com/getting-started/install"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "yarn"
  - "nodejs"
  - "package-manager"
ai_parser_instructions: |
  This rule defines safe usage of Yarn.
  Note differences between Yarn Classic (1.x) and Yarn Berry (2+).
  Check version before assuming command syntax.
---

# Yarn Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://yarnpkg.com/

| Resource | URL |
|----------|-----|
| CLI Reference | https://yarnpkg.com/cli |
| Workspaces | https://yarnpkg.com/features/workspaces |
| Configuration | https://yarnpkg.com/configuration/manifest |
| Migration | https://yarnpkg.com/getting-started/migration |

**Version Note**: Yarn has two major versions:
- **Yarn Classic** (1.x): `yarn.lock`
- **Yarn Berry** (2+): `.yarnrc.yml`, Plug'n'Play

**IMPORTANT**: Check Yarn version first - commands differ!

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Check Yarn version first**
   ```bash
   yarn --version  # 1.x = Classic, 2+ = Berry
   ```

2. **Lock file is critical**
   - Classic: `yarn.lock`
   - Berry: `yarn.lock` (different format)
   - Never mix with npm/pnpm lock files

3. **Plug'n'Play (PnP) awareness**
   - Berry uses PnP by default
   - May break some tools expecting node_modules

4. **Workspace commands affect scope**
   - Use `yarn workspace` for specific packages
   - Use `yarn workspaces foreach` for all

### Never Do

```bash
# NEVER mix package managers
npm install  # BAD in Yarn project

# NEVER delete lock file to "fix" issues
rm yarn.lock  # Causes version drift

# NEVER ignore postinstall scripts
yarn install --ignore-scripts  # May hide issues
```

### Pre-Flight Check

```bash
# 1. Check version
yarn --version

# 2. Check for outdated
yarn outdated

# 3. Audit dependencies
yarn audit

# 4. Verify integrity
yarn check --integrity  # Classic only
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Installation

```bash
# Install all dependencies
yarn install
yarn  # Shorthand

# Add dependency
yarn add PACKAGE

# Add dev dependency
yarn add -D PACKAGE

# Add specific version
yarn add PACKAGE@VERSION

# Install globally (avoid in Berry)
yarn global add PACKAGE
```

### Scripts

```bash
# Run script
yarn run SCRIPT_NAME
yarn SCRIPT_NAME  # Shorthand

# Common shortcuts
yarn start
yarn test
yarn build
```

### Package Management

```bash
# List packages
yarn list

# Check outdated
yarn outdated

# Update package
yarn upgrade PACKAGE

# Update all
yarn upgrade

# Remove package
yarn remove PACKAGE
```

### Workspaces (Monorepo)

```bash
# Run in specific workspace
yarn workspace PACKAGE_NAME COMMAND

# Run in all workspaces (Berry)
yarn workspaces foreach COMMAND

# List workspaces
yarn workspaces list  # Berry
yarn workspaces info  # Classic
```

### Security

```bash
# Audit for vulnerabilities
yarn audit

# Check licenses
yarn licenses list
```

<!-- AI:COMMANDS:END -->

---

=== YARN BERRY SPECIFIC ===
<!-- AI:BERRY:START -->

### Plug'n'Play (PnP)

```bash
# Enable/disable PnP
yarn config set nodeLinker pnp     # Enable
yarn config set nodeLinker node-modules  # Disable
```

### Yarn Berry Configuration

`.yarnrc.yml`:
```yaml
nodeLinker: node-modules  # For compatibility
npmRegistryServer: "https://registry.npmjs.org"
```

### Plugin System

```bash
# Add plugin
yarn plugin import @yarnpkg/plugin-typescript

# List plugins
yarn plugin list
```

<!-- AI:BERRY:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `yarn publish` | Makes package public | Use --dry-run first |
| `yarn upgrade --latest` | Major version changes | Review changes |
| `yarn cache clean` | Removes cache | May slow reinstalls |
| `yarn workspaces foreach publish` | Publishes all | Verify scope |

### Publishing

```bash
# Always dry-run first
yarn publish --dry-run

# Verify package contents
yarn pack --dry-run
```

### Cache Operations

```bash
# Clear cache (usually unnecessary)
yarn cache clean

# Check cache
yarn cache list
```

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Registry Authentication

**Classic**:
```bash
yarn login
```

**Berry**:
```yaml
# .yarnrc.yml
npmRegistryServer: "https://registry.npmjs.org"
npmAuthToken: "${NPM_TOKEN}"
```

### Scoped Registries

**Classic** (`.npmrc`):
```ini
@myorg:registry=https://npm.myorg.com/
//npm.myorg.com/:_authToken=xxx
```

**Berry** (`.yarnrc.yml`):
```yaml
npmScopes:
  myorg:
    npmRegistryServer: "https://npm.myorg.com/"
    npmAuthToken: "${NPM_TOKEN}"
```

### Never Do

```bash
# NEVER commit auth tokens
# NEVER hardcode tokens in .yarnrc.yml
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "Couldn't find package" | Wrong name/version | Verify package exists |
| "ESOCKETTIMEDOUT" | Network timeout | Retry or check network |
| "Integrity check failed" | Corrupted cache | `yarn cache clean` |
| "peer dependencies" | Missing peer dep | Install peer dependency |

### Debugging

```bash
# Verbose output
yarn install --verbose

# Check why package installed
yarn why PACKAGE

# Check configuration
yarn config list

# Berry: check state
yarn explain peer-requirements
```

### Common Fixes

```bash
# Integrity issues (Classic)
yarn cache clean
rm -rf node_modules
yarn install

# Berry issues
yarn install --mode=update-lockfile
```

<!-- AI:ERRORS:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | Dependency management |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Node.js projects |
| All developers | Package installation |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(npm) | Alternative package manager |
| @rule(pnpm) | Alternative package manager |
| @checklist(security-openssf) | Dependency security |

<!-- AI:RELATED:END -->
