---
name: ddd-python
description: "Python idioms for applying /ddd — type mappings, port patterns, composition"
---

# DDD Python Idioms

Companion to `/ddd`. Maps the language-agnostic concepts to Python constructs.

## Type Mappings

| DDD / FP Concept | Python Construct |
|---|---|
| Immutable record | `@dataclass(frozen=True)` |
| Record update | `dataclasses.replace()` |
| Value Object invariants | `__post_init__` smart constructor |
| Sum type / ADT | `type Result = Ok | Err` union alias |
| Pattern matching | `match/case` |
| Option | `T \| None` |
| Immutable collection | `tuple[T, ...]` (not `list`) |
| Port (function type) | `type FindDoc = Callable[[SourceUri], Awaitable[Document \| None]]` |
| Adapter factory | Closure-returning function |
| Partial application | `functools.partial` |
| Composition root | FastAPI `lifespan` or `main()` wiring closures |

## Key Conventions

- `Callable` type aliases for ports; use `Protocol` with `__call__` only when a name improves readability.
- Adapter factories: `make_<infra>_<port>(config) -> PortType` returns a closure.
- `mypy --strict` to catch leaked `Any` and missing types.
- Follow `/red`, `/green`, `/refactor` cycle — stub ports with lambdas in tests.
