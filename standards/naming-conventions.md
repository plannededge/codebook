---
document_name: "naming-conventions.md"
location: "standards/naming-conventions.md"
codebook_id: "CB-STD-NAMING-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "standard"
purpose: "Naming conventions for code, files, and project artifacts"
category: "standards"
subcategory: "code-quality"
status: "active"
ai_parser_instructions: |
  This document defines naming standards.
  These are rules to follow, not procedures.
  Section markers: === SECTION ===
---

# Naming Conventions

[!FIXED!]
## Purpose

Consistent naming improves code readability, searchability, and maintainability. These conventions apply to all project artifacts.
[!FIXED!]

---

=== CODE NAMING ===
<!-- AI:CODE:START -->

### Variables

| Type | Convention | Example |
|------|------------|---------|
| Local variable | camelCase | `userName`, `totalCount` |
| Constant | UPPER_SNAKE | `MAX_RETRIES`, `API_URL` |
| Boolean | is/has/can prefix | `isActive`, `hasPermission` |
| Collection | Plural | `users`, `items` |
| Private | _prefix (optional) | `_internalState` |

### Functions

| Type | Convention | Example |
|------|------------|---------|
| General | camelCase verb | `calculateTotal()` |
| Boolean return | is/has/can prefix | `isValid()`, `hasAccess()` |
| Event handler | handle prefix | `handleClick()` |
| Getter | get prefix | `getUser()` |
| Setter | set prefix | `setUser()` |
| Async | Async suffix (optional) | `fetchDataAsync()` |

### Classes and Types

| Type | Convention | Example |
|------|------------|---------|
| Class | PascalCase | `UserService`, `PaymentProcessor` |
| Interface | IPascalCase or PascalCase | `IUserService` or `UserService` |
| Type alias | PascalCase | `UserData`, `ApiResponse` |
| Enum | PascalCase | `UserRole`, `OrderStatus` |
| Enum values | UPPER_SNAKE or PascalCase | `ADMIN`, `Admin` |

### Name Length Guidelines

| Scope | Length | Example |
|-------|--------|---------|
| Loop variable | 1-3 chars | `i`, `idx`, `key` |
| Lambda param | Short | `x`, `item` |
| Local variable | Short, clear | `user`, `count` |
| Function | Descriptive | `calculateOrderTotal` |
| Class | Very descriptive | `OrderPaymentProcessor` |
| Global/exported | Fully descriptive | `MAX_LOGIN_ATTEMPTS` |

<!-- AI:CODE:END -->

---

=== FILE NAMING ===
<!-- AI:FILES:START -->

### Code Files

| Type | Convention | Example |
|------|------------|---------|
| Component | PascalCase | `UserProfile.tsx` |
| Utility | camelCase | `dateUtils.ts` |
| Test | *.test.* or *.spec.* | `UserProfile.test.tsx` |
| Type definitions | *.types.* or *.d.* | `user.types.ts` |
| Config | lowercase | `eslint.config.js` |

### Documentation Files

| Type | Convention | Example |
|------|------------|---------|
| General doc | kebab-case | `architecture-overview.md` |
| Index | _*-index.md | `_agent-index.md` |
| Template | *.template.md | `pr.template.md` |
| Skill | *.skill.md | `git-workflow.skill.md` |
| Agent | *.agent.md | `head-cook.agent.md` |
| Buildlog | week-NN.buildlog.md | `week-01.buildlog.md` |

### Directory Naming

| Type | Convention | Example |
|------|------------|---------|
| General | kebab-case | `user-management/` |
| Components | PascalCase or kebab-case | `UserProfile/` or `user-profile/` |
| Feature | kebab-case | `auth-flow/` |

<!-- AI:FILES:END -->

---

=== PROJECT ARTIFACTS ===
<!-- AI:ARTIFACTS:START -->

### Git Branches

```
<type>/<description>

feature/add-user-auth
bugfix/fix-login-error
hotfix/critical-security-patch
refactor/improve-performance
docs/update-api-docs
```

### Commits

```
<type>(<scope>): <description>

feat(auth): add OAuth login
fix(api): handle null response
```

### Pull Requests

Same format as commits for title:
```
feat(auth): add OAuth login support
```

### Issues

Clear, specific titles:
```
[Bug] Login fails with special characters
[Feature] Add password reset functionality
```

<!-- AI:ARTIFACTS:END -->

---

=== CODEBOOK SPECIFIC ===
<!-- AI:CODEBOOK:START -->

### Codebook IDs

```
CB-{CATEGORY}-{SUBCATEGORY}-{SEQUENCE}

CB-MASTER-001     : CLAUDE.md
CB-AGENT-HEAD-001 : head-cook.agent.md
CB-SKILL-GIT-001  : git-workflow.skill.md
```

### Index Files

Always prefixed with underscore:
```
_agent-index.md
_skill-index.md
_devdocs-index.md
```

### Special Markers

| Marker | Purpose |
|--------|---------|
| `[!FIXED!]` | Immutable content |
| `[?DYNAMIC?]` | Requires updates |
| `<< placeholder >>` | Value to replace |
| `@ref(CB-XXX)` | Cross-reference |
| `@skill(name)` | Skill reference |
| `@agent(name)` | Agent reference |

<!-- AI:CODEBOOK:END -->

---

=== ANTI-PATTERNS ===
<!-- AI:ANTIPATTERNS:START -->

| Bad | Why | Good |
|-----|-----|------|
| `data` | Too vague | `userData`, `orderData` |
| `temp` | Not descriptive | `pendingOrder` |
| `x1`, `x2` | Meaningless | `start`, `end` |
| `doStuff()` | Not specific | `processPayment()` |
| `MyClass2` | Numbers in names | `ExtendedClass` |
| `XMLHTTPRequest` | Acronym handling | `XmlHttpRequest` |
| `strName` | Hungarian notation | `name` |

<!-- AI:ANTIPATTERNS:END -->

---

=== ENFORCEMENT ===
<!-- AI:ENFORCEMENT:START -->

### Automated

- ESLint/TSLint naming rules
- Prettier formatting
- Pre-commit hooks

### Code Review

Reviewers should check:
- [ ] Names reveal intent
- [ ] Consistent with conventions
- [ ] No abbreviations without context
- [ ] Boolean names are clear

<!-- AI:ENFORCEMENT:END -->
