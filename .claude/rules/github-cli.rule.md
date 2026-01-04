---
document_name: "github-cli.rule.md"
location: ".claude/rules/github-cli.rule.md"
codebook_id: "CB-RULE-GH-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of GitHub CLI (gh)"
cli_metadata:
  command: "gh"
  documentation_url: "https://cli.github.com/manual/"
  version_check: "gh --version"
  install_docs: "https://github.com/cli/cli#installation"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "github"
  - "git"
ai_parser_instructions: |
  This rule defines safe usage of the GitHub CLI.
  Always consult official docs for complex operations.
  Pay special attention to destructive operations.
---

# GitHub CLI (gh) Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://cli.github.com/manual/

| Resource | URL |
|----------|-----|
| Command Reference | https://cli.github.com/manual/gh |
| Authentication | https://cli.github.com/manual/gh_auth |
| Configuration | https://cli.github.com/manual/gh_config |
| API Usage | https://cli.github.com/manual/gh_api |

**IMPORTANT**: Use WebFetch or WebSearch to review current documentation before complex operations, especially for:
- API calls with specific endpoints
- Workflow management
- Repository settings changes
- Organization-level operations

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Never delete without confirmation**
   - `gh repo delete` requires explicit user approval
   - `gh release delete` is permanent
   - `gh issue/pr close` can be reopened but causes notifications

2. **Protect production branches**
   - Avoid force operations on `main`/`master`
   - Use draft PRs for WIP work

3. **Review before merge**
   - Always check PR status before `gh pr merge`
   - Verify CI checks have passed

4. **API rate limits**
   - Be aware of GitHub API rate limits
   - Use `--paginate` carefully on large result sets

### Never Do

```bash
# NEVER run without user confirmation
gh repo delete REPO_NAME

# NEVER force push through CLI without explicit request
gh pr merge --admin  # Bypasses protections

# NEVER run on wrong repo
gh issue create  # Check you're in the right directory first
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Repository Operations

```bash
# Clone a repository
gh repo clone owner/repo

# View repo info
gh repo view

# Create a new repo
gh repo create repo-name --public/--private
```

### Pull Requests

```bash
# Create PR (interactive)
gh pr create

# Create PR with details
gh pr create --title "Title" --body "Description"

# List PRs
gh pr list

# View PR details
gh pr view PR_NUMBER

# Check out a PR locally
gh pr checkout PR_NUMBER

# Merge PR (verify first!)
gh pr merge PR_NUMBER
```

### Issues

```bash
# Create issue
gh issue create --title "Title" --body "Description"

# List issues
gh issue list

# View issue
gh issue view ISSUE_NUMBER

# Close issue (notifies watchers)
gh issue close ISSUE_NUMBER
```

### Workflows (Actions)

```bash
# List workflows
gh workflow list

# View workflow runs
gh run list

# Watch a run
gh run watch RUN_ID

# View run details
gh run view RUN_ID
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `gh repo delete` | Permanent data loss | Confirm repo name, check for forks |
| `gh release delete` | Removes release | Confirm version, check downloads |
| `gh pr merge --admin` | Bypasses protections | Confirm this is intended |
| `gh repo archive` | Makes repo read-only | Confirm no active development |
| `gh api DELETE` | Deletes resources | Confirm endpoint and resource |

### Always Ask User First

```bash
# Before deleting a repo
"Are you sure you want to delete [repo-name]? This cannot be undone."

# Before merging with admin override
"This will bypass branch protections. Confirm you want to proceed?"

# Before closing multiple issues
"This will close X issues. Continue?"
```

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Safe Authentication Practices

1. **Use `gh auth login`** - Never pass tokens in commands
2. **Check auth status**: `gh auth status`
3. **Token scopes**: Verify required scopes for operations
4. **Multiple accounts**: Use `gh auth switch` for different accounts

### Authentication Commands

```bash
# Login (interactive - preferred)
gh auth login

# Check current auth
gh auth status

# Refresh token
gh auth refresh

# Logout
gh auth logout
```

### Never Do

```bash
# NEVER expose tokens in commands
gh api --header "Authorization: token ghp_xxx"  # BAD

# NEVER commit .gh/ directory or tokens
# Ensure .gitignore includes credential files
```

### Environment Variables

If tokens must be used:
- Use `GH_TOKEN` or `GITHUB_TOKEN` environment variable
- Never echo or log token values
- Verify token is not in command history

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "authentication required" | Not logged in | Run `gh auth login` |
| "rate limit exceeded" | Too many API calls | Wait or use authenticated requests |
| "not found" | Wrong repo/resource | Check repository and permissions |
| "conflict" | Merge conflicts | Resolve conflicts locally first |
| "forbidden" | Insufficient permissions | Check token scopes or org access |

### Debugging

```bash
# Enable debug output
GH_DEBUG=1 gh command

# Check configuration
gh config list

# Verify API access
gh api rate_limit
```

<!-- AI:ERRORS:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(product-manager) @ref(CB-AGENT-PM-001) | Issue management |
| @agent(delivery-lead) @ref(CB-AGENT-DELIVERY-001) | Release management |
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Workflow automation |
| All developers | PR and issue workflows |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(docker-cli) | CI/CD integration |
| @skill(git-workflow) | Git operations |
| @skill(issue-management) | Issue procedures |

<!-- AI:RELATED:END -->
