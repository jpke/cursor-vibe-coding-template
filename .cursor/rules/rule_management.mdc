---
description: "Structure and formatting guidelines for Cursor rule files"
globs: ".cursor/rules/*.mdc"
alwaysApply: false
---

## Rule Structure Requirements
```markdown
---
description: "Clear, one-line description of what the rule enforces"
globs: ["path/to/files/*.ext", "other/path/**/*"]
alwaysApply: boolean
---

- **Main Points in Bold**
  - Sub-points with details
  - Examples and explanations
```

## File References
- Use `[filename](mdc:path/to/file)` to reference files
- Example: `[prisma.mdc](mdc:.cursor/rules/prisma.mdc)` for rule references
- Example: `[schema.prisma](mdc:prisma/schema.prisma)` for code references

## Code Examples
- Use language-specific code blocks with DO/DON'T patterns:
```typescript
// ✅ DO: Show good examples
const goodExample = true;

// ❌ DON'T: Show anti-patterns
const badExample = false;
```

## Rule Content Guidelines
- Start with high-level overview
- Include specific, actionable requirements
- Show examples of correct implementation
- Reference existing code when possible
- Keep rules DRY by referencing other rules
- Use bullet points for clarity
- Include both DO and DON'T examples

## Example Pattern Recognition
```typescript
// If you see repeated patterns like:
const data = await prisma.user.findMany({
  select: { id: true, email: true },
  where: { status: 'ACTIVE' }
});

// Consider adding to [prisma.mdc](mdc:.cursor/rules/prisma.mdc):
// - Standard select fields
// - Common where conditions
// - Performance optimization patterns
```

Follow this structure for proper rule formatting and maintain consistency across all rule files.
