---
document_name: "architecture-discovery.skill.md"
location: ".claude/skills/architecture-discovery.skill.md"
codebook_id: "CB-SKILL-DISCOVERY-001"
version: "1.0.0"
date_created: "2026-01-31"
date_last_edited: "2026-01-31"
document_type: "skill"
purpose: "Detects project technology stack and configures architecture documentation automatically"
category: "skills"
status: "active"
ai_parser_instructions: |
  Use this skill to auto-detect project stack.
  Trigger: @skill(architecture-discovery)
---

# SKILL: Architecture Discovery

## Trigger Conditions
- During `@skill(project-setup)` execution.
- When `devdocs/architecture/master.md` contains placeholders.
- Manually via `Run architecture discovery`.

## Protocol

### Phase 1: The Scan (Data Gathering)

Scan the repository root for these **Signature Files**:

| Technology | Signature Files |
|------------|-----------------|
| **Node/JS** | `package.json`, `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml` |
| **Python** | `requirements.txt`, `pyproject.toml`, `Pipfile` |
| **Go** | `go.mod` |
| **Rust** | `Cargo.toml` |
| **Docker** | `Dockerfile`, `docker-compose.yml` |
| **Infrastructure** | `.terraform`, `serverless.yml`, `fly.toml` |

### Phase 2: The Analysis (Stack Identification)

Based on findings in Phase 1, identify specific libraries/frameworks:

*If `package.json` exists, read `dependencies` and `devDependencies` to find:*
*   **Frontend**: React, Vue, Svelte, Angular, Next.js, Tailwind, CSS Modules, Styled Components.
*   **Backend**: Express, NestJS, Fastify, Apollo, Prisma, TypeORM, Mongoose.
*   **Testing**: Jest, Vitest, Cypress, Playwright.

*If `go.mod` exists, read for:*
*   Gin, Echo, Gorm, Sqlx.

*If `requirements.txt` exists, read for:*
*   Django, Flask, FastAPI, SQLAlchemy.

### Phase 3: The Patch (Configuration)

#### 3.1 Update Master Architecture
Target: `devdocs/architecture/master.md`

**Action**: Replace the "Tech Stack" section placeholders with actual findings.

*Example Replacement:*
```markdown
#### Tech Stack
- **Frontend**: React 18, TailwindCSS, Vite
- **Backend**: Node.js, Express, Prisma
- **Infrastructure**: Docker, AWS (detected via .aws)
```

#### 3.2 Update Code Patterns
Target: `standards/code-patterns.md`

**Action**: Append relevant pattern sections based on detected stack.

*If React detected:*
> Append "=== REACT PATTERNS ===" with Hook rules.

*If Go detected:*
> Append "=== GO PATTERNS ===" with error handling rules.

### Phase 4: Verification
1.  Check if `master.md` still contains text like `[e.g., ...]`
2.  If yes, prompt user for manual input.
3.  If no, log success to buildlog.

## Output
Report findings in this format:

```markdown
## 🕵️ Architecture Discovery Report

### Detected Stack
- **Language**: [e.g. TypeScript]
- **Frontend**: [e.g. React]
- **Backend**: [e.g. Express]
- **Database**: [e.g. PostgreSQL (via Prisma)]

### Configuration Actions
- ✅ Updated `master.md` Tech Stack
- ✅ Injected React patterns into `code-patterns.md`

### Gaps (User Input Needed)
- Could not detect specific Cloud Provider. Please manually update `master.md`.
```
