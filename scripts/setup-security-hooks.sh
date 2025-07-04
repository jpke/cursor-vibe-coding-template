#!/bin/bash

# Setup script for security scanning tools and pre-commit hooks
# This script installs and configures gitleaks and pre-commit hooks

set -e

echo "🔐 Setting up security scanning tools..."

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install pre-commit
install_precommit() {
    echo "📦 Installing pre-commit..."

    if command_exists pip3; then
        pip3 install pre-commit
    elif command_exists pip; then
        pip install pre-commit
    elif command_exists brew; then
        brew install pre-commit
    elif command_exists conda; then
        conda install -c conda-forge pre-commit
    else
        echo "❌ Could not find pip, brew, or conda. Please install pre-commit manually:"
        echo "   https://pre-commit.com/#installation"
        exit 1
    fi
}

# Function to install gitleaks
install_gitleaks() {
    echo "📦 Installing gitleaks..."

    if command_exists brew; then
        brew install gitleaks
    elif command_exists go; then
        go install github.com/zricethezav/gitleaks/v8@latest
    else
        echo "⚠️  Could not install gitleaks automatically."
        echo "   Please install gitleaks manually:"
        echo "   - macOS: brew install gitleaks"
        echo "   - Linux: wget https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks-linux-amd64.tar.gz"
        echo "   - Windows: Download from https://github.com/gitleaks/gitleaks/releases"
        echo "   - Go: go install github.com/zricethezav/gitleaks/v8@latest"
    fi
}

# Check if pre-commit is installed
if ! command_exists pre-commit; then
    install_precommit
else
    echo "✅ pre-commit is already installed"
fi

# Check if gitleaks is installed
if ! command_exists gitleaks; then
    install_gitleaks
else
    echo "✅ gitleaks is already installed"
fi

# Install pre-commit hooks
echo "🔧 Installing pre-commit hooks..."

# Try to find pre-commit in common locations
PRECOMMIT_CMD=""
if command_exists pre-commit; then
    PRECOMMIT_CMD="pre-commit"
elif [ -f "$HOME/.local/bin/pre-commit" ]; then
    PRECOMMIT_CMD="$HOME/.local/bin/pre-commit"
elif [ -f "$HOME/Library/Python/3.9/bin/pre-commit" ]; then
    PRECOMMIT_CMD="$HOME/Library/Python/3.9/bin/pre-commit"
elif command_exists python3; then
    # Try using python -m pre_commit
    if python3 -m pre_commit --version >/dev/null 2>&1; then
        PRECOMMIT_CMD="python3 -m pre_commit"
    fi
fi

if [ -z "$PRECOMMIT_CMD" ]; then
    echo "❌ Could not find pre-commit command. Please add it to your PATH or run:"
    echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo "   # or add the above to your shell profile (~/.bashrc, ~/.zshrc)"
    exit 1
fi

echo "📍 Using pre-commit at: $PRECOMMIT_CMD"
$PRECOMMIT_CMD install

# Run pre-commit on all files to test setup
echo "🧪 Testing pre-commit setup on existing files..."
$PRECOMMIT_CMD run --all-files || {
    echo "⚠️  Some pre-commit checks failed. This is normal for existing repositories."
    echo "   Review the output above and fix any issues before committing new changes."
}

echo ""
echo "✅ Security scanning setup complete!"
echo ""
echo "What was installed:"
echo "  • GitHub Action workflow (.github/workflows/security-scan.yml)"
echo "  • Gitleaks configuration (.gitleaks.toml)"
echo "  • Pre-commit configuration (.pre-commit-config.yaml)"
echo "  • Pre-commit hooks (installed in .git/hooks/)"
echo ""
echo "Usage:"
echo "  • Pre-commit hooks will run automatically on 'git commit'"
echo "  • GitHub Actions will run on push to main/develop branches"
echo "  • Manual scan: 'gitleaks detect --config .gitleaks.toml'"
echo "  • Manual pre-commit: '$PRECOMMIT_CMD run --all-files'"
echo ""
echo "To skip pre-commit hooks temporarily (not recommended):"
echo "  git commit --no-verify"
echo ""
echo "🔐 Your repository is now protected against accidental credential commits!"
