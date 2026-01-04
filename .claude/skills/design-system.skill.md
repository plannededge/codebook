---
document_name: "design-system.skill.md"
location: ".claude/skills/design-system.skill.md"
codebook_id: "CB-SKILL-DESIGNSYS-001"
version: "1.0.0"
date_created: "2026-01-04"
date_last_edited: "2026-01-04"
document_type: "skill"
purpose: "Procedures for design system creation and maintenance"
skill_metadata:
  category: "design"
  complexity: "advanced"
  estimated_time: "varies"
  prerequisites:
    - "Visual design fundamentals"
    - "Component-based design"
category: "skills"
status: "active"
tags:
  - "skill"
  - "design"
  - "system"
  - "ui"
ai_parser_instructions: |
  This skill defines procedures for design system work.
  Used by UI Designer agent.
---

# Design System Skill

=== PURPOSE ===

Procedures for creating and maintaining a cohesive design system.

=== USED BY ===

| Agent | Purpose |
|-------|---------|
| @agent(ui-designer) @ref(CB-AGENT-UIDESIGN-001) | Primary skill for design system |

=== PROCEDURE: Design System Structure ===

**Core Elements:**
```
Design System
├── Foundations
│   ├── Colors
│   ├── Typography
│   ├── Spacing
│   ├── Shadows
│   └── Borders/Radii
├── Components
│   ├── Atoms (Button, Input, Icon)
│   ├── Molecules (Form Field, Search Bar)
│   └── Organisms (Header, Card, Modal)
├── Patterns
│   ├── Forms
│   ├── Navigation
│   └── Feedback
└── Guidelines
    ├── Voice & Tone
    ├── Accessibility
    └── Motion
```

=== PROCEDURE: Foundation Setup ===

**Color System:**
```markdown
## Colors

### Primary Palette
| Name | Value | Usage |
|------|-------|-------|
| primary-50 | #EEF2FF | Backgrounds |
| primary-100 | #E0E7FF | Hover states |
| primary-500 | #6366F1 | Default |
| primary-600 | #4F46E5 | Hover |
| primary-700 | #4338CA | Active |

### Semantic Colors
| Name | Value | Usage |
|------|-------|-------|
| success | #10B981 | Success states |
| warning | #F59E0B | Warning states |
| error | #EF4444 | Error states |
| info | #3B82F6 | Info states |

### Neutral Palette
| Name | Value | Usage |
|------|-------|-------|
| gray-50 | #F9FAFB | Page background |
| gray-100 | #F3F4F6 | Card background |
| gray-500 | #6B7280 | Secondary text |
| gray-900 | #111827 | Primary text |
```

**Typography Scale:**
```markdown
## Typography

### Font Families
- **Sans:** Inter, system-ui, sans-serif
- **Mono:** JetBrains Mono, monospace

### Type Scale
| Name | Size | Line Height | Weight | Usage |
|------|------|-------------|--------|-------|
| xs | 12px | 16px | 400 | Labels, captions |
| sm | 14px | 20px | 400 | Body small |
| base | 16px | 24px | 400 | Body default |
| lg | 18px | 28px | 500 | Body large |
| xl | 20px | 28px | 600 | Heading 4 |
| 2xl | 24px | 32px | 600 | Heading 3 |
| 3xl | 30px | 36px | 700 | Heading 2 |
| 4xl | 36px | 40px | 700 | Heading 1 |
```

**Spacing Scale:**
```markdown
## Spacing

### Base Unit: 4px

| Token | Value | Pixels |
|-------|-------|--------|
| space-0 | 0 | 0px |
| space-1 | 0.25rem | 4px |
| space-2 | 0.5rem | 8px |
| space-3 | 0.75rem | 12px |
| space-4 | 1rem | 16px |
| space-6 | 1.5rem | 24px |
| space-8 | 2rem | 32px |
| space-12 | 3rem | 48px |
| space-16 | 4rem | 64px |
```

=== PROCEDURE: Component Documentation ===

**Component Spec Template:**
```markdown
# [Component Name]

## Purpose
One sentence describing what this component does.

## Anatomy
[Diagram or description of component parts]

## Variants
| Variant | Description | When to Use |
|---------|-------------|-------------|
| Primary | Bold, high contrast | Main actions |
| Secondary | Subtle, outlined | Secondary actions |
| Ghost | Minimal, text only | Tertiary actions |

## Sizes
| Size | Height | Padding | Font |
|------|--------|---------|------|
| sm | 32px | 12px | 14px |
| md | 40px | 16px | 16px |
| lg | 48px | 20px | 18px |

## States
- Default
- Hover
- Active/Pressed
- Focus
- Disabled
- Loading

## Specifications
[Detailed visual specs]

## Accessibility
- Keyboard: [behavior]
- ARIA: [requirements]
- Focus: [indicator style]

## Usage Guidelines
### Do
- [Good practice]
- [Good practice]

### Don't
- [Anti-pattern]
- [Anti-pattern]

## Examples
[Code or visual examples]
```

=== PROCEDURE: System Governance ===

**Change Process:**
1. Propose change with rationale
2. Review impact on existing components
3. Get approval from design lead
4. Update design files
5. Update tokens/code
6. Update documentation
7. Announce change to team

**Versioning:**
- Major: Breaking changes
- Minor: New components/features
- Patch: Bug fixes, documentation

=== RELATED SKILLS ===

| Skill | Relationship |
|-------|--------------|
| @skill(design-tokens) | Token implementation |
| @skill(visual-design) | Visual application |
