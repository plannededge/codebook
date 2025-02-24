# codebook

## overview
this repository serves as our central knowledge base for development practices, coding standards, and GitHub project management. it contains guidelines, patterns, and workflows that our team follows to maintain consistency and quality across all projects.

## purpose
- centralise all development documentation
- standardise our coding practices
- provide quick reference guides
- maintain team-wide consistency
- track evolution of our practices

## structure
📁 codebook
├── 📁 github/
│ ├── issues.md # GitHub issues guidelines and best practices
│ ├── labels.md # Conventions for using GitHub labels and tags
│ └── project-naming.md # Standard naming conventions for GitHub projects and directories
├── 📁 git/
│ ├── branching.md
│ ├── commits.md
│ └── workflow.md
├── 📁 standards/
│ ├── naming.md # Naming conventions for code & projects (updated to include GitHub)
│ └── patterns.md
├── 📁 workflows/
│ ├── cicd.md
│ └── deployment.md
├── 📁 guides/
│ ├── quickstart.md
│ ├── troubleshooting.md
│ └── github-setup.md # Guide for setting up and managing GitHub projects
└── 📁 templates/
├── readme-template.md
├── pr-template.md
└── issue-template.md # Template for GitHub issues

## versioning
this documentation follows semantic versioning (x.y.z):
- **Major (x):** Significant changes or restructuring (e.g., complete changes to naming conventions)
- **Minor (y):** Additions to existing guidelines (e.g., new GitHub-specific documentation)
- **Patch (z):** Corrections or improvements

## contributing
1. create a branch following our patterns
2. make your changes
3. submit a pull request with clear descriptions
4. await review from team leads

## usage
1. clone this repository
2. reference relevant sections as needed
3. suggest improvements via issues
4. keep local copy updated

## maintenance
documentation is reviewed and updated monthly to ensure relevance and accuracy.

📁 codebook/
├── 📁 git/                      # git-related guidelines
│   ├── branching.md            # branching strategies
│   ├── commits.md              # commit message standards
│   └── workflow.md             # git workflow guides
│
├── 📁 standards/               # coding standards
│   ├── naming.md              # naming conventions
│   └── patterns.md            # design patterns
│
├── 📁 workflows/              # process documentation
│   ├── cicd.md               # ci/cd procedures
│   └── deployment.md         # deployment guides
│
├── 📁 guides/                 # how-to guides
│   ├── quickstart.md         # getting started
│   └── troubleshooting.md    # common issues
│
└── 📁 templates/              # reusable templates
    ├── readme-template.md     # project readme template
    └── pr-template.md        # pull request template

## standard branches

main: houses the current official documentation
develop: where documentation changes are collected and reviewed
release/v1.x.x: version-specific branches for major releases

### branch naming for documentation work

content/add-new-guide: adding new documentation
content/update-git-flow: updating existing documentation
fix/correct-workflow: fixing errors in documentation
enhance/clarify-patterns: improving clarity or examples

## versioning strategy

### version number format
use semantic versioning: vMajor.Minor.Patch
example: v1.2.3
when to increment versions

major (1.x.x): breaking changes or major restructuring

example: completely changing branching strategy
triggers new release branch


minor (x.2.x): adding new documentation

example: adding new workflow guides
no breaking changes


patch (x.x.3): fixes and improvements

example: correcting typos
clarifying existing content

### version tagging

create a tag for each version:
bashCopygit tag -a v1.2.3 -m "version 1.2.3: added deployment guides"

push tags to remote:
bashCopygit push origin v1.2.3


### releases

create a github release for each major version
include detailed changelog
highlight breaking changes
provide upgrade instructions if needed

### maintaining versions

keep a changelog.md in root directory
document all changes with clear explanations
link issues and pull requests in changelog

## GitHub Conventions
### Project and Directory Naming
See the [GitHub Project Naming Guidelines](github/project-naming.md) and the updated [Naming Conventions](standards/naming.md) for details on how to name your directories and set up projects in your IDE.

### Issue Structure and Templates
- **Creating Issues:**  
  Refer to [GitHub Issues Guidelines](github/issues.md) to understand which fields are required and how to categorize your issues.
- **Using Issue Templates:**  
  A standard [Issue Template](templates/issue-template.md) is provided to ensure consistency.

### Labels and Tags
- **Standard Labels:**  
  A set of recommended GitHub labels is provided in [Labels Conventions](github/labels.md). These labels help in categorizing issues, PRs, and project cards effectively.
- **Tags in Git and GitHub:**  
  Continue using semantic versioning tags for releases (e.g., `v1.2.3`). For Git tags, follow the command:
  ```bash
  git tag -a v1.2.3 -m "Release version 1.2.3: added GitHub project guidelines"
  git push origin v1.2.3
  ```

---

*This update ensures that our GitHub processes, naming conventions, and issue management are clear, consistent, and integrated with our existing development guidelines.*
