---
document_name: "git-flow.md"
location: "workflows/git-flow.md"
codebook_id: "CB-WF-GITFLOW-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "workflow"
purpose: "End-to-end workflow for Git branching, committing, and merging"
category: "workflows"
subcategory: "version-control"
related_docs:
  - ".claude/skills/git-workflow.skill.md"
  - "standards/commit-messages.md"
  - "templates/github/pr.template.md"
status: "active"
ai_parser_instructions: |
  This workflow describes the overall Git process.
  For detailed procedures, reference @skill(git-workflow).
  Section markers: === SECTION ===
---

# Git Flow Workflow

[!FIXED!]
## Purpose

This document describes the end-to-end Git workflow for the project. It covers branching strategy, commit conventions, and merge processes.

**Related Skill:** @skill(git-workflow) for detailed procedures
[!FIXED!]

---

=== BRANCHING STRATEGY ===
<!-- AI:BRANCHING:START -->

### Main Branches

| Branch | Purpose | Protected |
|--------|---------|-----------|
| `main` | Production-ready code | Yes |
| `develop` | Integration branch (optional) | Yes |

### Feature Branches

```
<type>/<description>

Types:
- feature/ : New features
- bugfix/  : Bug fixes
- hotfix/  : Urgent production fixes
- refactor/: Code refactoring
- docs/    : Documentation only
- test/    : Test additions
- chore/   : Maintenance tasks
```

### Branch Lifecycle

```
main ─────────────────────────────────────────►
       │                    ▲
       │                    │ merge
       ▼                    │
feature/xyz ───commit───commit───PR──►
```

<!-- AI:BRANCHING:END -->

---

=== WORKFLOW OVERVIEW ===
<!-- AI:OVERVIEW:START -->

### 1. Start Work

```
1. Ensure main is up to date
2. Create feature branch
3. Make changes
4. Commit with conventional format
5. Push to remote
```

### 2. Review Process

```
1. Create pull request
2. Request reviewers
3. Address feedback
4. Get approval
```

### 3. Merge

```
1. Ensure CI passes
2. Resolve conflicts if any
3. Squash and merge (preferred)
4. Delete feature branch
```

### 4. Post-Merge

```
1. Update local main
2. Delete local feature branch
3. Update buildlog
```

<!-- AI:OVERVIEW:END -->

---

=== COMMIT CONVENTIONS ===
<!-- AI:COMMITS:START -->

### Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types

| Type | Purpose | Example |
|------|---------|---------|
| `feat` | New feature | `feat(auth): add OAuth login` |
| `fix` | Bug fix | `fix(api): handle null response` |
| `docs` | Documentation | `docs(readme): add setup guide` |
| `style` | Formatting | `style: fix indentation` |
| `refactor` | Restructure | `refactor(utils): extract helper` |
| `test` | Tests | `test(auth): add login tests` |
| `chore` | Maintenance | `chore: update dependencies` |
| `perf` | Performance | `perf(query): optimize lookup` |

**Reference:** @ref(CB-STD-COMMITS-001) for full standard

<!-- AI:COMMITS:END -->

---

=== PULL REQUEST PROCESS ===
<!-- AI:PR:START -->

### Creating PR

1. **Push branch to remote**
2. **Create PR using template** (@ref(CB-TPL-PR-001))
3. **Add reviewers**
4. **Apply labels** (@ref(CB-TPL-LABELS-001))

### PR Requirements

- [ ] Tests pass
- [ ] Linter passes
- [ ] At least one approval
- [ ] No merge conflicts
- [ ] Documentation updated (if needed)

### Merge Strategy

| Strategy | When |
|----------|------|
| Squash and Merge | Feature branches (clean history) |
| Rebase and Merge | Linear history preference |
| Merge Commit | Preserve branch history |

**Preferred:** Squash and Merge for feature branches

<!-- AI:PR:END -->

---

=== CONFLICT RESOLUTION ===
<!-- AI:CONFLICTS:START -->

### When Conflicts Occur

1. **Rebase against target**
   ```bash
   git checkout feature/xyz
   git fetch origin
   git rebase origin/main
   ```

2. **Resolve conflicts**
   - Open conflicting files
   - Resolve markers
   - Test resolution

3. **Continue rebase**
   ```bash
   git add <resolved-files>
   git rebase --continue
   ```

4. **Force push**
   ```bash
   git push --force-with-lease origin feature/xyz
   ```

### Prevention

- Keep branches short-lived
- Rebase frequently against main
- Communicate about shared files

<!-- AI:CONFLICTS:END -->

---

=== EMERGENCY PROCEDURES ===
<!-- AI:EMERGENCY:START -->

### Hotfix Process

For urgent production fixes:

1. Branch from `main` directly
   ```bash
   git checkout main
   git checkout -b hotfix/critical-bug
   ```

2. Make minimal fix
3. Fast-track review
4. Merge directly to `main`
5. Update `develop` if used

### Reverting

If a merge introduces issues:

```bash
# Revert the merge commit
git revert -m 1 <merge-commit-hash>
git push origin main
```

Log in buildlog with `#resolution`.

<!-- AI:EMERGENCY:END -->

---

=== RELATED DOCUMENTS ===
<!-- AI:RELATED:START -->

| Document | Codebook ID | Relationship |
|----------|-------------|--------------|
| git-workflow.skill.md | CB-SKILL-GITFLOW-001 | Detailed procedures |
| commit-messages.md | CB-STD-COMMITS-001 | Commit format |
| pr.template.md | CB-TPL-PR-001 | PR template |
| labels.md | CB-TPL-LABELS-001 | Label conventions |

<!-- AI:RELATED:END -->
