# devcode

Open VS Code intelligently - automatically detects and opens dev containers when available.

## What it does

- 🔍 Checks if a `.devcontainer` configuration exists in your project
- 📦 If found: Opens VS Code directly in the dev container
- 📁 If not found: Opens VS Code normally
- 🌍 Cross-platform: Works on Windows, macOS, and Linux

## Installation

```bash
npm install -g devcode
```

## Usage

```bash
# Open current directory
devcode

# Open specific directory
devcode /path/to/project
devcode ~/projects/myapp
```

## Requirements

- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (if using dev containers)
- Node.js 14 or higher

## How it works

`devcode` looks for either:
- `.devcontainer/devcontainer.json`
- `.devcontainer.json`

If found, it uses VS Code's remote container URI to open directly in the container.
Otherwise, it opens VS Code normally.

## Examples

```bash
# Clone a repo and open in its dev container
git clone https://github.com/user/project.git
cd project
devcode
```

## Development

### Local Testing

Install the package locally for testing:

```bash
npm install -g .
```

### Publishing to npm

This package uses GitHub Actions for automated publishing. To publish a new version:

1. Update the version in `package.json`:
   ```bash
   npm version patch  # for bug fixes (1.0.0 -> 1.0.1)
   npm version minor  # for new features (1.0.0 -> 1.1.0)
   npm version major  # for breaking changes (1.0.0 -> 2.0.0)
   ```

2. Push the version tag to GitHub:
   ```bash
   git push origin main --tags
   ```

3. The GitHub Action will automatically:
   - Verify the tag matches package.json version
   - Publish to npm with provenance
   - Create a GitHub release

**Prerequisites for publishing:**
- Set `NPM_TOKEN` secret in GitHub repository settings
  - Get your npm token from https://www.npmjs.com/settings/[username]/tokens
  - Create a "Automation" token
  - Add it to GitHub: Settings → Secrets and variables → Actions → New repository secret
  - Name: `NPM_TOKEN`

## License

MIT

## Issues

Report issues at: https://github.com/JoanComasFdz/devcode/issues
