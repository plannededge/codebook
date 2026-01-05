---
document_name: "troubleshooting.md"
location: "guides/troubleshooting.md"
codebook_id: "CB-GUIDE-TROUBLESHOOT-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "guide"
purpose: "Common issues and solutions when working with codebook"
category: "guides"
status: "active"
ai_parser_instructions: |
  This guide helps troubleshoot common codebook issues.
  Use markers: === SECTION ===, [!FIXED!], [?DYNAMIC?].
  Reference using @ref(CB-GUIDE-TROUBLESHOOT-001).
---

# Codebook Troubleshooting Guide

[!FIXED!]
## Overview

This guide covers common issues encountered when using the codebook system and their solutions.
[!FIXED!]

---

=== INSTALLATION ISSUES ===
<!-- AI:INSTALL:START -->

### Bootstrap Script Fails

**Symptoms:**
- Script exits with error
- Directories not created
- Permission denied

**Solutions:**

1. **Check permissions**
   ```bash
   # Ensure you have write access
   ls -la .
   ```

2. **Check existing files**
   ```bash
   # Bootstrap won't overwrite by default
   # Use --update for existing installations
   bash init.sh --update
   ```

3. **Manual installation**
   ```bash
   # If curl fails, download and run locally
   git clone https://github.com/plannededge/codebook.git /tmp/codebook
   bash /tmp/codebook/bootstrap/init.sh
   ```

### Missing Directories After Install

**Symptoms:**
- Some directories exist but not others
- CLAUDE.md missing

**Solutions:**

1. **Run bootstrap again with --update**
   ```bash
   bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --update
   ```

2. **Check version file**
   ```bash
   cat .claude/codebook-version
   ```

<!-- AI:INSTALL:END -->

---

=== VALIDATION ISSUES ===
<!-- AI:VALIDATION:START -->

### Pre-flight Checklist Fails

**Symptoms:**
- AI agent reports missing files
- Checklist items show as incomplete

**Solutions:**

1. **Run project setup skill**
   - Use @skill(project-setup) to establish missing fundamentals

2. **Check specific missing items**
   - Missing `.gitignore`: Create one for your project type
   - Missing `README.md`: Create basic project documentation
   - Missing buildlog: Create current week's buildlog

### Broken Cross-References

**Symptoms:**
- @ref() links don't resolve
- Agent can't find referenced documents

**Solutions:**

1. **Verify codebook ID exists**
   ```bash
   grep -r "codebook_id:.*CB-XXX-NNN" --include="*.md"
   ```

2. **Check index files**
   - Each document should be registered in its category index
   - Run validation script to identify broken refs

3. **Update index if needed**
   - Add missing document to appropriate `_*-index.md`

<!-- AI:VALIDATION:END -->

---

=== AGENT ISSUES ===
<!-- AI:AGENT:START -->

### Agent Not Found

**Symptoms:**
- AI can't find agent definition
- @agent() reference fails

**Solutions:**

1. **Check agent exists**
   ```bash
   ls -la agentdocs/*.agent.md
   ```

2. **Verify agent is registered**
   - Check `agentdocs/_agent-index.md`
   - Ensure codebook_id matches

3. **Create from template if missing**
   - Use templates from `agentdocs/templates/`

### Agent Skills Missing

**Symptoms:**
- Agent can't perform expected tasks
- Skill references broken

**Solutions:**

1. **Check skill exists**
   ```bash
   ls -la .claude/skills/*.skill.md
   ```

2. **Verify skill registration**
   - Check `.claude/skills/_skill-index.md`

<!-- AI:AGENT:END -->

---

=== BUILDLOG ISSUES ===
<!-- AI:BUILDLOG:START -->

### Buildlog Not Found

**Symptoms:**
- Pre-flight warns about missing buildlog
- Context from previous sessions lost

**Solutions:**

1. **Create current week's buildlog**
   ```bash
   # Get current week number
   date +%V

   # Create buildlog (replace NN with week number)
   mkdir -p buildlogs/2026
   cp buildlogs/templates/weekly.buildlog.template.md buildlogs/2026/week-NN.buildlog.md
   ```

2. **Update buildlog index**
   - Add entry to `buildlogs/_buildlog-index.md`

### Buildlog Format Issues

**Symptoms:**
- Entries not parsing correctly
- Tags not recognized

**Solutions:**

1. **Use correct table format**
   ```markdown
   | Time | Tag | Entry | Related |
   |------|-----|-------|---------|
   | HH:MM | #tag | Description | CB-XXX-NNN |
   ```

2. **Valid tags**
   - `#micro-decision`, `#commit`, `#issue-encountered`
   - `#resolution`, `#gap-identified`, `#opportunity`

<!-- AI:BUILDLOG:END -->

---

=== YAML PREAMBLE ISSUES ===
<!-- AI:PREAMBLE:START -->

### Invalid Preamble

**Symptoms:**
- Document not recognized as codebook document
- AI can't parse metadata

**Solutions:**

1. **Check preamble format**
   - Must start with `---` on line 1
   - Must end with `---` before content
   - All required fields present

2. **Required fields**
   ```yaml
   ---
   document_name: ""
   location: ""
   codebook_id: ""
   version: ""
   date_created: ""
   date_last_edited: ""
   document_type: ""
   purpose: ""
   ai_parser_instructions: |
     Instructions here
   ---
   ```

3. **Validate YAML syntax**
   - Watch for missing quotes around strings with colons
   - Ensure proper indentation

<!-- AI:PREAMBLE:END -->

---

=== TEST SCRIPT ISSUES ===
<!-- AI:TESTING:START -->

### Validation Script Fails

**Symptoms:**
- `tests/validate-codebook.sh` exits with errors
- Tests don't complete

**Solutions:**

1. **Check script is executable**
   ```bash
   chmod +x tests/validate-codebook.sh
   ```

2. **Run from codebook root**
   ```bash
   cd /path/to/codebook
   ./tests/validate-codebook.sh
   ```

3. **Check for bash 4+ features**
   - Script requires bash 4.0 or later
   - On macOS, install newer bash: `brew install bash`

### False Positives

**Symptoms:**
- Test reports broken refs that exist
- Template placeholders flagged

**Solutions:**

1. **Placeholder IDs are expected**
   - `CB-XXX-NNN` format is intentionally placeholder
   - Templates use these for examples

2. **Update test expectations if needed**
   - Some tests may need adjustment for custom setups

<!-- AI:TESTING:END -->

---

=== GETTING HELP ===
<!-- AI:HELP:START -->

### Still Stuck?

1. **Check the documentation**
   - README.md for overview
   - CLAUDE.md for AI agent instructions

2. **Run validation**
   ```bash
   ./tests/validate-codebook.sh --verbose
   ```

3. **Report issues**
   - https://github.com/plannededge/codebook/issues

<!-- AI:HELP:END -->

---

=== RELATED DOCUMENTS ===
<!-- AI:RELATED:START -->

| Document | Purpose |
|----------|---------|
| @ref(CB-GUIDE-QUICKSTART-001) | Getting started guide |
| @ref(CB-GUIDE-SETUP-001) | Project setup guide |
| @ref(CB-SKILL-SETUP-001) | Setup skill |

<!-- AI:RELATED:END -->
