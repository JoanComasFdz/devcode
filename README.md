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

## License

MIT

## Issues

Report issues at: https://github.com/JoanComasFdz/devcode/issues
