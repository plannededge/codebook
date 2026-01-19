---
document_name: "pr.template.md"
location: "templates/github/pr.template.md"
codebook_id: "CB-TPL-PR-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "template"
purpose: "Template for creating consistent pull requests"
category: "templates"
subcategory: "github"
status: "active"
ai_parser_instructions: |
  This is a template for pull requests.
  Replace << placeholders >> with actual values.
  Can be used in .github/PULL_REQUEST_TEMPLATE.md
---

# Pull Request Template

[!FIXED!]
## Purpose

Provide a consistent structure for creating pull requests. Use this template to ensure reviewers have all necessary context.
[!FIXED!]

---

=== PR TEMPLATE ===

```markdown
## Summary
<!-- Brief description of what this PR does (1-3 sentences) -->
<< summary >>

## Type of Change
<!-- Check relevant boxes -->
- [ ] Bug fix (non-breaking change that fixes an issue)
- [ ] New feature (non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Refactoring (no functional changes)
- [ ] Performance improvement
- [ ] Test coverage improvement

## Changes
<!-- List significant changes -->
- << change >>
- << change >>
- << change >>

## Testing
<!-- How was this tested? -->
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed
- [ ] Test coverage maintained/improved

### Test Details
<!-- Describe testing approach -->
<< test_details >>

## Related Issues
<!-- Link related issues -->
Closes #<< issue_number >>
Related to #<< issue_number >>

## Screenshots
<!-- If applicable, add screenshots -->
<< screenshots >>

## Checklist
<!-- Ensure all items are complete -->
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my code
- [ ] I have commented my code where necessary
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] Any dependent changes have been merged and published
- [ ] AI contributions properly attributed (if applicable)

## Additional Notes
<!-- Any other information reviewers should know -->
<< notes >>

## AI Provenance (Optional)
<!-- Complete if AI agents contributed to this PR -->

**Agent(s) Used:**
- << agent_id >> (e.g., anthropic:claude-code@1.5.0+sk7b2c#a7b3c9d2)

**Session ID(s):**
- << session_id >> (e.g., sess_feature_001)

**Human Review:**
- [ ] All AI-generated code has been reviewed by a human
- [ ] AI attribution trailers added to commits

**Contribution Type:**
- [ ] Generate (AI wrote new code)
- [ ] Refactor (AI restructured existing code)
- [ ] Review (AI reviewed and suggested changes)
- [ ] Collaborate (Mixed human-AI authorship)

See @ref(CB-STD-APS-001) for Agentic Provenance Standard details.
```

---

=== PR TITLE FORMAT ===
<!-- AI:TITLE:START -->

Use conventional commit format:

```
<type>(<scope>): <description>

Examples:
feat(auth): add OAuth2 login support
fix(api): handle null response from endpoint
docs(readme): add installation instructions
refactor(utils): extract date formatting logic
```

| Type | Purpose |
|------|---------|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation |
| style | Formatting |
| refactor | Code restructuring |
| test | Adding tests |
| chore | Maintenance |
| perf | Performance |

<!-- AI:TITLE:END -->

---

=== REVIEW GUIDELINES ===
<!-- AI:REVIEW:START -->

### For Authors

1. **Self-review first** - Catch obvious issues
2. **Keep PRs small** - Easier to review
3. **Provide context** - Explain why, not just what
4. **Respond promptly** - Keep reviews moving

### For Reviewers

1. **Be constructive** - Focus on code, not person
2. **Be specific** - Point to exact lines
3. **Explain why** - Help author learn
4. **Acknowledge good work** - Positive feedback matters

<!-- AI:REVIEW:END -->

---

=== MERGE CHECKLIST ===
<!-- AI:MERGE:START -->

Before merging:

- [ ] All required reviews approved
- [ ] CI checks pass
- [ ] No merge conflicts
- [ ] Branch is up to date with target
- [ ] Documentation updated if needed
- [ ] CHANGELOG updated if needed

<!-- AI:MERGE:END -->
