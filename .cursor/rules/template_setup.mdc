---
description: Detailed steps for template setup workflow when initializing a project
alwaysApply: true
---

# Template Setup Workflow

## Agent-Driven Initialization
When a user prompts "initialize this project as <my project name>", I will **ONLY** handle template setup (do NOT include TaskMaster or PRD work):

1. **Copy `.cursor/.mcp.json.example` to `.cursor/mcp.json`** and prompt user for their API keys
2. **Remove template-specific content** and customize for their project:
   - **Move `README.md` to `docs/how_to_use_this_template.md`** to preserve template documentation
   - **Copy `.cursor/templates/project_readme.md` to the project root as `README.md`** to create the new project-specific README
   - **Update the new `README.md`** by replacing `[Project Name]` placeholder with user-provided name or "My Project"
   - Update `SECURITY.md` to remove template references
   - Remove or update any hardcoded paths in configuration files

   **Environment File Distinction:**
   - **Template `.env.example`**: Contains TaskMaster CLI configuration (ANTHROPIC_API_KEY, PERPLEXITY_API_KEY, etc.)
   - **Project `.env`**: Will contain application-specific configuration (database URLs, app API keys, etc.)
   - **Never mix these**: TaskMaster configuration is separate from project application configuration
3. **Enable Issues** (if GitHub repository):
   ```bash
   gh api repos/OWNER/REPO --method PATCH --field has_issues=true
   ```
4. **Set Branch Protection Rules** (if GitHub repository):
   ```bash
   gh api repos/OWNER/REPO/branches/main/protection \
     --method PUT \
     --field required_status_checks='{"strict":true,"contexts":[],"checks":[]}' \
     --field required_pull_request_reviews='{"dismiss_stale_reviews":false,"require_code_owner_reviews":false,"require_last_push_approval":false,"required_approving_review_count":1}' \
     --field required_signatures='{"enabled":false}' \
     --field enforce_admins='{"enabled":false}' \
     --field required_linear_history='{"enabled":false}' \
     --field allow_force_pushes='{"enabled":true}' \
     --field allow_deletions='{"enabled":false}' \
     --field block_creations='{"enabled":false}' \
     --field required_conversation_resolution='{"enabled":false}' \
     --field lock_branch='{"enabled":false}' \
     --field allow_fork_syncing='{"enabled":false}'
   ```

   **Branch Protection Rules Summary:**
   - **Pull Request Reviews**: 1 approval required
   - **Status Checks**: Strict mode enabled
   - **Force Pushes**: Allowed
   - **Branch Deletions**: Disabled
   - **Admin Enforcement**: Disabled (admins can bypass)

   **Manual Setup Alternative:**
   If CLI commands fail, manually configure in GitHub:
   1. Go to repository Settings → Branches
   2. Add rule for `main` branch
   3. Enable "Require a pull request before merging" (1 approval)
   4. Enable "Require status checks to pass before merging" (strict mode)
5. **Remove from Context Window** - Change `alwaysApply: true` to `alwaysApply: false` in the frontmatter of `.cursor/rules/template_setup.mdc`

## What NOT to Include in Template Initialization
- **Do NOT set up TaskMaster** - This is a separate workflow that requires explicit user request
- **Do NOT create PRDs** - Project Requirements Documents are separate from template setup
- **Do NOT copy `.env.example` to `.env`** - Only do this if user specifically requests TaskMaster CLI setup
- **Do NOT initialize git repository** - Template initialization is separate from git setup
- **Do NOT create tasks or project management files** - Focus only on template structure
