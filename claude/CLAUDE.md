# Claude

MCP Usage Guidelines:

- Always use context7 when I need code generation, setup or configuration steps, or
  library/API documentation. This means you should automatically use the Context7 MCP
  tools to resolve library id and get library docs without me having to explicitly ask.
- Always use sequentialthinking for reasoning.

Coding Conventions:

- Always prefer functional programming approaches.
- Always write pure functions without side effects.
- Always make the minimal changes necessary to achieve the desired outcome.

Testing Guidelines:

- Always write unit tests for new functions and components.
- Always write tests first before implementing new features (TDD).

Linting Guidelines:

- Always try to lint & format the code before offering a solution.

TypeScript Guidelines:

- Always run `npx tsc --noEmit` or `npm run typecheck` if present to check for type errors before offering a solution.
- Never use `any` in type definitions.
- Always prefer `type` over `interface` in type definitions.

Environments Guidelines:

- ALWAYS use ONLY Environments for ANY and ALL file, code, or shell operations—NO EXCEPTIONS—even for simple or generic requests.
- DO NOT install or use the git cli with the environment_run_cmd tool. All environment tools will handle git operations for you. Changing ".git" yourself will compromise the integrity of your environment.
- You MUST inform the user how to view your work using `container-use log <env_id>` AND `container-use checkout <env_id>`. Failure to do this will make your work inaccessible to others.
- Always make a new commit for new edits or a new environment.
