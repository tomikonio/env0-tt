# DVLP CI Tools

This repository contains configuration and scripts to ensure code quality and enforce commit message conventions in a development environment.

## Description

The project uses Husky to manage Git hooks, ensuring that certain standards are met before code is pushed to the repository. The `commitlint` tool is used to enforce conventional commit messages, which helps in maintaining a clear and readable commit history.

## Installation

To set up the project dependencies, run the following command:

```bash
make install
```

## Writing Commit Messages

When writing commit messages, follow the Conventional Commits specification. Here's the basic format:

```php
<type>(<scope>): <description>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

Components of a Commit Message

* **Type (required):** Indicates the purpose of the commit. Common types include:
  * feat (new feature)
  * fix (bug fix)
  * docs (documentation changes)
  * style (code styling, no functional changes)
  * refactor (code refactoring)
  * perf (performance improvements)
  * test (adding or updating tests)
  * build (changes to build process)
  * ci (changes to CI configuration)
  * chore (other changes that don't modify src or test files)
  * revert (reverting a previous commit)
* **Scope (required):** A scope provides additional contextual information on the part of the application that is affected by the change.
* **Description (required):** A brief description of the changes, starting with a lowercase letter and without a period at the end.
* **Body (optional):** A longer description of the changes, providing more context or explanations as needed. This section can include multiple paragraphs and can list changes or elaborate on the impacts.
* **Footer (optional):** Used to reference issue tracker IDs, pull request numbers, breaking changes, or other metadata, such as:
  * Fixes #123
  * BREAKING CHANGE: Changes that break existing functionality.

### Example Commit Messages

```php
  feat(auth): add support for OAuth2
  fix(server): resolve memory leak in image processing
  docs(readme): update installation instructions
```

```
  feat(auth): add support for OAuth2

  This update includes new OAuth2 support for our authentication module, allowing for more secure and versatile login capabilities across platforms.

  Related to task #456 in the project management tool.
```

### Common Issues and Troubleshooting

Commitlint not running: Ensure the Husky hooks are properly set up and the scripts are executable.
Failing commits: If your commits are failing, check that your commit messages strictly follow the specified format.

<3
