---
document_name: "governance-setup.md"
location: "guides/governance-setup.md"
codebook_id: "CB-GUIDE-GOV-SETUP-001"
version: "1.0.0"
date_created: "2026-01-31"
date_last_edited: "2026-01-31"
document_type: "guide"
purpose: "Explains how the Agentic Architecture Governance system works and how to configure it"
category: "guides"
status: "active"
ai_parser_instructions: |
  Use this guide to explain governance to new users.
---

# Guide: Setting Up Agentic Governance

## Overview

Codebook doesn't just "manage" code; it **enforces architecture**.

When you bootstrap Codebook, it installs an **Agentic Governance Framework** designed to prevent "architectural drift"—the tendency for AI agents to write sloppy code when left unchecked.

## How It Works

### 1. The "Project Sniffer" (Auto-Detection)
During setup, Codebook runs `@skill(architecture-discovery)`.
*   It looks at your `package.json`, `go.mod`, etc.
*   It detects your stack (e.g., "React + Node + Postgres").
*   It **auto-configures** `devdocs/architecture/master.md` with these findings.

### 2. The Master Architecture Document
Located at `devdocs/architecture/master.md`.
This is the **Source of Truth**. It defines:
*   **Current State**: What your project actually is (auto-filled).
*   **Directional State**: Where you want to go (your "North Star").

### 3. The Gatekeeper Skill
Every time you ask an agent to code, it runs `@skill(architectural-review)`.
This skill checks:
*   "Does this code match the patterns in `master.md`?"
*   "Is this adding new code when we could reuse existing code?"

---

## Configuration Steps

While Codebook auto-detects a lot, you define the **Direction**:

### Step 1: Verify Auto-Detection
Open `devdocs/architecture/master.md`.
Check the **Current State** section.
*   Did it catch your specific framework version?
*   Did it miss any obscure libraries?
*   *Action*: Correct any inaccuracies manually.

### Step 2: Define Your North Star
In `devdocs/architecture/master.md`, look at **Directional State**.
Codebook fills this with safe defaults (Robustness, Resilience), but you should customize it:
*   *Example*: "We want to move from CSS Modules to Tailwind."
*   *Example*: "We want to replace Redux with Zustand."

**Crucial**: If you write it down here, the agents will **enforce** it in every future PR.

### Step 3: Check Code Patterns
Open `standards/code-patterns.md`.
The discovery skill tries to inject relevant patterns (e.g., React Hooks rules).
*   Add any team-specific "Hard Rules" here.
*   *Example*: "Never use `any` type."

## Troubleshooting

### "The agent keeps creating duplicate components!"
*   **Cause**: The agent doesn't know what exists.
*   **Fix**: Update `devdocs/ui/components.md` (or run a component scan) so the agent sees the inventory.

### "The agent ignores my architecture!"
*   **Cause**: `master.md` might be stale or vague.
*   **Fix**: Make the rules in `master.md` explicitly "Forbidden".
    *   *Bad*: "Prefer not to use inline styles."
    *   *Good*: "Inline styles are FORBIDDEN."

## Summary
The Governance Framework is **active by default**. Your job is to simply keep the `master.md` file true to your vision.
