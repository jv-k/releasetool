# 👷‍♀️ ReleaseTool

A very simple tool that returns the commit log between the **first two tags** in the repository for creating automated release notes, in markdown format.

## Quick Start

```bash
npx jv-k/releasetool
```

Sample output:
```
## CHANGELOG v3.5.12 (January 4, 2023)

- 5897b3d feat: 🎊 added comprehensive changelog since previous commit
- ccc860d chore: some refactoring
- be95960 chore(build): add --ninja silence mode to sush the credits
- e161cd1 merge: branch 'master' into develop
- 13ebfcf refactor: declare local + global vars properly
- 9be1d00 fix: shellcheck issues
- 3edbc1a chore(build): delete workflow artifacts after 3 days
- d6ea381 chore: update tlp dependencies
- cf50a5c chore(build): update build workflow / fix issue with TLP modules not updating
- 63a579f bug(build): fixed major headache with composer permissions by using --no-cache for updates + installs
- 4eb21c1 chore: add maintenance to all sprinkles / clean-up
```

## Pre-requisites

- A current existing tag + at least one other previous one.
  
  👉🏻 This is not ideal and will be addressed in the next release of ReleaseTool.

## Usage

For example, use it to create a release with [GitHub CLI](https://github.com/cli/cli) as a script in your `package.json`:

```json
"scripts": {
    ...
    "release": "gh release create --notes \"$(npx jv-k/releasetool)\""
}
```

Then to create a release with auto-generated release notes from previous commits, run 
`yarn release` or `npm run release`, etc.

## Roadmap

- [ ] Better error handling.
- [ ] Add configuration options for customising returned fields.
- [ ] Allow no existing tags.