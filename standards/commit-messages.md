---
document_name: "commit-messages.md"
location: "standards/commit-messages.md"
codebook_id: "CB-STD-COMMITS-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "standard"
purpose: "Standard format for Git commit messages using conventional commits"
category: "standards"
subcategory: "version-control"
related_docs:
  - ".claude/skills/git-workflow.skill.md"
  - "workflows/git-flow.md"
status: "active"
ai_parser_instructions: |
  This document defines commit message format.
  Based on Conventional Commits specification.
  Section markers: === SECTION ===
---

# Commit Message Standard

[!FIXED!]
## Purpose

Consistent commit messages enable automatic changelog generation, semantic versioning, and easier history navigation. This standard follows [Conventional Commits](https://www.conventionalcommits.org/).
[!FIXED!]

---

=== FORMAT ===
<!-- AI:FORMAT:START -->

### Structure

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Components

| Component | Required | Description |
|-----------|----------|-------------|
| type | Yes | Category of change |
| scope | No | Area affected |
| description | Yes | Short summary |
| body | No | Detailed explanation |
| footer | No | Breaking changes, issues |

### Example

```
feat(auth): add OAuth2 login support

Implement OAuth2 authentication flow with Google and GitHub providers.
Users can now link social accounts to their profile.

- Add OAuth2 client configuration
- Implement callback handling
- Add social account linking UI

Closes #123
BREAKING CHANGE: authToken format changed from JWT to opaque token
```

<!-- AI:FORMAT:END -->

---

=== TYPES ===
<!-- AI:TYPES:START -->

### Required Types

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat(cart): add quantity selector` |
| `fix` | Bug fix | `fix(api): handle null response` |

### Optional Types

| Type | Description | Example |
|------|-------------|---------|
| `docs` | Documentation | `docs(readme): add setup guide` |
| `style` | Formatting, white-space | `style: fix indentation` |
| `refactor` | Code restructure (no behavior change) | `refactor(utils): extract helpers` |
| `test` | Adding/fixing tests | `test(auth): add login tests` |
| `chore` | Maintenance, tooling | `chore: update dependencies` |
| `perf` | Performance improvement | `perf(query): optimize database lookup` |
| `build` | Build system changes | `build: update webpack config` |
| `ci` | CI configuration | `ci: add GitHub Actions workflow` |
| `revert` | Revert previous commit | `revert: revert "feat(auth): add OAuth"` |

<!-- AI:TYPES:END -->

---

=== SCOPE ===
<!-- AI:SCOPE:START -->

### Guidelines

- Use lowercase
- Use noun describing section of codebase
- Be consistent across commits
- Optional but recommended

### Common Scopes

| Scope | Meaning |
|-------|---------|
| `api` | API endpoints |
| `auth` | Authentication |
| `ui` | User interface |
| `db` | Database |
| `config` | Configuration |
| `deps` | Dependencies |

### Project-Specific Scopes

[?DYNAMIC?]
Define scopes for your project:
- Feature areas
- Module names
- Component names
[?DYNAMIC?]

<!-- AI:SCOPE:END -->

---

=== DESCRIPTION ===
<!-- AI:DESCRIPTION:START -->

### Rules

1. **Imperative mood** - "add" not "added" or "adds"
2. **Lowercase** - Don't capitalize first letter
3. **No period** - Don't end with a period
4. **Max 50 characters** - Keep it concise
5. **Complete thought** - Should complete "If applied, this commit will..."

### Good Examples

```
feat(auth): add password reset functionality
fix(cart): prevent duplicate item addition
docs(api): update authentication examples
refactor(utils): extract date formatting logic
```

### Bad Examples

```
feat(auth): Added login.        # Past tense, period
fix: bug fix                    # Too vague
Update stuff                    # No type, vague
feat(auth): Add a new feature that allows users to reset their password via email link  # Too long
```

<!-- AI:DESCRIPTION:END -->

---

=== BODY ===
<!-- AI:BODY:START -->

### When to Include

- Complex changes needing explanation
- Changes with non-obvious reasoning
- Breaking changes
- Multiple related changes

### Format

- Separate from description with blank line
- Wrap at 72 characters
- Explain what and why, not how
- Can include bullet points

### Example

```
feat(payment): add retry logic for failed transactions

Implement exponential backoff retry for payment processing failures.
This addresses the intermittent gateway timeouts we've been seeing
during peak hours.

- Initial retry after 1 second
- Max 3 retries with doubling interval
- Log all retry attempts for monitoring
- Alert on final failure
```

<!-- AI:BODY:END -->

---

=== FOOTER ===
<!-- AI:FOOTER:START -->

### Issue References

```
Closes #123
Fixes #456
Refs #789
```

### Breaking Changes

```
BREAKING CHANGE: description of breaking change

Migration: steps to migrate
```

### Multiple Footers

```
Closes #123
Reviewed-by: Jane Doe
Co-authored-by: John Smith <john@example.com>
BREAKING CHANGE: API response format changed
```

<!-- AI:FOOTER:END -->

---

=== BREAKING CHANGES ===
<!-- AI:BREAKING:START -->

### Indicators

1. **Footer notation:**
   ```
   BREAKING CHANGE: description
   ```

2. **Exclamation mark:**
   ```
   feat(api)!: change response format
   ```

### What Constitutes Breaking Change

- API contract changes
- Database schema changes (without migration)
- Configuration format changes
- Removed features
- Changed default behavior

### Example

```
feat(api)!: change user endpoint response format

Response now returns nested profile object instead of flat structure.

BREAKING CHANGE: User API response structure changed.

Before:
{ id, name, email, avatarUrl }

After:
{ id, profile: { name, email, avatarUrl } }

Migration: Update client code to access user.profile.name
```

<!-- AI:BREAKING:END -->

---

=== BUILDLOG INTEGRATION ===
<!-- AI:BUILDLOG:START -->

Log commits in buildlog with `#commit` tag:

```markdown
| 11:45 | #commit | feat(auth): add OAuth2 login support | PR #42 |
```

For breaking changes, also add:
```markdown
| 11:50 | #micro-decision | Breaking change: auth token format | CB-ARCH-AUTH |
```

<!-- AI:BUILDLOG:END -->

---

=== ENFORCEMENT ===
<!-- AI:ENFORCEMENT:START -->

### Git Hooks

Use commitlint with husky:

```bash
npm install --save-dev @commitlint/cli @commitlint/config-conventional husky
```

```javascript
// commitlint.config.js
module.exports = {
  extends: ['@commitlint/config-conventional']
};
```

### CI Check

```yaml
# .github/workflows/commit-lint.yml
name: Lint Commits
on: [pull_request]
jobs:
  commitlint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - uses: wagoid/commitlint-github-action@v5
```

<!-- AI:ENFORCEMENT:END -->

---

=== AI ATTRIBUTION ===
<!-- AI:ATTRIBUTION:START -->

### When to Use

Add AI attribution trailers when:
- AI agent generated or significantly modified the code
- AI agent assisted with refactoring or review
- Multiple agents collaborated on the change

See @ref(CB-STD-APS-001) for complete Agentic Provenance Standard.

### Required Trailers

**All AI-assisted commits MUST include:**

```
AI-Agent: {provider}:{kernel}@{version}+{skills-hash}#{config-hash}
AI-Human-Reviewed: true|false
```

**Example:**
```
AI-Agent: anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2
AI-Human-Reviewed: true
```

### Recommended Trailers

**Include when available:**

```
AI-Model: claude-sonnet-4-5-20250929
AI-Kernel: claude-code@1.5.0
AI-Session: sess_abc123def456
AI-Skills: code-generator@2.1.0, security-check@1.5.0
AI-Tokens-In: 12450
AI-Tokens-Out: 3280
AI-Contribution: generate|refactor|review|fix|document|test|collaborate
```

### Complete Example

```
feat(auth): implement OAuth2 PKCE flow

Implements secure OAuth2 authorization code flow with PKCE for mobile
clients. Includes token refresh logic and secure storage integration.

The retry logic uses exponential backoff as recommended by Stripe docs.

AI-Agent: anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2
AI-Model: claude-sonnet-4-5-20250929
AI-Kernel: claude-code@1.5.0
AI-Session: sess_auth_impl_001
AI-Skills: code-generator@2.1.0, security-check@1.5.0
AI-Tokens-In: 12450
AI-Tokens-Out: 3280
AI-Contribution: generate
AI-Human-Reviewed: true
Reviewed-by: Alice <alice@example.com>
```

### Multi-Agent Attribution

When multiple agents contribute:

```
feat(api): refactor authentication middleware

Refactored auth middleware based on security review feedback.

AI-Agent: anthropic:coder@1.0.0+sk123#abc12345
AI-Subagents: security-reviewer#def456 (review), test-runner#ghi789 (validation)
AI-Contribution-Graph: main→security-reviewer→test-runner
AI-Human-Reviewed: true
```

### Automation

Use Git hooks to automatically add trailers from environment variables:

```bash
# Set before committing
export APS_AGENT_ID="anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2"
export APS_HUMAN_REVIEWED="true"
export APS_MODEL="claude-sonnet-4-5-20250929"
export APS_SESSION="sess_feature_001"

# Commit (hooks add trailers automatically)
git commit -m "feat(auth): add OAuth2 flow"
```

See `templates/aps/git-hooks/` for hook implementations.

<!-- AI:ATTRIBUTION:END -->
