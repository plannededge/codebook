---
document_name: "aps-adoption.md"
location: "guides/aps-adoption.md"
codebook_id: "CB-GUIDE-APS-001"
version: "1.0.0"
date_created: "2026-01-19"
date_last_edited: "2026-01-19"
document_type: "guide"
purpose: "Step-by-step guide for adopting the Agentic Provenance Standard (APS)"
category: "guides"
related_docs:
  - "standards/agentic-provenance.md"
  - "templates/aps/registry.template.yaml"
status: "active"
ai_parser_instructions: |
  This is a practical adoption guide for APS.
  Section markers: === SECTION ===
---

# APS Adoption Guide

## Overview

This guide walks you through adopting the Agentic Provenance Standard (APS) in your project. APS provides AI attribution, versioning, and auditability for AI-assisted software development.

**Time to Bronze tier**: 15-30 minutes  
**Prerequisites**: Git repository, basic command-line knowledge

---

## Adoption Tiers

APS supports incremental adoption. Choose your tier based on your needs:

| Tier | Requirements | Time | Value |
|------|--------------|------|-------|
| **Bronze** | AI-Agent + AI-Human-Reviewed trailers | 15 min | Basic attribution, audit trail |
| **Silver** | Bronze + Registry + Token tracking | 1 hour | Provenance, cost management |
| **Gold** | Silver + Session logging + Multi-agent | 2-4 hours | Complete audit, analytics |
| **Platinum** | Gold + Integrity hashes + GPG signing | 4+ hours | Cryptographic verification |

**Recommendation**: Start with Bronze, progress as needs grow.

---

## Bronze Tier: Basic Attribution

### Step 1: Initialize APS

If using Codebook bootstrap:

```bash
bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --with-aps
```

Or manually:

```bash
# Create directory structure
mkdir -p .aps/{agents,prompts,sessions,reports}

# Copy registry template
cp templates/aps/registry.template.yaml .aps/registry.yaml

# Install git hooks
cp templates/aps/git-hooks/prepare-commit-msg .git/hooks/
cp templates/aps/git-hooks/commit-msg .git/hooks/
chmod +x .git/hooks/prepare-commit-msg .git/hooks/commit-msg
```

### Step 2: Register Your First Agent

Edit `.aps/registry.yaml`:

```yaml
agents:
  primary-coder:
    id: "anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2"
    registered: "2026-01-19T10:00:00Z"
    registered_by: "your-email@example.com"
    status: "active"
    description: "Primary code generation agent"
    
    config:
      model: "claude-sonnet-4-5-20250929"
      kernel: "claude-code@1.5.0"
      temperature: 0.7
      
    permissions:
      require_human_review: true
```

**How to determine your agent ID:**

1. **Provider**: `anthropic`, `openai`, or `local`
2. **Kernel**: `claude-code`, `langchain`, `custom`, etc.
3. **Version**: Your agent configuration version (start with `1.0.0`)
4. **Skills hash**: Hash of loaded skills (use `sk0000` for now, calculate later)
5. **Config hash**: Hash of configuration (use `cfg0000` for now, calculate later)

Example: `anthropic:claude-code@1.0.0+sk0000#cfg0000`

### Step 3: Make Your First AI-Attributed Commit

Set environment variables before committing:

```bash
# Required
export APS_AGENT_ID="anthropic:claude-code@1.0.0+sk0000#cfg0000"
export APS_HUMAN_REVIEWED="true"

# Recommended
export APS_MODEL="claude-sonnet-4-5-20250929"
export APS_CONTRIBUTION="generate"
```

Make your commit:

```bash
git add .
git commit -m "feat(auth): implement OAuth2 flow

Implements secure OAuth2 authorization code flow."
```

Verify trailers were added:

```bash
git log -1 --format='%(trailers)'
```

Expected output:
```
AI-Agent: anthropic:claude-code@1.0.0+sk0000#cfg0000
AI-Model: claude-sonnet-4-5-20250929
AI-Contribution: generate
AI-Human-Reviewed: true
```

