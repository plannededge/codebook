---
document_name: "agentic-provenance.md"
location: "standards/agentic-provenance.md"
codebook_id: "CB-STD-APS-001"
version: "1.0.0"
date_created: "2026-01-19"
date_last_edited: "2026-01-19"
document_type: "standard"
purpose: "Standard for AI agent attribution, versioning, and auditability in software development"
category: "standards"
subcategory: "ai-provenance"
related_docs:
  - "standards/commit-messages.md"
  - ".claude/skills/git-workflow.skill.md"
  - "guides/aps-adoption.md"
status: "active"
ai_parser_instructions: |
  This document defines the Agentic Provenance Standard (APS).
  Aligns with Agent Skills open standard (agentskills.io).
  Section markers: === SECTION ===
---

# Agentic Provenance Standard (APS)

[!FIXED!]
## Purpose

As AI agents become active contributors to software development, traditional version control attribution breaks down. The Agentic Provenance Standard (APS) provides a universal framework for:

- **Identifying** AI agents with unique, versioned, verifiable signatures
- **Attributing** code contributions to specific agent configurations
- **Tracking** resource consumption (tokens, compute) per agent per session
- **Auditing** the complete provenance chain from prompt to production

**Key Principle**: APS extends (not replaces) the Agent Skills open standard (agentskills.io) by adding provenance and attribution metadata.
[!FIXED!]

---

=== AGENT IDENTITY ===
<!-- AI:IDENTITY:START -->

### Agent Identifier (AID) Format

Every agent MUST have a unique identifier:

```
{provider}:{kernel}@{version}+{skills-hash}#{config-hash}
```

**Components:**

| Component | Required | Format | Description |
|-----------|----------|--------|-------------|
| `provider` | Yes | lowercase alphanumeric + hyphens | Organization providing the base model (e.g., anthropic, openai, local) |
| `kernel` | Yes | lowercase alphanumeric + hyphens | Orchestration framework (e.g., claude-code, langchain, custom) |
| `version` | Yes | semver (MAJOR.MINOR.PATCH) | Version of the agent configuration |
| `skills-hash` | Yes | 8-char hex | Truncated SHA-256 of loaded skill names + versions |
| `config-hash` | Yes | 8-char hex | Truncated SHA-256 of runtime configuration |

**Examples:**
```
anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2
openai:gpt4-coder@1.2.3+sk0000#f8e7d6c5
local:custom-reviewer@0.1.0+sk1234#12345678
```

### Version Numbering

Agent versions follow semantic versioning:

| Bump | Trigger | Examples |
|------|---------|----------|
| **MAJOR** | Base model change, breaking prompt changes | Claude 3 → Claude 4, complete prompt rewrite |
| **MINOR** | New skills/tools, significant prompt additions | Added security review skill, new MCP server |
| **PATCH** | Parameter tuning, minor prompt fixes | Temperature adjustment, typo fixes |

### Configuration Hash

The config-hash MUST be deterministically generated from:

```yaml
# Required fields for hash calculation
model: "claude-sonnet-4-5-20250929"      # Exact model identifier
system_prompt_hash: "sha256:abc123..."   # Hash of system prompt (NOT the prompt itself)
temperature: 0.7                          # Generation temperature
max_tokens: 4096                          # Maximum output tokens
tools: ["filesystem", "github"]           # Available tool names
kernel: "claude-code@1.5.0"               # Orchestration framework
```

**Privacy Rule**: NEVER include API keys, full prompt text, or PII in configuration. Use hashes for sensitive data.

<!-- AI:IDENTITY:END -->

---

=== GIT TRAILERS ===
<!-- AI:TRAILERS:START -->

### Required Trailers

These trailers MUST be present on any AI-assisted commit:

```
AI-Agent: {agent-identifier}
AI-Human-Reviewed: true|false
```

**Example:**
```
AI-Agent: anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2
AI-Human-Reviewed: true
```

### Recommended Trailers

These trailers SHOULD be included when information is available:

```
AI-Model: claude-sonnet-4-5-20250929
AI-Kernel: claude-code@1.5.0
AI-Session: sess_abc123def456
AI-Skills: code-generator@2.1.0, security-check@1.5.0
AI-Tokens-In: 12450
AI-Tokens-Out: 3280
AI-Contribution: generate|refactor|review|fix|document|test|collaborate
```

### Multi-Agent Attribution

For workflows involving multiple agents or subagents:

```
AI-Agent: anthropic:coder@1.0.0+sk123#abc12345
AI-Subagents: explore#abc123 (research), test-runner#def456 (validation)
AI-Contribution-Graph: main→explore→security-check→test-runner
```

### Complete Example

```
feat(auth): implement OAuth2 PKCE flow

Implements secure OAuth2 authorization code flow with PKCE for mobile
clients. Includes token refresh logic and secure storage integration.

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

<!-- AI:TRAILERS:END -->

---

=== AGENT REGISTRY ===
<!-- AI:REGISTRY:START -->

### Purpose

The agent registry (`.aps/registry.yaml`) serves as the source of truth for all agents authorized to contribute to a project.

### Registry Structure

```yaml
aps_version: "1.0.0"
project:
  name: "my-project"
  repository: "https://github.com/org/my-project"

