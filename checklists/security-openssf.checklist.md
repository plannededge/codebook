---
document_name: "security-openssf.checklist.md"
location: "checklists/security-openssf.checklist.md"
codebook_id: "CB-CHECK-OPENSSF-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "checklist"
purpose: "Security checklist for AI-generated code based on OpenSSF guidelines"
source: "https://best.openssf.org/Security-Focused-Guide-for-AI-Code-Assistant-Instructions"
category: "checklists"
status: "active"
tags:
  - "checklist"
  - "security"
  - "openssf"
  - "code-review"
ai_parser_instructions: |
  This checklist ensures AI-generated code follows security best practices.
  Use during code generation and code review.
  Items marked CRITICAL require immediate attention.
---

# OpenSSF Security Checklist

=== PURPOSE ===
<!-- AI:PURPOSE:START -->

This checklist ensures AI-generated code follows security best practices as defined by the OpenSSF (Open Source Security Foundation). Use this checklist:
- When generating new code
- During code review
- Before merging pull requests
- When auditing existing code

**Core Principle**: The developer (you) remains responsible for all code. AI-generated code doesn't replace established security processes like code reviews, testing, and static analysis.

<!-- AI:PURPOSE:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(security-lead) @ref(CB-AGENT-SECURITY-001) | Security reviews |
| @agent(qa-lead) @ref(CB-AGENT-QA-001) | Quality gates |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Code generation |
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | Code generation |
| All developers | Code review |

<!-- AI:USEDBY:END -->

---

=== CHECKLIST: INPUT VALIDATION ===
<!-- AI:CHECK:INPUT:START -->

### Input Validation & Sanitization

- [ ] **CRITICAL**: All external inputs validated for expected format
- [ ] **CRITICAL**: Input length limits enforced
- [ ] File uploads validated for type and size
- [ ] User-provided paths sanitized (prevent path traversal)
- [ ] Numeric inputs validated for range
- [ ] Special characters escaped/encoded appropriately
- [ ] Unicode and encoding handled safely

### Database Security

- [ ] **CRITICAL**: Parameterized queries used (no string concatenation)
- [ ] ORM queries use parameter binding
- [ ] Stored procedures use safe parameter handling
- [ ] No dynamic SQL from user input

### Output Encoding

- [ ] HTML output properly escaped
- [ ] JSON output encoded correctly
- [ ] URL parameters encoded
- [ ] Safe templating frameworks used

<!-- AI:CHECK:INPUT:END -->

---

=== CHECKLIST: SECRETS & AUTHENTICATION ===
<!-- AI:CHECK:SECRETS:START -->

### Secrets Management

- [ ] **CRITICAL**: No hardcoded API keys or passwords
- [ ] **CRITICAL**: No secrets in source code or comments
- [ ] **CRITICAL**: Secrets loaded from environment variables or vaults
- [ ] `.env` files in `.gitignore`
- [ ] Secrets not logged or exposed in errors
- [ ] No secrets in URL parameters

### Authentication

- [ ] **CRITICAL**: Industry-standard auth libraries used (not custom)
- [ ] Password hashing uses bcrypt/argon2/scrypt
- [ ] Session tokens are cryptographically secure
- [ ] Constant-time comparison for tokens/passwords
- [ ] Secure password reset flow implemented
- [ ] MFA support where appropriate

### Authorization

- [ ] Authorization checks on all protected routes
- [ ] Principle of least privilege applied
- [ ] Role-based access control (RBAC) properly implemented
- [ ] Resource ownership verified before access

<!-- AI:CHECK:SECRETS:END -->

---

=== CHECKLIST: CRYPTOGRAPHY ===
<!-- AI:CHECK:CRYPTO:START -->

### Cryptographic Practices

- [ ] **CRITICAL**: Standard libraries used (not custom crypto)
- [ ] **CRITICAL**: TLS 1.2+ required for all connections
- [ ] Strong algorithms: AES-256, RSA-2048+, SHA-256+
- [ ] No deprecated algorithms: MD5, SHA1, DES, RC4
- [ ] Proper key management (rotation, secure storage)
- [ ] Random number generation uses CSPRNG

### Data Protection

- [ ] Sensitive data encrypted at rest
- [ ] Sensitive data encrypted in transit (HTTPS)
- [ ] PII handled according to regulations
- [ ] Encryption keys stored securely (KMS recommended)

<!-- AI:CHECK:CRYPTO:END -->

---

=== CHECKLIST: ERROR HANDLING ===
<!-- AI:CHECK:ERRORS:START -->

### Error Handling

- [ ] **CRITICAL**: Errors don't expose internal details
- [ ] **CRITICAL**: Stack traces not shown to users
- [ ] Graceful error handling for all operations
- [ ] User-friendly error messages
- [ ] Errors logged for debugging (server-side)

### Logging Security

- [ ] **CRITICAL**: No PII in logs
- [ ] **CRITICAL**: No secrets in logs
- [ ] Configurable log levels
- [ ] Secure log storage and access
- [ ] Log injection prevented

<!-- AI:CHECK:ERRORS:END -->

---

=== CHECKLIST: DEPENDENCIES ===
<!-- AI:CHECK:DEPS:START -->

### Dependency Management

