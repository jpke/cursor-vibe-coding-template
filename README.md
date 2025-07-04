# Cursor Vibe Coding Project Template

A comprehensive project template for **vibe coding** in Cursor with pre-configured AI tooling, MCP servers, and intelligent development workflows.

## ✨ Features

This template provides a ready-to-use development environment with:

- **🎯 TaskMaster AI Integration** - Intelligent task management with AI-powered PRD parsing, complexity analysis, and task breakdown
- **🧠 Memory MCP Server** - Persistent knowledge graph for maintaining context across sessions
- **🔗 Context7 MCP** - Enhanced codebase understanding and contextual assistance
- **🐙 GitHub MCP Integration** - Seamless GitHub repository and issue management
- **📝 Pre-configured Cursor Rules** - Optimized rules for frontend, testing, Python, and workflow automation
- **🚀 Automated Git Workflows** - Intelligent repository initialization with scoped permissions

## 🛠️ What's Included

### MCP Servers (Pre-configured)
- **TaskMaster AI** - AI-powered project management and task orchestration
- **Memory** - Persistent knowledge graph for context retention
- **Context7** - Enhanced codebase analysis and suggestions
- **GitHub** - Repository management and issue tracking

### Cursor Rules
- `frontend.mdc` - Frontend development best practices
- `testing.mdc` - Testing strategies and patterns
- `python.mdc` - Python development guidelines
- `meta_rules.mdc` - Self-improving rule management
- `workflow.mdc` - Git, Taskmaster, and Memory MCP workflows
- `taskmaster/` - Comprehensive TaskMaster workflow rules

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
└── .env.example              # Environment variables template
```

## 🚀 Quick Start

### 1. Clone and Setup
```bash
# Clone this template
git clone <your-template-repo> my-new-project
cd my-new-project

# Copy and configure MCP settings
cp .cursor/.mcp.json.example .cursor/mcp.json
# Edit .cursor/mcp.json with your API keys

# Copy and configure environment
cp .env.example .env
# Add your API keys to .env
```

### 2. Initialize Project with TaskMaster MCP
```bash
# Open in Cursor with MCP integration
cursor .
```

Then use the TaskMaster MCP workflow:
1. **Initialize TaskMaster** - Use the `initialize_project` MCP tool
2. **Create PRD** - Write your Product Requirements Document in `.taskmaster/docs/prd.txt`
3. **Validate PRD** - Review and refine with AI assistance
4. **Create GitHub Issue** - PRD becomes a GitHub Issue (single source of truth)
5. **Generate Tasks** - Say "start working on the PRD" to trigger task generation
6. **Confirm Tasks** - Review and approve generated tasks before beginning work

### 3. Vibe Coding with MCP
The MCP integration handles all TaskMaster operations seamlessly within Cursor:
- Tasks are automatically managed through the `taskmaster-ai` MCP server
- Context is maintained across sessions with the `memory` MCP server
- GitHub integration manages issues and repository operations
- No manual CLI commands needed - everything works through Cursor's AI interface

## 🔧 Configuration

### Required API Keys
Add these to your `.cursor/mcp.json` and `.env` files:

```bash
# AI Models
ANTHROPIC_API_KEY=your_key_here
PERPLEXITY_API_KEY=your_key_here  # For research features
OPENAI_API_KEY=your_key_here      # Optional
GOOGLE_API_KEY=your_key_here      # Optional

# GitHub (auto-configured during git init)
GITHUB_TOKEN=your_scoped_pat_here
```

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

## 🎯 Vibe Coding Workflow

This template is optimized for **vibe coding** - a development style that balances structure with creative flow using the TaskMaster MCP workflow:

### 📋 PRD-Driven Development
1. **Write Intent** - Create a clear PRD describing what you want to build
2. **Validate with AI** - Collaborate with Cursor to refine requirements
3. **Create GitHub Issue** - PRD becomes the single source of truth
4. **Trigger Generation** - Say "start working on the PRD" to generate tasks
5. **Confirm & Begin** - Review generated tasks and select which to start

### 🔄 Intelligent Development Loop
- **Context Awareness** - Memory MCP maintains understanding across sessions
- **Smart Task Management** - TaskMaster MCP handles complexity analysis and breakdown
- **Seamless Documentation** - Progress and learnings are captured automatically
- **GitHub Integration** - Issues and repository management work transparently

### 🎵 The Vibe
No manual task management needed. Just:
1. **Express your intent** in natural language
2. **Let AI structure the work** through MCP integration
3. **Code in flow** with full context awareness
4. **Ship iteratively** with automatic progress tracking

The MCP servers handle all the orchestration - you focus on the creative work.

## 📚 Documentation

- **AGENTS.md** - Comprehensive TaskMaster AI integration guide
- **CLAUDE.md** - Claude Code specific workflows and commands
- `.cursor/rules/` - Detailed coding rules and patterns
- `.taskmaster/templates/` - PRD templates and examples

## 🤝 Contributing

This template evolves with usage. The `meta_rules.mdc` enables self-improving patterns - rules automatically update based on emerging patterns in your codebase.

## 📄 License

[Add your license here]

---

**Happy vibe coding! 🎵✨** 