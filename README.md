# 👷‍♀️ ReleaseTool

Simply returns the commit log for creating automated release notes, in `changelog.md` format.

## Quick Start

```bash
npx jv-k/releasetool
```

## Usage

> Prerequisites:
> 
> — A current existing tag + at least one other previous one.
> 
> 👉🏻 this isn't ideal and will be addressed in the next release of ReleaseTool.

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