- [ ] **CRITICAL**: No known vulnerable dependencies
- [ ] Dependencies from official package managers only
- [ ] Exact versions or secure ranges specified
- [ ] Lock files committed (package-lock.json, etc.)
- [ ] `npm audit` / `pnpm audit` passing
- [ ] SBOM generated (SPDX or CycloneDX)

### Supply Chain Security

- [ ] Integrity verified (checksums/signatures)
- [ ] Minimal dependencies preferred
- [ ] Well-vetted, community-trusted libraries
- [ ] Container images from official sources
- [ ] Image digests pinned (SHA256)

<!-- AI:CHECK:DEPS:END -->

---

=== CHECKLIST: LANGUAGE-SPECIFIC ===
<!-- AI:CHECK:LANG:START -->

### JavaScript/TypeScript

- [ ] Prepared statements for database queries
- [ ] Output encoded to prevent XSS
- [ ] No `eval()` or `Function()` on user input
- [ ] `innerHTML` avoided (use `textContent`)
- [ ] CSP headers configured
- [ ] Cookie flags set (HttpOnly, Secure, SameSite)

### Python

- [ ] No `exec()` / `eval()` on user input
- [ ] `subprocess` uses `shell=False`
- [ ] Input deserialization uses safe libraries
- [ ] SQL uses parameterized queries

### Go

- [ ] Race condition detector enabled (`-race`)
- [ ] Error handling doesn't leak info
- [ ] Context timeouts used

### Rust

- [ ] `unsafe` blocks minimized and documented
- [ ] Memory safety maintained

### C/C++

- [ ] Bounds-checked functions used
- [ ] No `strcpy`, `gets`, `sprintf`
- [ ] Compiler defenses enabled (ASLR, stack canaries)

<!-- AI:CHECK:LANG:END -->

---

=== CHECKLIST: PLATFORM-SPECIFIC ===
<!-- AI:CHECK:PLATFORM:START -->

### Web Applications

- [ ] Security headers configured (CSP, X-Frame-Options, etc.)
- [ ] CORS properly configured
- [ ] Session cookies secured
- [ ] CSRF protection enabled
- [ ] Rate limiting implemented

### APIs

- [ ] Authentication required
- [ ] Rate limiting applied
- [ ] Input validation on all endpoints
- [ ] Sensitive data not in URLs
- [ ] API versioning implemented

### CI/CD Pipelines

- [ ] Secrets stored securely (not in code)
- [ ] SAST/DAST scans integrated
- [ ] Dependency scanning enabled
- [ ] Build artifacts signed

### Cloud Services

- [ ] Provider security guidelines followed
- [ ] Data encrypted at rest
- [ ] Data encrypted in transit
- [ ] IAM follows least privilege
- [ ] Network segmentation configured

<!-- AI:CHECK:PLATFORM:END -->

---

=== CHECKLIST: TESTING ===
<!-- AI:CHECK:TESTING:START -->

### Security Testing

- [ ] Unit tests for critical security functions
- [ ] Negative tests verify failure safety
- [ ] SAST tools run (linters, security scanners)
- [ ] Dependency vulnerability scanning
- [ ] Penetration testing for critical features

### Code Review

- [ ] Security-focused review conducted
- [ ] Auth/authz logic verified
- [ ] Input validation verified
- [ ] Error handling reviewed
- [ ] Secrets handling verified

<!-- AI:CHECK:TESTING:END -->

---

=== COMPLETION CRITERIA ===
<!-- AI:CRITERIA:START -->

### Minimum Requirements for Merge

**All CRITICAL items must pass.**

| Level | Requirement |
|-------|-------------|
| Minimal | All CRITICAL items checked |
| Standard | All CRITICAL + relevant section items |
| Full | All applicable items checked |

### When to Use Full Checklist

- New feature development
- Security-sensitive changes
- Authentication/authorization code
- Payment or financial features
- User data handling

### When Minimal is Acceptable

- Documentation changes
- Test-only changes
- Styling/UI-only changes (with review)

<!-- AI:CRITERIA:END -->

---

=== AI IMPROVEMENT TECHNIQUES ===
<!-- AI:IMPROVE:START -->

### Recursive Criticism and Improvement (RCI)

Ask the AI to review its own code:
1. Generate the code
2. Ask: "Review this code for security vulnerabilities"
3. Apply the suggested improvements
4. Repeat until no issues found

### Self-Detection Prompts

Ask specific questions:
- "Does this code have any SQL injection vulnerabilities?"
- "Could this expose sensitive information in error messages?"
- "Are there any hardcoded secrets?"
- "Is the authentication implementation following best practices?"

<!-- AI:IMPROVE:END -->

---

=== REFERENCES ===
<!-- AI:REFS:START -->

| Standard | Purpose |
|----------|---------|
| OWASP Top 10 | Web application security |
| OWASP ASVS | Security verification |
| CWE/SANS Top 25 | Most dangerous software errors |
| SAFECode | Fundamental security practices |
| SEI CERT | Language-specific standards |
| NIST | Cryptographic guidelines |

<!-- AI:REFS:END -->

---

=== RELATED CHECKLISTS ===
<!-- AI:RELATED:START -->

| Checklist | Relationship |
|-----------|--------------|
| @checklist(design-system-scalability) | UI security considerations |
| @skill(security-review) | Security review process |
| @skill(code-quality) | Code quality standards |

<!-- AI:RELATED:END -->
