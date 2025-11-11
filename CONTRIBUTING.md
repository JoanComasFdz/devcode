# Contributing to devcode

Thank you for your interest in contributing to devcode!

## Development Setup

1. Fork and clone the repository
2. Make your changes
3. Test locally:
   ```bash
   npm install -g .
   devcode /path/to/test/project
   ```

## Testing

The package includes test projects in the `test/` directory:

- `test/test-project/` - Regular project without devcontainer
- `test/test-devcontainer/` - Project with devcontainer configuration

Test both scenarios:

```bash
# Test normal project
devcode test/test-project

# Test devcontainer project
devcode test/test-devcontainer
```

## Code Style

- Use clear, descriptive variable names
- Add comments for complex logic
- Follow existing code patterns
- Ensure scripts remain cross-platform compatible

## Submitting Changes

1. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit:
   ```bash
   git add .
   git commit -m "Description of changes"
   ```

3. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

4. Create a pull request on GitHub

## Release Process (Maintainers Only)

1. Update version in package.json:
   ```bash
   npm version [patch|minor|major]
   ```

2. Push with tags:
   ```bash
   git push origin main --tags
   ```

3. GitHub Actions will automatically publish to npm

## Questions?

Open an issue on GitHub if you have questions or need help!
