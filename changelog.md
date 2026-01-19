# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2026-01-XX

### Added

- **APS Bootstrap** - `--with-aps` now installs APS registry and hooks from cache templates
- **APS Templates** - Added APS templates to templates registry for discovery
- **APS Troubleshooting** - Corrected manual APS recovery steps

## [1.1.0] - 2026-01-05

### Added

- **CLI Rules** - Safety and usage guidelines for 10 command-line tools
  - `github-cli.rule.md` - GitHub CLI (gh)
  - `docker-cli.rule.md` - Docker CLI
  - `gcloud-cli.rule.md` - Google Cloud CLI
  - `aws-cli.rule.md` - AWS CLI
  - `flyctl.rule.md` - Fly.io CLI
  - `vercel-cli.rule.md` - Vercel CLI
  - `npm.rule.md` - npm package manager
  - `pnpm.rule.md` - pnpm package manager
  - `yarn.rule.md` - Yarn package manager
  - `sentry-cli.rule.md` - Sentry CLI
- **Checklists** - Verification checklists for quality and security
  - `security-openssf.checklist.md` - OpenSSF security scorecard
  - `design-system-scalability.checklist.md` - Design system maturity
- **Bootstrap Update Mode** - `--update` flag for updating existing installations
  - Automatic backup to `.codebook-backup/`
  - Version tracking via `.claude/codebook-version`
  - Update notifications via SessionStart hook
- **MIT License** - Added LICENSE file

### Changed

- **Buildlogs** - Changed from mandatory to recommended
- **Agent Registry** - Clarified separation between active agents and templates
- **README** - Added update instructions and release pinning documentation

### Fixed

- **Bootstrap** - Now installs `checklists/` directory
- **Agent Index** - Templates no longer incorrectly marked as "active"

## [2.0.0] - 2026-01-03

### Added

- **Head Cook System** - Complete orchestration framework with CLAUDE.md as the master document
- **Agent Framework** - Modular agent system with templates for Code Chef, Review Chef, Doc Chef
  - `agentdocs/head-cook.agent.md` - Primary orchestrating agent
  - `agentdocs/templates/` - Templates for creating new agents on-demand
- **Skills System** - Procedural guides for common tasks
  - `project-setup.skill.md` - Comprehensive project initialization
  - `git-workflow.skill.md` - Git operations
  - `code-quality.skill.md` - Code standards
  - `agent-creation.skill.md` - Creating new agents
- **Buildlog System** - Mandatory weekly development logs
  - Standard tags: `#micro-decision`, `#commit`, `#issue-encountered`, `#resolution`, `#gap-identified`
  - Weekly template and index
- **Standards** - Comprehensive development standards
  - `naming-conventions.md` - Naming rules for code and files
  - `code-patterns.md` - Coding patterns and best practices
  - `commit-messages.md` - Conventional commit format
  - `pr-structure.md` - Pull request standards
- **Templates** - Reusable templates with YAML preambles
  - GitHub templates (issues, PRs, labels)
  - Document templates (preamble, readme)
- **Guides** - Practical how-to guides
  - `quickstart.md` - 5-minute getting started
  - `project-setup.md` - New project setup
- **Codebook ID System** - Unique identifiers for reliable cross-referencing
- **YAML Preambles** - Machine-readable metadata for all documents

### Changed

- **docs/ → devdocs/** - Renamed for clearer purpose
- **Structure** - Complete reorganization around Head Cook concept
- **README.md** - Updated with new vision and quick start
- **Index Files** - All directories now have `_*-index.md` registry files

### Removed

- **git/** directory - Merged into `workflows/git-flow.md`
- **github/** directory - Merged into `templates/github/`
- Empty placeholder files replaced with populated content

### Migration Notes

This is a major restructure. To upgrade from v1.x:

1. Back up existing documentation
2. Copy new structure
3. Migrate existing docs to `devdocs/`
4. Add YAML preambles to migrated docs
5. Create initial buildlog
6. Run pre-flight checklist

## [1.0.0] - 2025-XX-XX

### Added

- Initial repository structure
- Basic documentation templates
- GitHub guidelines
- Standards placeholders
- Git workflow placeholders
