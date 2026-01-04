---
document_name: "_rules-index.md"
location: ".claude/rules/_rules-index.md"
codebook_id: "CB-RULE-INDEX"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "index"
purpose: "Registry of all CLI rules - ensures AI agents use CLIs correctly and safely"
category: "rules"
status: "active"
ai_parser_instructions: |
  This is the CLI rules registry.
  Rules define safe usage patterns for command-line tools.
  Reference rules using: @rule(cli-name)
  Each rule includes documentation links for internet lookup.
---

# CLI Rules Registry

[!FIXED!]
## About CLI Rules

CLI Rules are **safety and usage guidelines** for command-line interfaces. They ensure AI agents:
- Use CLIs correctly with proper syntax
- Avoid dangerous operations without user confirmation
- Handle credentials and secrets safely
- Know when to consult official documentation

### How to Use Rules

1. Before running CLI commands, check the relevant rule file
2. Use WebFetch or WebSearch to review official docs for complex operations
3. Follow safety guidelines especially for destructive operations
4. Always confirm dangerous operations with the user

### Rule vs Skill

| Aspect | Rule | Skill |
|--------|------|-------|
| Purpose | Safe CLI usage | How to do tasks |
| Scope | Single CLI tool | Multi-step procedures |
| Content | Commands, safety, auth | Step-by-step guides |
| Location | `.claude/rules/` | `.claude/skills/` |
[!FIXED!]

---

=== REGISTERED RULES ===
<!-- AI:REGISTRY:START -->

### DevOps & Infrastructure CLIs

| Codebook ID | Rule | CLI | Documentation |
|-------------|------|-----|---------------|
| CB-RULE-DOCKER-001 | docker-cli.rule.md | docker | https://docs.docker.com/reference/cli/docker/ |
| CB-RULE-FLYCTL-001 | flyctl.rule.md | flyctl | https://fly.io/docs/flyctl/ |
| CB-RULE-GCLOUD-001 | gcloud-cli.rule.md | gcloud | https://cloud.google.com/sdk/gcloud/reference |
| CB-RULE-AWS-001 | aws-cli.rule.md | aws | https://docs.aws.amazon.com/cli/ |
| CB-RULE-VERCEL-001 | vercel-cli.rule.md | vercel | https://vercel.com/docs/cli |

### Development CLIs

| Codebook ID | Rule | CLI | Documentation |
|-------------|------|-----|---------------|
| CB-RULE-GH-001 | github-cli.rule.md | gh | https://cli.github.com/manual/ |
| CB-RULE-SENTRY-001 | sentry-cli.rule.md | sentry-cli | https://docs.sentry.io/cli/ |

### Package Managers

| Codebook ID | Rule | CLI | Documentation |
|-------------|------|-----|---------------|
| CB-RULE-NPM-001 | npm.rule.md | npm | https://docs.npmjs.com/cli/ |
| CB-RULE-PNPM-001 | pnpm.rule.md | pnpm | https://pnpm.io/ |
| CB-RULE-YARN-001 | yarn.rule.md | yarn | https://yarnpkg.com/ |

<!-- AI:REGISTRY:END -->

---

=== DOCUMENTATION LOOKUP ===
<!-- AI:DOCLOOKUP:START -->

### When to Consult Documentation

**ALWAYS** use WebFetch or WebSearch to check official docs when:
- Using a command you haven't used before
- Dealing with complex flags or options
- Performing destructive or irreversible operations
- Handling authentication or credentials
- Troubleshooting errors

### Lookup Pattern

```markdown
1. Check the rule file for the CLI
2. Find the documentation URL in the rule metadata
3. Use WebFetch to retrieve specific doc pages
4. Verify command syntax before execution
```

### Example

```
Before: gh pr create --help
After: WebFetch("https://cli.github.com/manual/gh_pr_create", "What flags are available for gh pr create?")
```

<!-- AI:DOCLOOKUP:END -->

---

=== SAFETY PRINCIPLES ===
<!-- AI:SAFETY:START -->

### Universal CLI Safety Rules

1. **Never hardcode credentials** - Use environment variables or secure vaults
2. **Confirm destructive operations** - Always ask user before delete/remove/destroy
3. **Avoid force flags blindly** - `-f`, `--force` bypass safety checks
4. **Check dry-run first** - Use `--dry-run` when available
5. **Validate targets** - Confirm you're targeting the right resource/environment
6. **Log sensitive operations** - Document what was changed and when

### Dangerous Operation Categories

| Category | Examples | Required Action |
|----------|----------|-----------------|
| Destructive | delete, remove, destroy, prune | User confirmation |
| Force | --force, -f, --hard | Explain consequences |
| Production | prod, production, main | Double-check target |
| Auth | login, logout, token | Secure handling |
| Global | --global, system-wide | Warn about scope |

<!-- AI:SAFETY:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(head-cook) @ref(CB-AGENT-HEAD-001) | Orchestration decisions |
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Infrastructure CLIs |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Development CLIs |
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | Package managers |
| All agents | General CLI safety |

<!-- AI:USEDBY:END -->

---

=== ADDING NEW RULES ===
<!-- AI:ADDING:START -->

To add a new CLI rule:

1. Create rule file in `.claude/rules/` following naming pattern: `{cli-name}.rule.md`
2. Use the rule file structure (see any existing rule)
3. Include official documentation URL
4. Document safety considerations
5. Assign a unique Codebook ID: `CB-RULE-{CLI}-001`
6. Add entry to the REGISTERED RULES table above
7. Log creation in buildlog with `#micro-decision`

<!-- AI:ADDING:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Review rule accuracy | Monthly | Head Cook |
| Update documentation URLs | As CLIs update | Assigned Agent |
| Add new CLI rules | As project adopts new tools | Head Cook |
| Archive deprecated CLIs | Quarterly | Head Cook |

<!-- AI:MAINTENANCE:END -->
