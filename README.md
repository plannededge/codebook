# codebook

## overview
this repository serves as our central knowledge base for development practices and coding standards. it contains guidelines, patterns, and workflows that our team follows to maintain consistency and quality across all projects.

## purpose
- centralise all development documentation
- standardise our coding practices
- provide quick reference guides
- maintain team-wide consistency
- track evolution of our practices

## structure
📁 codebook
├── 📁 git
│   ├── branching.md
│   ├── commits.md
│   └── workflow.md
├── 📁 standards
│   ├── naming.md
│   └── patterns.md
├── 📁 workflows
│   ├── cicd.md
│   └── deployment.md
├── 📁 guides
│   ├── quickstart.md
│   └── troubleshooting.md
└── 📁 templates
├── readme-template.md
└── pr-template.md

## versioning
this documentation follows semantic versioning (x.y.z):
- major (x): significant changes to practices
- minor (y): additions to existing guidelines
- patch (z): corrections or clarifications

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
