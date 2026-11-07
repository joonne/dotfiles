---
name: ddd
description: "Design a module using Domain-Driven Design, Hexagonal Architecture, and Functional Programming"
---

# DDD / Hexagonal Architecture Design (Functional Style)

You are designing or refactoring a module using Domain-Driven Design principles, Hexagonal (Ports & Adapters) Architecture, and a functional programming mindset. This skill is language-agnostic — apply the idioms of whatever language the project uses.

## Rules

1. **Start from the domain.** Identify the core domain concepts and types before touching infrastructure.
2. **Model with data and pure functions.** Domain types are immutable product types (records/structs). Domain logic is pure functions that transform data — no mutable state, no class hierarchies.
3. **Ports are function types.** A port is a function signature (type alias, interface, or trait). Adapters are functions or closures that inhabit those types.
4. **Dependencies are function arguments.** Instead of injecting objects, pass the functions the domain needs as arguments. Composition happens at the edges.
5. **Dependencies point inward.** Domain code never imports from adapters or infrastructure. Adapters depend on domain types, not the other way around.
6. **No framework in the domain.** The domain layer has zero dependencies on web frameworks, ORMs, or external libraries.
7. **Pure core, impure shell.** All IO (database, network, filesystem) lives in adapters. Domain functions are referentially transparent — same input, same output, no side effects.

## Process

1. **Identify the Bounded Context.** What is the scope of this module? Define the ubiquitous language — the nouns and verbs that the domain experts use.

2. **Model the Domain with Types.**
   - **Value Objects**: immutable product types, compared by structural equality, validate invariants on construction (parse, don't validate). E.g., `ContentHash`, `SourceUri`, `ChunkSize`.
   - **Entities**: immutable records with an identity field. Updates produce new instances. E.g., `Document`, `Conversation`.
   - **Aggregates**: a record that groups related entities/value objects. Consistency boundary. E.g., a `Document` with its list of `Chunk`.
   - **Domain Events**: immutable records representing something that happened. E.g., `DocumentIngested { doc_id, content_hash, chunk_count }`.
   - **Sum types for state**: use tagged unions / discriminated unions / ADTs to make illegal states unrepresentable. E.g., `IngestResult = Created | Updated | Unchanged`.

3. **Write Domain Logic as Pure Functions.**
   - Functions take domain types in, return domain types out. No IO, no side effects.
   - Use `Result<T, E>` / `Either<L, R>` monads instead of exceptions for expected failures. Reserve exceptions/panics for truly unexpected errors.
   - Use `Option<T>` / `Maybe<T>` instead of null/None for absent values.
   - Compose small functions into pipelines — think `pipe(data, f, g, h)` or `data |> f |> g |> h` over deep call stacks.
   - Domain functions never call adapters directly — they return data describing what should happen (decisions, commands, events), and the application layer interprets it.

4. **Define Ports as Function Types.**
   - **Inbound ports (driving)**: use case functions. They receive outbound port functions as arguments.
   - **Outbound ports (driven)**: function type aliases describing the signature the domain expects. E.g.:
     ```
     FindDocument : SourceUri -> Async<Option<Document>>
     StoreChunks  : DocumentId -> List<Chunk> -> List<Embedding> -> Async<Unit>
     ```

5. **Design Adapters as Functions.**
   - Each adapter is a function or a factory (closure) that returns a function satisfying a port type.
   - E.g., `make_sqlite_find_document(db_path) -> FindDocument` returns a closure that queries SQLite.
   - Adapters are the impure shell — they perform IO, handle infrastructure errors, and translate between domain types and infrastructure representations.

6. **Compose at the Boundary.**
   - The application entry point wires adapters to ports via function application. No DI container — just partial application or closure construction at the top level.
   ```
   -- Composition root
   find_doc    = make_sqlite_find_document(db_path)
   store_chunks = make_chroma_store_chunks(chroma_host, collection)
   embed       = make_embedding_fn(model_name)

   -- Wire into use case
   result = ingest_document(find_doc, store_chunks, embed, request)
   ```

7. **Define the directory structure.**
   ```
   module/
     domain/
       types          # Value Objects, Entities, Aggregates (immutable records)
       events         # Domain Events (immutable records)
       ports          # Port type aliases (function signatures)
       logic          # Pure functions — domain rules, transformations
     application/
       use_cases      # Use case functions — orchestrate ports, no business logic
     adapters/
       inbound/       # Driving adapters (HTTP handlers, CLI, voice)
       outbound/      # Driven adapters (DB, APIs, vector stores)
   ```

8. **Validate the design.**
   - Can you test every use case by passing stub functions? If not, the domain has a leaked dependency.
   - Can you swap an adapter by passing a different function? If not, the boundary is wrong.
   - Are all domain functions referentially transparent? If they perform IO or mutate state, push that to an adapter.
   - Does the domain use its own types everywhere, or does it leak infrastructure types? If the latter, add a mapping in the adapter.

## Output

Present the design as:

1. **Ubiquitous Language** — glossary of domain terms.
2. **Domain Types** — value objects, entities, aggregates as immutable records with key fields.
3. **Pure Functions** — domain logic with signatures showing inputs and outputs.
4. **Ports** — function type aliases for inbound and outbound boundaries.
5. **Adapters** — concrete functions mapped to ports.
6. **Composition** — how ports and adapters are wired at the boundary.
7. **Directory Structure** — proposed file layout.

## Guidelines

- **Immutable by default.** All domain types are immutable. Updates return new instances.
- **Parse, don't validate.** Value objects enforce invariants at construction via smart constructors. Once constructed, they are guaranteed valid.
- **Prefer functions over objects.** An object with one method is a function. An object with a constructor and one method is a closure.
- **No inheritance for polymorphism.** Use sum types (tagged unions / ADTs) and pattern matching instead.
- **Total functions.** Every function handles every possible input. Use `Result` / `Either` for recoverable errors, `Option` / `Maybe` for absence. No partial functions, no unchecked nulls.
- **Small composable functions.** Each function does one thing. Compose them via pipelines, map/flatMap, or applicative combinators.
- **Functors and monads where natural.** `Option`, `Result`, `Async`/`Task` are monads — use `map` and `flatMap`/`bind` to compose them rather than unwrapping at every step. Don't force category theory vocabulary — use it when it simplifies the design.
- **Use domain events to decouple bounded contexts** rather than direct calls between modules.
- **Application use cases orchestrate.** They thread port functions through domain logic — they contain no business rules themselves.
- **Incremental adoption.** When refactoring existing code toward this style, extract one pure function at a time, introduce one port at a time.
