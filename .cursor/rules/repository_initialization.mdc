---
description: Detailed steps for initializing a git repository when cloning the template directly
alwaysApply: false
---

# Repository Initialization

**Note**: This is only needed when cloning the template directly. When using this as a GitHub template (recommended), a fresh repository is automatically created.

When you request to "initialize git repo" (only needed for cloned templates), I will perform the following steps:

1. **Clear template git history**: Remove the existing `.git` directory to start fresh (`rm -rf .git`).

2. Initialize a local Git repository (`git init`).

3. Use the **GitHub CLI** (not MCP server) to create a new **private** remote repository on GitHub:
   ```bash
   gh repo create --private --enable-issues --clone=false
   ```

4. Create a repository-scoped GitHub Personal Access Token using the GitHub CLI:
   ```bash
   gh auth token --hostname github.com --scopes "issues:write,contents:read,metadata:read" --repo-specific
   ```

5. Update the `.cursor/mcp.json` file to use the new scoped GitHub PAT in the GitHub MCP server configuration:
   ```json
   "github": {
     "url": "https://api.githubcopilot.com/mcp/",
     "headers": {
       "Authorization": "Bearer <new_scoped_pat>"
     }
   }
   ```

6. Add the new remote to the local repository, stage all initial files, and push the first commit to the `main` branch:
   ```bash
   git remote add origin git@github.com:username/repo-name.git  # Use SSH format for authentication
   git add .
   git commit -m "feat: initial project setup"
   git push -u origin main
   ```
