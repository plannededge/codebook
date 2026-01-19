# APS CLI Reference

This document specifies the command-line interface for the `aps` tool (future implementation).

## Overview

The `aps` CLI provides commands for managing agent registries, sessions, and provenance tracking.

## Installation

```bash
# Future: Install via package manager
npm install -g @codebook/aps-cli
# or
pip install aps-cli
# or
cargo install aps-cli
```

## Commands

### Initialization

```bash
# Initialize APS in a project
aps init [--tier bronze|silver|gold|platinum]

# Creates:
# - .aps/ directory structure
# - .aps/registry.yaml
# - Git hooks (if --hooks flag)
```

### Agent Management

```bash
# Register a new agent
aps agent register \
  --provider anthropic \
  --kernel claude-code \
  --version 1.5.0 \
  --alias primary-coder

# List registered agents
aps agent list [--status active|deprecated|all]

# Show agent details
aps agent show <alias>

# Deprecate an agent
aps agent deprecate <alias> --reason "Replaced by v2"

# Verify agent configuration hash
aps agent verify <alias>

# Update agent configuration
aps agent update <alias> --config config.yaml
```

### Session Management

```bash
# Start a new session
aps session start [--agent <alias>] [--task "description"]

# End current session
aps session end

# Show current session status
aps session status

# List all sessions
aps session list [--agent <alias>] [--period week|month]

# Show session details
aps session show <session-id>
```

### Commit Helpers

```bash
# Commit with APS trailers (wrapper around git commit)
aps commit -m "message" \
  [--agent <alias>] \
  [--reviewed] \
  [--session <id>]

# Add APS trailers to last commit
aps amend [--agent <alias>] [--reviewed]

# Set environment variables for next commit
aps env set \
  --agent <alias> \
  --reviewed \
  --session <id>

# Clear APS environment variables
aps env clear
```

### Reporting

```bash
# Generate usage report
aps report [--period day|week|month] [--agent <alias>]

# Show statistics
aps stats [--format json|table|csv]

# Cost analysis
aps cost [--period week|month] [--breakdown by-agent|by-session]

# Export session data
aps export --format json --output provenance.json
```

### Validation

```bash
# Verify commits in range
aps verify [<commit-range>]

# Validate registry and configuration
aps lint

# Check compliance level
aps compliance [--tier bronze|silver|gold|platinum]
```

### Configuration

```bash
# Show current configuration
aps config show

# Set configuration value
aps config set <key> <value>

# Initialize from template
aps config init --template <path>
```

## Environment Variables

```bash
# Agent identification
APS_AGENT_ID="anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2"

# Required trailers
APS_HUMAN_REVIEWED="true"

# Optional trailers
APS_MODEL="claude-sonnet-4-5-20250929"
APS_KERNEL="claude-code@1.5.0"
APS_SESSION="sess_feature_001"
APS_SKILLS="code-generator@2.1.0, security-check@1.5.0"
APS_CONTRIBUTION="generate"
APS_TOKENS_IN="12450"
APS_TOKENS_OUT="3280"

# Multi-agent
APS_SUBAGENTS="explore#abc123 (research), test-runner#def456 (validation)"
APS_CONTRIBUTION_GRAPH="main→explore→security-check→test-runner"
```

## Configuration File

Location: `.aps/config.yaml`

```yaml
# APS CLI Configuration
version: "1.0.0"

# Default agent alias
default_agent: "primary-coder"

# Compliance tier
tier: "bronze"  # bronze | silver | gold | platinum

# Session settings
session:
  auto_start: false
  auto_end: true
  track_tokens: true

# Commit settings
commit:
  require_session: false
  require_human_review: true
  auto_add_trailers: true

# Reporting
reporting:
  default_period: "week"
  default_format: "table"
  cost_tracking: true
```

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | General error |
| 2 | Validation error |
| 3 | Configuration error |
| 4 | Agent not found |
| 5 | Session error |

## Examples

### Basic Workflow

```bash
# Initialize APS
aps init --tier bronze

# Register agent
aps agent register \
  --provider anthropic \
  --kernel claude-code \
  --version 1.5.0 \
  --alias primary-coder

# Start session
aps session start --agent primary-coder --task "Implement auth"

# Make commits (trailers added automatically)
aps commit -m "feat(auth): add OAuth2 flow" --reviewed

# End session
aps session end

# Generate report
aps report --period week
```

### Advanced Workflow

```bash
# Set environment for multiple commits
aps env set --agent primary-coder --reviewed --session sess_auth_001

# Make multiple commits
git commit -m "feat(auth): add OAuth2 flow"
git commit -m "test(auth): add OAuth2 tests"
git commit -m "docs(auth): document OAuth2 setup"

# Clear environment
aps env clear

# Verify all commits
aps verify HEAD~3..HEAD

# Generate cost report
aps cost --period month --breakdown by-agent
```

## Future Enhancements

- Integration with ccusage for token tracking
- OpenTelemetry export support
- Digital signature verification (Platinum tier)
- Multi-repository support
- Team dashboards
- Cost budget alerts
