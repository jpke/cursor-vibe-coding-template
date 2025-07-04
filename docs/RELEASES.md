# Release Workflow

This project uses an automated release workflow that creates releases when PRs are merged to the main branch.

## How It Works

### Automatic Releases

The workflow automatically creates releases when:
- A PR is merged to the `main` branch
- There are new commits since the last release
- The commits contain changes that warrant a release

### Version Bumping

The workflow uses **semantic versioning** (semver) and determines the version bump type based on conventional commit messages:

- **Major version** (e.g., 1.0.0 → 2.0.0): Breaking changes
  - Commits with `feat!:` or `feature!:` (note the exclamation mark)
  - Commits containing `BREAKING CHANGE:` in the message

- **Minor version** (e.g., 1.0.0 → 1.1.0): New features
  - Commits starting with `feat:` or `feature:`

- **Patch version** (e.g., 1.0.0 → 1.0.1): Bug fixes and other changes
  - Commits starting with `fix:` or `bugfix:`
  - Commits starting with `docs:`, `style:`, `refactor:`, `test:`, `chore:`
  - Any other commit format (fallback)

### Conventional Commit Examples

```bash
# Patch release (1.0.0 → 1.0.1)
git commit -m "fix: resolve authentication issue"
git commit -m "docs: update API documentation"
git commit -m "chore: update dependencies"

# Minor release (1.0.0 → 1.1.0)
git commit -m "feat: add user profile management"
git commit -m "feature: implement dark mode toggle"

# Major release (1.0.0 → 2.0.0)
git commit -m "feat!: restructure API endpoints"
git commit -m "fix!: remove deprecated functions"
git commit -m "feat: add new auth system

BREAKING CHANGE: The old authentication system has been removed"
```

## Manual Releases

You can also trigger a release manually:

1. Go to the **Actions** tab in your GitHub repository
2. Select the **Release** workflow
3. Click **Run workflow**
4. Choose the version bump type (major, minor, patch)
5. Click **Run workflow**

## Release Notes

The workflow automatically generates release notes by categorizing commits:

- ✨ **New Features**: `feat:` and `feature:` commits
- 🐛 **Bug Fixes**: `fix:` and `bugfix:` commits
- 📚 **Documentation**: `docs:` commits
- ♻️ **Code Refactoring**: `refactor:` commits
- 🧪 **Tests**: `test:` commits
- 🔧 **Maintenance**: `chore:` commits
- 🔄 **Other Changes**: Any other commit format

## First Release

If this is the first release (no previous tags exist), the workflow will:
- Create version `v1.0.0`
- Generate a simple "Initial Release" note
- Include all commits in the release

## Workflow Features

### Smart Release Detection
- Only creates releases when there are new commits
- Skips releases if triggered but no changes exist
- Handles both automatic and manual triggers

### Comprehensive Release Notes
- Categorizes commits by type
- Strips commit prefixes for cleaner notes
- Includes full changelog links
- Handles edge cases gracefully

### Version Management
- Follows semantic versioning strictly
- Starts from v1.0.0 for first release
- Increments properly based on commit types
- Handles version parsing robustly

## Best Practices

1. **Use Conventional Commits**: This ensures proper version bumping and categorized release notes
2. **Merge via PR**: The workflow triggers on pushes to main, typically from merged PRs
3. **Review Before Merge**: Since releases are automatic, ensure your PR is ready for release
4. **Check Release Notes**: The generated notes will reflect your commit messages
5. **Use Descriptive Commits**: Your commit messages become the release notes

## Troubleshooting

### No Release Created
- Check if there are new commits since the last release
- Verify the workflow has proper permissions
- Ensure the branch name is exactly `main`

### Wrong Version Bump
- Review your commit messages for conventional commit format
- Use manual trigger with specific version type if needed
- Consider using `feat!:` for breaking changes

### Release Notes Issues
- Use clear, descriptive commit messages
- Follow conventional commit format
- Remove technical jargon from commit messages as they become user-facing

## Repository Setup

Make sure your repository has:
- `contents: write` permission for the workflow
- `pull-requests: read` permission for the workflow
- The workflow file at `.github/workflows/release.yml`

The workflow uses `GITHUB_TOKEN` which is automatically provided by GitHub Actions.
