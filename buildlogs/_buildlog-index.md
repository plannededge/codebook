---
document_name: "_buildlog-index.md"
location: "buildlogs/_buildlog-index.md"
codebook_id: "CB-BUILD-INDEX"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "index"
purpose: "Registry of all buildlogs and guide for using the buildlog system"
category: "buildlogs"
status: "active"
ai_parser_instructions: |
  This is the buildlog registry. Buildlogs are MANDATORY.
  Weekly logs cover Monday-Sunday.
  Use standardized tags for all entries.
  Pre-flight checklist fails without current buildlog.
---

# Buildlog Registry

[!FIXED!]
## About Buildlogs

Buildlogs are **MANDATORY weekly development logs** that capture:
- Micro-decisions made during development
- Issues encountered and how they were resolved
- Gaps identified for future addressing
- Opportunities noticed for improvement
- All commits with context

### Why Buildlogs Matter

Without buildlogs:
- Context is lost between sessions
- Same issues get re-solved repeatedly
- Decisions lack documented rationale
- New team members have no history

**Pre-flight checklist FAILS without a current buildlog.**
[!FIXED!]

---

=== CURRENT BUILDLOG ===
<!-- AI:CURRENT:START -->

[?DYNAMIC?]
| Week | Period | Status | File |
|------|--------|--------|------|
| Week 03, 2026 | 2026-01-13 to 2026-01-19 | active | buildlogs/2026/week-03.buildlog.md |
[?DYNAMIC?]

<!-- AI:CURRENT:END -->

---

=== BUILDLOG ARCHIVE ===
<!-- AI:ARCHIVE:START -->

[?DYNAMIC?]
### 2026
| Week | Period | Status | File |
|------|--------|--------|------|
| Week 03 | 2026-01-13 to 2026-01-19 | active | buildlogs/2026/week-03.buildlog.md |
| Week 01 | 2025-12-30 to 2026-01-05 | archived | buildlogs/2026/week-01.buildlog.md |
[?DYNAMIC?]

<!-- AI:ARCHIVE:END -->

---

=== REQUIRED TAGS ===
<!-- AI:TAGS:START -->

All buildlog entries MUST use one of these tags:

| Tag | Purpose | Example |
|-----|---------|---------|
| `#micro-decision` | Implementation choices | "Chose React Query over SWR for caching" |
| `#commit` | Git commits | "feat(auth): add OAuth2 support" |
| `#issue-encountered` | Problems found | "CORS errors with new API endpoint" |
| `#resolution` | How issues were resolved | "Added proper CORS headers in backend" |
| `#gap-identified` | Missing docs/knowledge | "No documentation for error handling patterns" |
| `#opportunity` | Potential improvements | "Could extract common validation logic" |
| `#blocked` | Work stopped | "Waiting for API credentials" |
| `#unblocked` | Work resumed | "Received API credentials" |

<!-- AI:TAGS:END -->

---

=== ENTRY FORMAT ===
<!-- AI:FORMAT:START -->

Each entry follows this format:

```markdown
| Time | Tag | Entry | Related |
|------|-----|-------|---------|
| HH:MM | #tag | Description | CB-XXX-NNN or PR# or - |
```

### Examples

```markdown
| 09:30 | #micro-decision | Chose lodash.debounce over custom implementation | CB-STD-PATTERNS-001 |
| 11:45 | #commit | feat(auth): implement OAuth2 flow | PR #42 |
| 14:00 | #issue-encountered | Tests failing in CI but passing locally | - |
| 14:30 | #resolution | CI node version mismatch - updated to 18 | fixes #issue-14:00 |
```

<!-- AI:FORMAT:END -->

---

=== WEEKLY STRUCTURE ===
<!-- AI:WEEKLY:START -->

Each weekly buildlog includes:

1. **Header** with week info and YAML preamble
2. **Summary** with counts of entries by tag
3. **Daily Logs** (Monday through Sunday)
4. **Week Retrospective** (what went well, needs improvement)
5. **Unresolved Items** (carried to next week)

Template: `buildlogs/templates/weekly.buildlog.template.md`

<!-- AI:WEEKLY:END -->

---

=== SEARCHING BUILDLOGS ===
<!-- AI:SEARCH:START -->

### By Tag
Search for `#tag` to find all entries of that type.

### By Codebook ID
Search for `CB-XXX-NNN` to find all references to a document.

### By Date
Entries are prefixed with time (HH:MM) within dated sections.

### By Week
Files are named `week-{NN}.buildlog.md` within year folders.

<!-- AI:SEARCH:END -->

---

=== CREATING NEW BUILDLOGS ===
<!-- AI:CREATING:START -->

**New buildlog required every Monday.**

1. Copy template from `buildlogs/templates/weekly.buildlog.template.md`
2. Create as `buildlogs/{YEAR}/week-{NN}.buildlog.md`
3. Fill in week info and dates
4. Update CURRENT BUILDLOG section in this file
5. Move previous week to ARCHIVE section
6. Begin logging immediately

Week numbers follow ISO 8601 (Week 01 contains first Thursday of year).

<!-- AI:CREATING:END -->

---

=== MAINTENANCE ===
<!-- AI:MAINTENANCE:START -->

| Action | Frequency | Responsible |
|--------|-----------|-------------|
| Create new weekly log | Every Monday | Head Cook |
| Update this index | When creating new log | Head Cook |
| Review unresolved items | Weekly | Head Cook |
| Archive old buildlogs | Ongoing | Automatic |

<!-- AI:MAINTENANCE:END -->
