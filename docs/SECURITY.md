# Security

This repository implements multiple layers of security scanning to prevent accidental credential commits and maintain security best practices.

## 🔐 Credential Scanning

### Overview

We use multiple tools to scan for potentially sensitive information:

- **Gitleaks**: Primary tool for detecting secrets, tokens, and credentials
- **TruffleHog**: Additional scanning for verified secrets
- **Pre-commit hooks**: Client-side scanning before commits
- **GitHub Actions**: Server-side scanning on push events

### Setup

#### Quick Setup

Run the automated setup script:

```bash
./scripts/setup-security-hooks.sh
```

This script will:
- Install `pre-commit` and `gitleaks` (if not already installed)
- Configure pre-commit hooks
- Test the setup on existing files

#### Manual Setup

If you prefer manual setup:

1. **Install pre-commit**:
   ```bash
   # Using pip
   pip install pre-commit

   # Using brew (macOS)
   brew install pre-commit

   # Using conda
   conda install -c conda-forge pre-commit
   ```

2. **Install gitleaks**:
   ```bash
   # Using brew (macOS)
   brew install gitleaks

   # Using Go
   go install github.com/zricethezav/gitleaks/v8@latest

   # Linux (download binary)
   wget https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks-linux-amd64.tar.gz
   ```

3. **Install pre-commit hooks**:
   ```bash
   pre-commit install
   ```

### Configuration Files

- **`.gitleaks.toml`**: Gitleaks configuration with custom rules and allowlists
- **`.pre-commit-config.yaml`**: Pre-commit hooks configuration
- **`.github/workflows/security-scan.yml`**: GitHub Actions workflow

### Usage

#### Automatic Scanning

- **Pre-commit**: Runs automatically when you `git commit`
- **GitHub Actions**: Runs on push to `main` and `develop` branches

#### Manual Scanning

```bash
# Scan entire repository with gitleaks
gitleaks detect --config .gitleaks.toml

# Scan specific files
gitleaks detect --source=path/to/file --config .gitleaks.toml

# Run all pre-commit hooks manually
pre-commit run --all-files

# Run only gitleaks hook
pre-commit run gitleaks --all-files
```

#### Bypass Scanning (Not Recommended)

If you absolutely need to bypass pre-commit hooks:

```bash
git commit --no-verify
```

**⚠️ Warning**: Only use `--no-verify` in exceptional circumstances and ensure manual review.

## 🎯 What Gets Detected

### Credential Types

- API keys (AWS, Google, GitHub, Slack, etc.)
- Database connection strings
- Private keys and certificates
- JWT tokens
- Bearer tokens and basic auth
- Passwords and secrets
- High-entropy strings (potential secrets)

### File Types Scanned

All text files are scanned except:
- Binary files (images, executables, archives)
- Lock files (`package-lock.json`, `yarn.lock`)
- Minified files (`.min.js`, `.min.css`)
- Example/template files (`.env.example`, `.sample`)
- Documentation files
- Build artifacts

## 🛠️ Customization

### Adding Allowlists

Edit `.gitleaks.toml` to add file paths, regex patterns, or specific strings to ignore:

```toml
[allowlist]
files = [
    '''my-special-file\.txt$''',
]

regexes = [
    '''my-safe-pattern-\d+''',
]
```

### Adding Custom Rules

Add new detection rules in `.gitleaks.toml`:

```toml
[[rules]]
id = "my-custom-api-key"
description = "My Custom API Key"
regex = '''myapi_[a-zA-Z0-9]{32}'''
keywords = ["myapi_"]
```

### Modifying Pre-commit Hooks

Edit `.pre-commit-config.yaml` to:
- Add new hooks
- Change hook versions
- Modify hook arguments
- Enable/disable specific checks

## 🚨 When Secrets Are Found

### During Pre-commit

1. **The commit will be blocked**
2. **Review the output** to identify the detected secret
3. **Remove or remediate** the secret:
   - Move to environment variables
   - Use secret management systems
   - Add to allowlist if it's a false positive
4. **Commit again** after fixing

### During GitHub Actions

1. **The workflow will fail**
2. **Check the Actions tab** for detailed results
3. **Download the SARIF report** if available
4. **Fix the issues** and push again

### False Positives

If a detection is a false positive:

1. **Verify it's actually safe** (not a real secret)
2. **Add to allowlist** in `.gitleaks.toml`
3. **Document why** it's safe (add comments)

## 📊 Monitoring and Reporting

### GitHub Actions Reports

- Failed scans upload SARIF reports as artifacts
- Reports are retained for 5 days
- Download from the Actions tab when workflows fail

### Local Reports

```bash
# Generate detailed report
gitleaks detect --config .gitleaks.toml --report-format json --report-path gitleaks-report.json

# View results
cat gitleaks-report.json | jq '.'
```

## 🔄 Maintenance

### Updating Tools

```bash
# Update pre-commit hooks
pre-commit autoupdate

# Update gitleaks (if installed via Go)
go install github.com/zricethezav/gitleaks/v8@latest

# Update gitleaks (if installed via brew)
brew upgrade gitleaks
```

### Regular Scans

Run full repository scans periodically:

```bash
# Scan all files
gitleaks detect --config .gitleaks.toml

# Scan git history (more comprehensive)
gitleaks detect --config .gitleaks.toml --source=. --log-level=info
```

## 🆘 Troubleshooting

### Common Issues

**Pre-commit hooks not running**:
```bash
# Reinstall hooks
pre-commit uninstall
pre-commit install
```

**Gitleaks false positives**:
- Add patterns to allowlist in `.gitleaks.toml`
- Use more specific regex patterns
- Add file-specific ignores

**GitHub Actions failing**:
- Check workflow permissions
- Verify configuration files are valid
- Review uploaded artifacts for details

### Getting Help

1. **Check tool documentation**:
   - [Gitleaks](https://github.com/gitleaks/gitleaks)
   - [Pre-commit](https://pre-commit.com/)
   - [TruffleHog](https://github.com/trufflesecurity/trufflehog)

2. **Validate configuration**:
   ```bash
   # Test gitleaks config
   gitleaks detect --config .gitleaks.toml --verbose

   # Test pre-commit config
   pre-commit run --all-files
   ```

3. **Review this documentation** and configuration files

## 📚 Additional Resources

- [OWASP Secrets Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [GitHub Secret Scanning](https://docs.github.com/en/code-security/secret-scanning)
- [Git Security Best Practices](https://git-scm.com/docs/git-config#Documentation/git-config.txt-transferfsckObjects)
