---
name: red
description: "TDD Red phase: write a failing test"
---

# Red Phase — Write a Failing Test

You are in the RED phase of TDD. Your job is to write exactly one failing test.

## Rules

1. **Write one test** that describes the next smallest unit of behavior to implement.
2. **Run the test** and confirm it fails. Show the failure output.
3. **Stop.** Do not write implementation code. Do not fix the test. The red phase is done when one new test fails.

## Process

1. Identify the next behavior to test — the simplest thing that is not yet covered.
2. Write the test in the appropriate `.spec.ts` file. If the file does not exist, create it.
3. Use `ng test --no-watch --include='**/<file>.spec.ts'` to run only the relevant test file.
4. Confirm the test fails with a clear, expected failure (compilation error or assertion failure).
5. Report: what the test expects, and why it fails.

## Guidelines

- One test per red phase. Do not write multiple tests at once.
- The test should be specific and descriptive — the test name documents the behavior.
- Mock external dependencies. Tests should be fast and isolated.
- Prefer testing public API behavior, not implementation details.
- If the file under test does not exist yet, the compilation error IS the red.