### Step 4: Add to CI (Optional)

Copy the GitHub Actions workflow:

```bash
mkdir -p .github/workflows
cp templates/aps/github-actions/aps-verify.yml .github/workflows/
```

This validates APS compliance on every PR.

**Bronze Tier Complete!** ✅

You now have:
- Basic AI attribution in commits
- Agent registry tracking
- Git hooks for automation
- Optional CI validation

---

## Silver Tier: Cost Management

### Step 5: Enable Token Tracking

Update your agent wrapper to track tokens:

```python
# Example: Python wrapper
import os
import yaml
from datetime import datetime

class APSTokenTracker:
    def __init__(self, agent_id: str):
        self.agent_id = agent_id
        self.session_id = f"sess_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        self.total_input = 0
        self.total_output = 0
    
    def track_interaction(self, input_tokens: int, output_tokens: int):
        self.total_input += input_tokens
        self.total_output += output_tokens
        
        # Set env vars for next commit
        os.environ['APS_TOKENS_IN'] = str(self.total_input)
        os.environ['APS_TOKENS_OUT'] = str(self.total_output)
        os.environ['APS_SESSION'] = self.session_id
```

### Step 6: Create Session Logs

After completing a task, create a session log:

```bash
# Copy template
cp templates/aps/session-log.template.yaml .aps/sessions/sess_feature_001.yaml
```

Edit with your session data:

```yaml
session_id: "sess_feature_001"
agent_id: "anthropic:claude-code@1.0.0+sk0000#cfg0000"
started: "2026-01-19T09:00:00Z"
ended: "2026-01-19T11:30:00Z"
status: "completed"

task:
  description: "Implement user authentication"
  issue_ref: "#142"

usage:
  input_tokens: 145230
  output_tokens: 52847
  total_tokens: 198077

cost:
  total_cost_usd: 1.23
```

### Step 7: Generate Reports

Create monthly cost reports:

```bash
# Manual aggregation (until aps CLI exists)
grep -r "total_cost_usd" .aps/sessions/ | awk '{sum+=$2} END {print "Total: $"sum}'
```

**Silver Tier Complete!** ✅

You now have:
- Token consumption tracking
- Session-based cost attribution
- Monthly cost reporting

---

## Gold Tier: Complete Audit Trail

### Step 8: Multi-Agent Support

Register additional agents in `.aps/registry.yaml`:

```yaml
agents:
  primary-coder:
    # ... existing config ...
  
  code-reviewer:
    id: "anthropic:reviewer@1.0.0+sk0000#cfg0000"
    status: "active"
    description: "Code review and security analysis"
    config:
      model: "claude-sonnet-4-5-20250929"
      temperature: 0.3  # Lower for consistent reviews
```

### Step 9: Track Multi-Agent Workflows

When multiple agents contribute:

```bash
# Primary agent generates
export APS_AGENT_ID="anthropic:coder@1.0.0+sk0000#cfg0000"
export APS_HUMAN_REVIEWED="true"
git commit -m "feat(api): initial implementation"

# Reviewer agent suggests changes
export APS_AGENT_ID="anthropic:reviewer@1.0.0+sk0000#cfg0000"
export APS_SUBAGENTS="coder#cfg0000 (generate)"
export APS_CONTRIBUTION_GRAPH="reviewer→coder"
git commit -m "refactor(api): apply security review feedback"
```

### Step 10: Link Sessions

In session logs, link related sessions:

```yaml
session_id: "sess_review_001"
agent_id: "anthropic:reviewer@1.0.0+sk0000#cfg0000"
linked_sessions:
  - session_id: "sess_coder_001"
    relationship: "reviewed"
```

**Gold Tier Complete!** ✅

You now have:
- Multi-agent collaboration tracking
- Session linking for complex workflows
- Complete audit trail

---

## Platinum Tier: Cryptographic Verification

