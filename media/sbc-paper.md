---
geometry: margin=2.5cm
title: Semantics Based Compilation
date: \today
---

Abstract
--------

-   Implementing compilers takes a long time and is error prone.
    Easy to introduce differences in behaviour between various compilers.

-   Instead build a formal operational semantics and get an initial compiler directly from the specification using partial evaluation.
    This approach is correct by construction, if you trust the formal specification then the derived compiler is correct.

-   We demonstrate this on two languages, IMP (a simple imperative language), and FUN (a functional language with algebraic datatypes) using the K Framework.
    Over our benchmarks, we see an average ###NIMP###-times performance gain for the IMP language, and an average ###NFUN###-times performance gain for the FUN language.
    Our tool naturally performs many optimizations such as expression-folding and dead-code elimination due to the nature of symbolic execution.

-   In addition to improving the execution performance of the programs, the partially evaluated definition can be inspected for errant behaviours.
    This partially evaluated definition serves as the initial specification of the program, which can be refined and then run through the K prover as needed.

-   We believe this solidly demonstrates that we can take a semantics-first approach to tooling around a programming language.
    With performance approaching that of hand crafted compilers, there is less and less need for ad-hoc models of programming languages built into large compiler frameworks.

Introduction
============

-   Discuss bugs in compilers and differences in behaviour between multiple compilers (cite RV-Match?).

-   Discuss semantics-first approach, how we can avoid a lot of the confusing differences between ad-hoc models by deriving everything from a single specification.

Background
==========

### Partial Evaluation

-   Work on Order-Sorted Equational partial evaluation by Santiago Escobar.

-   Dig up other work on partial evaluation.

-   Discuss projecting transition systems, how we can do two types of partial evaluation using symbolic execution:

    -   Compress chains (paths with no branching) to a single transition - performance improvement.

    -   Remove parts of transition systems which are not used (eg. if I never use `struct` in a C program, I don't need the semantics of `struct`).
        Can significantly reduce the branching factor of the transition system.

### K Framework

-   Operational semantics framework 

-   K picture with SBC bubble highlighted.

Methodology
===========

-   Start with a "goal" to motivate the approach, then go into the approach.

### Goal

-   Show example IMP `sum` program, and picture of automaton which we "hope" to partially evaluate it to.

### Approach

-   Evaluate every "code point"/basic-block a single time.

    -   Define basic block (once in the basic block, will execute it fully to end unconditionally).

    -   User tells us which rules are "branching" and which are "looping" (so that we know where basic blocks begin and end).

    -   Split state on branches.

-   What about loops?

    -   At loop head, need to "abstract" state so that the new symbolic state will cover all possible executions from that point.
        Ensures that we only execute each loop exactly once, but that this covers all paths.
        Abstraction operator is language specific (but *not* program specific), a little extra work for the builder of the semantics.

    -   When an execution path reaches a loop head, save off the execution path as a new transition in the partially evaluated definition.
        New definition only has three types of transitions in it:

        a.  `INIT => _`: Transition from the initial state to another state.

        b.  `LOOP_i => LOOP_j`: Transition from one loop head to another loop head (potentially the same loop head).

        c.  `_ => END`: Transition from a state in the transition system to an ending state.

        Nodes are not inserted for branching, as that would reduce potential dead-code elimination.

Example Languages
=================

### IMP

-   Show configuration and give idea of evaluation.

-   Show branching and looping rules.

-   Show abstraction operator and prove that it meets the property that "every execution path from a loop head will be covered by the abstracted state".

### FUN

-   Show configuration and give idea of evaluation.

-   Show branching and looping rules.

-   Show abstraction operator and prove that it meets the property that "every execution path from a loop head will be covered by the abstracted state".

Performance Evalutaion
======================

-   Explanation of performance gains, show that we can get arbitrary gains.

-   Chart of gains for looped programs where we drive the number of iterations up.

Specification Generation
========================

-   Start with SBCed definition of `sum`.

-   Show what a specification of `sum` looks like.

-   What changes are needed beyond the SBCed definition to get to a verified definition?

Conclusion
==========

-   It's great, use it!
