---
name: green
description: "TDD Green phase: make the failing test pass"
---

# Green Phase — Make the Test Pass

You are in the GREEN phase of TDD. Your job is to write the minimal code to make the failing test pass.

## Rules

1. **Write only enough code** to make the currently failing test pass. Nothing more.
2. **Run the test** and confirm it passes. Show the output.
3. **Run the full verification suite** to confirm no regressions or quality issues.
4. **Stop.** Do not refactor. Do not add features. The green phase is done when all checks pass.

## Process

1. Look at the failing test from the red phase.
2. Write the simplest implementation that makes it pass. Hardcoded values, obvious implementations, and shortcuts are fine — refactoring comes later.
3. Run the specific test file first: `ng test --no-watch --include='**/<file>.spec.ts'`.
4. If it passes, run the full verification:
   - `ng test --no-watch` — full test suite, no regressions
   - `npm run typecheck` — no type errors
   - `npm run lint` — no lint violations
   - `npm run prettier:check` — formatting is clean
5. Fix any issues from the verification steps before declaring green.
6. Report: what you implemented, and that all checks pass.

## Guidelines

- Resist the urge to write "good" code. The goal is green, not elegant.
- If making the test pass requires changes to multiple files, that is fine — but only change what the test demands.
- If the test still fails, iterate on the implementation until it passes.
- Do not write new tests in the green phase.
- Do not refactor in the green phase.
- If lint or format checks fail, fix only the introduced code — do not fix pre-existing violations.
