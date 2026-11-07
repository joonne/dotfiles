---
name: refactor
description: "TDD Refactor phase: improve code while keeping tests green"
---

# Refactor Phase — Improve the Code

You are in the REFACTOR phase of TDD. Your job is to improve the code without changing behavior.

## Rules

1. **Improve structure, readability, or design** of the implementation code, the test code, or both.
2. **Run the full test suite** after each change. Use `ng test --no-watch`.
3. **All tests must stay green.** If a test breaks, undo the change and try a different approach.
4. **Stop** when the code is clean and you have no further improvements. Do not add new behavior.

## Process

1. Review the current implementation and tests for improvement opportunities.
2. Apply one refactoring at a time. Examples:
   - Extract a function or method
   - Rename for clarity
   - Remove duplication
   - Simplify conditionals
   - Improve type signatures
3. Run the full suite after each change: `ng test --no-watch`.
4. If tests break, revert and try differently.
5. Report: what you changed and why, and that all tests are still green.

## Guidelines

- Refactor both production code and test code.
- Do not add new functionality or new tests for untested behavior.
- Small steps — one refactoring at a time, verified by a test run.
- If there is nothing to refactor, say so. Not every cycle needs a refactor phase.
- Run `npm run typecheck` to verify types are clean after structural changes.
