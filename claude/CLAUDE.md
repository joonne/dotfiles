# Claude

Always follow extreme programming best practices and principles in all code you write.

MCP Usage Guidelines:

Coding Conventions:

- Always write only code & tests, write documentation only if specifically requested.
- Always write code in red, green, refactor cycles using the `/red`, `/green`, `/refactor` skills.
- Always prefer functional programming approaches.
- Always write pure functions without side effects.
- Always make the minimal changes necessary to achieve the desired outcome.

Parse, Don't Validate:

- Always parse incoming data through typed decoders at system boundaries — never trust raw data with `as T` casts.
- Always keep IO layers pure (return raw untyped data) and compose parsing as a separate step at the call site.

Testing Guidelines:

- Always write unit tests for new functions and components.
- Always write tests first before implementing new features (TDD).

Linting Guidelines:

- Always try to lint & format the code before offering a solution.

TypeScript Guidelines:

- Always run `npx tsc --noEmit` or `npm run typecheck` if present to check for type errors before offering a solution.
- Never use `any` in type definitions.
- Always prefer `type` over `interface` in type definitions.

Increment Guidelines:

- Always break down all tasks into smaller increments.
- Always present the increments to me for approval before starting work.
- Always complete one increment fully before moving to the next and present the work for me.