agents:
  primary-coder:
    id: "anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2"
    registered: "2026-01-19T10:00:00Z"
    registered_by: "alice@example.com"
    status: "active"  # active | deprecated | suspended | retired
    description: "Primary code generation agent"
    
    config:
      model: "claude-sonnet-4-5-20250929"
      kernel: "claude-code@1.5.0"
      temperature: 0.7
      max_tokens: 8192
      
      system_prompt:
        version: "2.1.0"
        hash: "sha256:abc123..."
      
      tools:
        - name: "filesystem"
          version: "1.0.0"
        - name: "github"
          version: "2.1.0"
    
    permissions:
      allowed_paths: ["src/**", "tests/**"]
      denied_paths: [".aps/**", "secrets/**"]
      require_human_review: true

policies:
  require_human_review: true
  max_consecutive_ai_commits: 10
  allowed_providers: ["anthropic", "openai", "local"]
```

<!-- AI:REGISTRY:END -->

---

=== SESSION TRACKING ===
<!-- AI:SESSIONS:START -->

### Purpose

Sessions group related agent activity for cost tracking, debugging, and audit trails.

### Session Log Format

```yaml
session_id: "sess_abc123def456"
agent_id: "anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2"

started: "2026-01-19T09:00:00Z"
ended: "2026-01-19T11:30:00Z"
status: "completed"  # active | completed | failed | cancelled

task:
  description: "Implement user authentication module"
  issue_ref: "#142"
  branch: "feature/auth"

usage:
  input_tokens: 145230
  output_tokens: 52847
  total_tokens: 198077

cost:
  total_cost_usd: 1.23

interactions:
  - timestamp: "2026-01-19T09:05:00Z"
    type: "generate"
    input_tokens: 3200
    output_tokens: 1850
    files_modified: ["src/auth/oauth.ts"]
    commit: "abc1234"
```

<!-- AI:SESSIONS:END -->

---

=== ADOPTION TIERS ===
<!-- AI:TIERS:START -->

APS supports incremental adoption:

| Tier | Requirements | Value |
|------|--------------|-------|
| **Bronze** | `AI-Agent` + `AI-Human-Reviewed` trailers | Basic attribution, audit trail |
| **Silver** | Bronze + Registry + Token tracking | Provenance, cost management |
| **Gold** | Silver + Session logging + Multi-agent support | Complete audit, analytics |
| **Platinum** | Gold + Integrity hashes + GPG signing | Cryptographic verification |

**Recommendation**: Start at Bronze, progress as needs grow.

<!-- AI:TIERS:END -->

---

=== ALIGNMENT WITH AGENT SKILLS ===
<!-- AI:ALIGNMENT:START -->

### Agent Skills Standard

APS aligns with the [Agent Skills open standard](https://agentskills.io) (Agentic AI Foundation):

- **Skills versioning**: Use Agent Skills `metadata.version` field
- **Skills metadata**: Extend with `metadata.aps_*` fields for provenance
- **Cross-platform**: Skills portable = provenance should be too

### Extending Agent Skills Metadata

```yaml
---
name: code-generator
description: Generates code following project standards
metadata:
  author: my-org
  version: "2.1.0"
  aps_skill_hash: "a7b3c9d2"
  aps_requires_review: true
---
```

<!-- AI:ALIGNMENT:END -->

---

=== PRIVACY & SECURITY ===
<!-- AI:PRIVACY:START -->

### Privacy Rules

**NEVER include in APS data:**
- API keys or tokens
- Full prompt text (if proprietary)
- User PII
- Credentials of any kind
- Internal URLs or endpoints

**ALWAYS hash or reference:**
- System prompts → store version + hash
- User inputs → aggregate statistics only
- Configuration → compute hash, store separately if sensitive

### Security Considerations

- Registry changes require security team approval (use CODEOWNERS)
- Validate registry in CI on every PR
- Audit for unexpected agent additions
- Use GPG signing for high-security environments

<!-- AI:PRIVACY:END -->

---

=== IMPLEMENTATION ===
<!-- AI:IMPLEMENTATION:START -->

### Quick Start

1. **Initialize APS** (if using Codebook bootstrap):
   ```bash
   bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --with-aps
   ```

2. **Register your first agent** in `.aps/registry.yaml`

3. **Set environment variables** before committing:
   ```bash
   export APS_AGENT_ID="anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2"
   export APS_HUMAN_REVIEWED="true"
   export APS_MODEL="claude-sonnet-4-5-20250929"
   export APS_SESSION="sess_feature_001"
   ```

4. **Commit** - Git hooks will automatically add trailers

5. **Verify** trailers were added:
   ```bash
   git log -1 --format='%(trailers)'
   ```

### Git Hook Integration

Install prepare-commit-msg hook to automatically add trailers from environment variables. See `templates/aps/git-hooks/` for examples.

### CI Validation

Add APS verification to your CI pipeline. See `templates/aps/github-actions/aps-verify.yml` for GitHub Actions example.

<!-- AI:IMPLEMENTATION:END -->

---

=== REFERENCES ===
<!-- AI:REFERENCES:START -->

### Related Standards

- @ref(CB-STD-COMMITS-001) - Commit message format
- @ref(CB-SKILL-GITFLOW-001) - Git workflow procedures

### External Standards

- [Agent Skills Standard](https://agentskills.io) - Open standard for AI agent capabilities
- [Conventional Commits](https://www.conventionalcommits.org/) - Commit message format
- [Git Trailers](https://git-scm.com/docs/git-interpret-trailers) - Native Git metadata format

### Guides

- See `guides/aps-adoption.md` for step-by-step adoption guide
- See `templates/aps/` for implementation templates

<!-- AI:REFERENCES:END -->
