---
document_name: "npm.rule.md"
location: ".claude/rules/npm.rule.md"
codebook_id: "CB-RULE-NPM-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of npm (Node Package Manager)"
cli_metadata:
  command: "npm"
  documentation_url: "https://docs.npmjs.com/cli/"
  version_check: "npm --version"
  install_docs: "https://docs.npmjs.com/downloading-and-installing-node-js-and-npm"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "npm"
  - "nodejs"
  - "package-manager"
ai_parser_instructions: |
  This rule defines safe usage of npm.
  Be careful with global installs and publishing.
  Verify packages before installing.
---

# npm Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://docs.npmjs.com/cli/

| Resource | URL |
|----------|-----|
| CLI Reference | https://docs.npmjs.com/cli/v10/commands |
| package.json Reference | https://docs.npmjs.com/cli/v10/configuring-npm/package-json |
| npm Scripts | https://docs.npmjs.com/cli/v10/using-npm/scripts |
| Security | https://docs.npmjs.com/packages-and-modules/securing-your-code |

**IMPORTANT**: Use WebFetch or WebSearch to review documentation for:
- Specific command options
- Security advisories
- Publishing workflows

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Verify packages before installing**
   - Check package popularity and maintenance
   - Look for typosquatting attacks
   - Review package.json scripts

2. **Prefer `npm ci` for clean installs**
   - Uses package-lock.json exactly
   - More reproducible than `npm install`

3. **Be careful with global installs**
   - Can affect system-wide node
   - Prefer npx for one-off commands

4. **Audit dependencies regularly**
   - `npm audit` finds vulnerabilities
   - `npm audit fix` applies safe fixes

### Never Do

```bash
# NEVER run postinstall scripts blindly
npm install suspicious-package  # Check scripts first

# NEVER publish without verification
npm publish  # Use --dry-run first

# NEVER ignore audit warnings in production
npm install --ignore-scripts  # May hide malicious code

# NEVER use --force without understanding
npm install --force  # Can break things
```

### Pre-Flight Check

```bash
# 1. Check for vulnerabilities
npm audit

# 2. Check outdated packages
npm outdated

# 3. Verify package source
npm info PACKAGE
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Installation

```bash
# Install all dependencies (uses package-lock.json)
npm ci

# Install dependencies (may update lock file)
npm install

# Add dependency
npm install PACKAGE

# Add dev dependency
npm install PACKAGE --save-dev

# Install specific version
npm install PACKAGE@VERSION

# Install globally
npm install -g PACKAGE
```

### Scripts

```bash
# Run script
npm run SCRIPT_NAME

# Common shortcuts
npm start
npm test
npm run build

# List available scripts
npm run
```

### Package Management

```bash
# List installed packages
npm list

# List top-level only
npm list --depth=0

# Check outdated
npm outdated

# Update packages
npm update

# Remove package
npm uninstall PACKAGE
```

### Security

```bash
# Audit for vulnerabilities
npm audit

# Fix vulnerabilities (safe fixes only)
npm audit fix

# Force fix (may include breaking changes)
npm audit fix --force
```

### Publishing

```bash
# Login to registry
npm login

# Test publish
npm publish --dry-run

# Publish package
npm publish

# Deprecate version
npm deprecate PACKAGE@VERSION "reason"
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `npm publish` | Makes package public | Use --dry-run first |
| `npm unpublish` | Removes from registry | Check dependents |
| `npm audit fix --force` | Breaking changes | Review changes |
| `npm install -g` | System-wide install | Verify package |
| `npm cache clean --force` | Removes cache | Usually unnecessary |

### Publishing Safeguards

```bash
# Always dry-run first
npm publish --dry-run

# Check what will be published
npm pack --dry-run

# Verify package contents
npm pack && tar -tf PACKAGE.tgz
```

### Unpublishing Restrictions

- Can only unpublish within 72 hours
- Cannot unpublish if dependents exist
- Consider `npm deprecate` instead

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Registry Authentication

```bash
# Login
npm login

# Check whoami
npm whoami

# Logout
npm logout
```

### Auth Tokens

```bash
# Create token
npm token create

# List tokens
npm token list

# Revoke token
npm token revoke TOKEN_ID
```

### .npmrc Security

```ini
# Project .npmrc (can commit)
registry=https://registry.npmjs.org/

# User .npmrc (NEVER commit)
//registry.npmjs.org/:_authToken=xxx
```

**Important**: Add `.npmrc` with tokens to `.gitignore`!

### Never Do

```bash
# NEVER commit auth tokens
# NEVER share .npmrc with tokens
# NEVER use npm_token in package.json
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "ENOENT" | Missing package.json | Run `npm init` |
| "EPERM" | Permission denied | Check file permissions |
| "ERESOLVE" | Dependency conflict | Check peer dependencies |
| "E404" | Package not found | Verify package name |
| "EINTEGRITY" | Checksum mismatch | Clear cache and reinstall |

### Debugging

```bash
# Verbose output
npm install --verbose

# Clear cache
npm cache clean --force

# Rebuild native modules
npm rebuild

# Check configuration
npm config list
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
| @rule(pnpm) | Alternative package manager |
| @rule(yarn) | Alternative package manager |
| @checklist(security-openssf) | Dependency security |

<!-- AI:RELATED:END -->
