# Cursor Vibe Coding Project Template

A comprehensive project template for **vibe coding** in Cursor with pre-configured AI tooling, MCP servers, and intelligent development workflows.

## Table of Contents

- [Quick Start](#-quick-start)
- [Features](#-features)
- [What's Included](#-whats-included)
- [Vibe Coding Workflow](#-vibe-coding-workflow)
- [Configuration](#-configuration)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [License](#-license)

## 🚀 Quick Start

### 1. Create Your Project

**Recommended: Use as GitHub Template**
1. Click "Use this template" button on GitHub
2. Create your new repository from the template
3. Clone your new repository:
   ```bash
   git clone git@github.com:yourusername/your-project-name.git
   cd your-project-name
   cursor .
   ```
4. Prompt the AI agent: `"Set up the template for my new project"`

**Alternative: Clone Template Directly**
```bash
# If you cloned the template repository directly
git clone git@github.com:your-org/project_template.git my-new-project
cd my-new-project
cursor .

# Then prompt the AI agent:
# "Initialize the repo for my new project"
```

The AI agent will automatically handle template setup including:
- Setting up your MCP configuration
- Customizing files for your project
- Initializing git repository and GitHub repo (only needed for cloned templates)

**Manual Setup (If Preferred)**
```bash
# After cloning the template to your project folder
cd my-new-project

# REQUIRED: Set up MCP configuration
cp .cursor/.mcp.json.example .cursor/mcp.json
# Edit .cursor/mcp.json with your API keys

# Optional: Copy .env only if you plan to use TaskMaster CLI
# (Not needed for the recommended MCP workflow)
cp .env.example .env  # Optional
# Add your API keys to .env  # Only if using CLI

# IMPORTANT: Customize for your project
# - Replace this README.md with your project's README
# - Update SECURITY.md to remove template references
# - Remove or update any hardcoded paths in configuration files
```

### 2. Start Vibe Coding
```bash
cursor .
# For GitHub template usage: "Set up the template for my new project"
# For cloned templates: "Initialize the repo for my new project"
```

## ✨ Features

This template provides a ready-to-use development environment with:

- **🎯 TaskMaster AI Integration** - Intelligent task management with AI-powered PRD parsing, complexity analysis, and task breakdown
- **🧠 Memory MCP Server** - Persistent knowledge graph for maintaining context across sessions
- **🔗 Context7 MCP** - Enhanced codebase understanding and contextual assistance
- **🐙 GitHub MCP Integration** - Seamless GitHub repository and issue management
- **📝 Pre-configured Cursor Rules** - Optimized rules for frontend, testing, Python, and workflow automation
- **🚀 Automated Git Workflows** - Intelligent repository initialization with scoped permissions
- **🤖 Agent-Driven Setup** - AI assistant handles template initialization automatically

## 🛠️ What's Included

### MCP Servers (Pre-configured)
- **TaskMaster AI** - AI-powered project management and task orchestration
- **Memory** - Persistent knowledge graph for context retention
- **Context7** - Enhanced codebase analysis and suggestions
- **GitHub** - Repository management and issue tracking

### Cursor Rules
- `development.mdc` - Frontend, testing, and Python development best practices
- `rule_management.mdc` - Rule structure and formatting guidelines
- `self_improve.mdc` - Self-improving rule management patterns
- `workflow.mdc` - Git, Taskmaster, and Memory MCP workflows
- `taskmaster/` - Comprehensive TaskMaster workflow rules

### Setup & Configuration
- `.cursor/.mcp.json.example` - Template MCP server configuration
- `.env.example` - Optional environment variables for CLI usage

### Project Structure
```
project_template/
├── .cursor/
│   ├── mcp.json              # MCP server configuration
│   ├── .mcp.json.example     # Template for MCP setup
│   └── rules/                # Cursor coding rules
├── .taskmaster/              # TaskMaster configuration
│   ├── config.json           # AI model settings
│   ├── docs/                 # Documentation directory
│   ├── tasks/                # Task files
│   └── templates/            # PRD templates
├── .github/
│   └── instructions/         # GitHub workflow instructions
├── AGENTS.md                 # TaskMaster integration guide
├── CLAUDE.md                 # Claude Code integration guide
└── .env.example              # Optional: Environment variables for CLI usage only
```

## 🎯 Vibe Coding Workflow

This template is optimized for **vibe coding** - a development style that balances structure with creative flow using controlled MCP workflows.

### 🚀 Initialize Git Repository
**Note:** Only needed when cloning the template directly. When using as a GitHub template (recommended), your repository is already initialized.

**Prompt:** `"Initialize git repo"` or `"Initialize the repo for my new project"`

For cloned templates, the AI agent automatically follows this workflow:
1. **Template Cleanup** - Removes template-specific `.git` history
2. **Local Git Setup** - Initializes fresh repository with proper `.gitignore`
3. **GitHub Repository** - Creates private repo with issues enabled via GitHub CLI
4. **Scoped Authentication** - Generates repository-specific GitHub PAT with minimal permissions
5. **MCP Configuration** - Updates `.cursor/mcp.json` with the scoped token
6. **Initial Commit** - Pushes your new project to `main` branch using SSH authentication

### 📋 PRD-Driven Development (User-Controlled)

#### Step 1: Initialize TaskMaster
**Prompt:** `"Initialize TaskMaster for this project"`
- Uses the `initialize_project` MCP tool to set up project structure

#### Step 2: Create and Validate PRD
**Prompt:** `"Help me create a Product Requirements Document for [describe your project idea]"`
- Collaborate with AI to write a comprehensive PRD
- Refine requirements through iterative discussion
- PRD draft saved locally in `.taskmaster/docs/prd.txt`

#### Step 3: Create GitHub Issue from PRD
**Prompt:** `"I accept this PRD. Please create a GitHub Issue with the full PRD content"`
- AI creates GitHub Issue containing the complete PRD text
- GitHub Issue becomes the single source of truth for requirements
- **Local PRD file is automatically deleted** to prevent confusion

#### Step 4: Generate Tasks (Explicit Trigger Required)
**Prompt:** `"Start working on the PRD"` or `"Generate tasks from the PRD Issue"`
- **Important:** Tasks are only generated after this explicit instruction
- AI uses TaskMaster MCP to parse the GitHub Issue and create structured tasks
- Complex tasks are broken down with AI-powered complexity analysis

#### Step 5: Confirm Task Selection
**Prompt:** `"I want to begin with task [ID]"` or `"Which task should I start with?"`
- **Required:** AI must confirm which specific task to begin before executing
- AI will not automatically start task execution without your approval
- Uses `next_task` MCP tool to suggest optimal starting points based on dependencies

### 🧠 Memory & Context Management
**Memory MCP Workflow:**
- **Before Memory Operations** - AI asks: `"May I save this information to the knowledge graph?"`
- **User Confirmation** - `"Yes, you can update memory"` or `"No, don't save this yet"`
- **Context Preservation** - Understanding maintained across sessions with explicit consent

### 🔄 Development Loop with Explicit Control
- **AI Suggests** - Provides recommendations and analysis
- **User Decides** - Explicit approval required for significant operations
- **Controlled Automation** - MCP servers assist but don't override user decisions
- **Progress Tracking** - Development logged with user awareness

### 🎵 The Vibe
Intelligent assistance with human control:
1. **Express your intent** in natural language
2. **AI structures and suggests** work through MCP integration
3. **You approve and direct** with explicit confirmation points
4. **Code in flow** with full context awareness and controlled automation
5. **Ship iteratively** with transparent progress tracking

The MCP servers provide powerful assistance while keeping you in the driver's seat.

## 🔧 Configuration

### Required API Keys

**For MCP Workflow (Recommended):** Add to `.cursor/mcp.json`:
```json
{
  "mcpServers": {
    "taskmaster-ai": {
      "env": {
        "ANTHROPIC_API_KEY": "your_key_here",
        "PERPLEXITY_API_KEY": "your_key_here"
      }
    }
  }
}
```

**For CLI Workflow (Optional):** Add to `.env` file:
```bash
# AI Models
ANTHROPIC_API_KEY=your_key_here
PERPLEXITY_API_KEY=your_key_here  # For research features
OPENAI_API_KEY=your_key_here      # Optional
GOOGLE_API_KEY=your_key_here      # Optional

# GitHub (auto-configured during git init)
GITHUB_TOKEN=your_scoped_pat_here
```

**Important Notes:**
- The `.env.example` file is provided for users who want to use TaskMaster CLI commands directly. For the recommended MCP workflow in Cursor, only `.cursor/mcp.json` configuration is needed.
- **Environment File Distinction**: This template's `.env.example` contains TaskMaster CLI configuration. Your project may also need its own `.env` file for application configuration (database URLs, app API keys, etc.) - these are completely separate concerns.

### MCP Server Setup
The template includes example configurations in `.cursor/.mcp.json.example`. Copy and customize:

```json
{
  "mcpServers": {
    "taskmaster-ai": {
      "command": "npx",
      "args": ["-y", "--package=task-master-ai", "task-master-ai"],
      "env": {
        "ANTHROPIC_API_KEY": "your_key_here"
      }
    }
  }
}
```

## 📚 Documentation

- **AGENTS.md** - Comprehensive TaskMaster AI integration guide
- **CLAUDE.md** - Claude Code specific workflows and commands
- `.cursor/rules/` - Detailed coding rules and patterns
- `.taskmaster/templates/` - PRD templates and examples

## 📄 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

This template evolves with usage. The `meta_rules.mdc` enables self-improving patterns - rules automatically update based on emerging patterns in your codebase.

### How to Contribute
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## 🔗 Related Projects

- [TaskMaster AI](https://github.com/your-org/task-master-ai) - The core task management system
- [Cursor](https://cursor.sh/) - The AI-powered code editor this template is designed for

## 🙏 Acknowledgments

This template was inspired by several excellent resources in the AI development community:

- **[Viktor Farcic's YouTube Automation](https://github.com/vfarcic/youtube-automation)** - Reference implementation of AI-powered development workflows
- **[My Workflow With AI: How I Code, Test, and Deploy Faster Than Ever](https://devopstoolkit.live/ai/my-workflow-with-ai-how-i-code-test-and-deploy-faster-than-ever/)** - Comprehensive guide to AI-assisted development workflows by Viktor Farcic
- **[AI Labs Video](https://www.youtube.com/watch?v=cAFIUiE_8DM)** - Insights on AI development practices and tooling

These resources provided valuable insights into structuring AI-powered development workflows, MCP server integration, and best practices for vibe coding with AI assistants.

---

**Happy vibe coding! 🎵✨**