### Step 11: Calculate Configuration Hashes

Create a script to calculate deterministic config hashes:

```python
import hashlib
import json

def generate_config_hash(config: dict) -> str:
    canonical = json.dumps(config, sort_keys=True, separators=(',', ':'))
    full_hash = hashlib.sha256(canonical.encode('utf-8')).hexdigest()
    return full_hash[:8]

config = {
    "model": "claude-sonnet-4-5-20250929",
    "temperature": 0.7,
    "max_tokens": 8192,
    # ... other config
}

print(f"Config hash: {generate_config_hash(config)}")
```

Update your agent IDs with real hashes.

### Step 12: Enable GPG Signing

Sign commits with GPG:

```bash
# Configure git to sign commits
git config --global commit.gpgsign true
git config --global user.signingkey YOUR_GPG_KEY_ID

# Commits now have both APS trailers AND GPG signature
git commit -S -m "feat(auth): implement OAuth2"
```

### Step 13: Add Integrity Hashes

For high-security commits, add integrity hash trailer:

```bash
# Calculate integrity hash (includes full context)
export APS_INTEGRITY="sha256:abc123..."

git commit -m "feat(security): implement encryption"
```

**Platinum Tier Complete!** ✅

You now have:
- Cryptographic verification of agent identity
- GPG-signed commits
- Integrity hashes for full context verification

---

## Migration Path for Existing Projects

### Scenario 1: No AI Attribution Yet

1. Start with Bronze tier
2. Add APS trailers to new commits only
3. Don't retroactively attribute old commits
4. Document in registry when APS adoption started

### Scenario 2: Informal AI Attribution

1. Audit existing commits for AI patterns
2. Create registry entries for identified agents
3. Mark them as `status: historical`
4. Start formal APS attribution going forward

### Scenario 3: Custom Attribution System

1. Map your system to APS format
2. Create migration script for trailers
3. Update registry with existing agents
4. Gradually transition to APS format

---

## Best Practices

### Do's

✅ Always set `AI-Human-Reviewed: true` after reviewing  
✅ Register agents before first use  
✅ Update registry when agent config changes  
✅ Track sessions for cost management  
✅ Link related sessions for complex workflows  
✅ Review and update registry quarterly  

### Don'ts

❌ Don't commit without human review  
❌ Don't include API keys in registry  
❌ Don't embed full prompts (use hashes)  
❌ Don't skip trailers for "small" AI changes  
❌ Don't use same agent ID for different configs  
❌ Don't forget to update session logs  

---

## Troubleshooting

### Trailers Not Added Automatically

Check git hooks are installed and executable:

```bash
ls -la .git/hooks/prepare-commit-msg
ls -la .git/hooks/commit-msg
```

Reinstall if needed:

```bash
cp templates/aps/git-hooks/* .git/hooks/
chmod +x .git/hooks/prepare-commit-msg .git/hooks/commit-msg
```

### Agent Not Found in Registry

Error: "Agent 'X' not found in .aps/registry.yaml"

Solution: Add agent to registry before committing:

```yaml
agents:
  your-agent:
    id: "provider:kernel@version+skills#config"
    status: "active"
    # ... config ...
```

### Token Tracking Not Working

Ensure environment variables are set before commit:

```bash
echo $APS_TOKENS_IN
echo $APS_TOKENS_OUT
```

If empty, your tracking wrapper isn't setting them.

---

## Next Steps

- Read full specification: `standards/agentic-provenance.md`
- Explore templates: `templates/aps/`
- Join community discussions on APS adoption
- Contribute improvements to the standard

---

## External Resources

- [Agent Skills Standard](https://agentskills.io) - Open standard for AI capabilities
- [Conventional Commits](https://www.conventionalcommits.org/) - Commit message format
- [Git Trailers](https://git-scm.com/docs/git-interpret-trailers) - Native Git metadata

---

**Questions?** See `standards/agentic-provenance.md` for complete specification.
