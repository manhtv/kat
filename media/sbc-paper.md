---
geometry: margin=2.5cm
title: Semantics Based Compilation
date: \today
---

\newcommand{\K}{\ensuremath{\mathbb{K}}}

Abstract
--------

Implementing compilers takes a long time and is error prone; it's easy to introduce differences in behaviour between various compilers.
Instead, we can build derive an initial compiler directly from a formal operational semantics using partial evaluation.
This approach is correct by construction, if you trust the formal specification then the derived compiler is correct.

We demonstrate this on two languages, IMP (a simple imperative language), and FUN (a functional language with algebraic datatypes) using the \K{} Framework.
Over our benchmarks, we see an average ###NIMP###-times performance gain for the IMP language, and an average ###NFUN###-times performance gain for the FUN language.
Our tool naturally performs many optimizations such as expression-folding and dead-code elimination due to the nature of symbolic execution.

In addition to improving the execution performance of the programs, the partially evaluated definition can be inspected for errant behaviours.
This partially evaluated definition serves as the initial specification of the program, which can be refined and then run through the \K{} prover as needed.

We believe this solidly demonstrates that we can take a semantics-first approach to tooling around a programming language.
With performance approaching that of hand crafted compilers, there is less need for ad-hoc models of programming languages built into large compiler frameworks.

Introduction
============

### Motivation

-   Discuss bugs in compilers and differences in behaviour between multiple compilers (cite RV-Match?).

-   Discuss semantics-first approach, how we can avoid a lot of the confusing differences between ad-hoc models by deriving everything from a single specification.

### Related Work

-   Work on Order-Sorted Equational partial evaluation by Santiago Escobar.

-   Dig up other work on partial evaluation.

Background
==========

### Partial Evaluation

-   Discuss projecting transition systems, how we can do two types of partial evaluation using symbolic execution:

    -   Compress chains (paths with no branching) to a single transition - performance improvement.

    -   Remove parts of transition systems which are not used (eg. if I never use `struct` in a C program, I don't need the semantics of `struct`).
        Can significantly reduce the branching factor of the transition system.

### \K{} Framework

-   Operational semantics framework 

![\K{} Overview **TODO**: Highlight "Compiler" Bubble](k-overview.png)

Methodology
===========

Overview
--------

-   Partially evaluate the operational semantics of a language on a particular program $P$.

-   For \K{}, we'll use the same symbolic execution engine used by the \K{} prover (**TODO**: cite OOPSLA'16).

-   To ensure termination, we will only execute each code-point once, but on a general enough input to ensure every behaviour is covered.

-   End up with sequence of transitions from configurations to configurations, which can be expressed naturally as a \K{} definition where each transition is a rule.

-   New definition has a transition for every basic block of code, can directly execute the original program (but no other programs in the language[^fewOtherLanguages]).

[^fewOtherLanguages]: Actually *few* other programs in the language, as we take an overapproximation of the behaviour.

Examples
--------

### IMP: A simple imperative language

Configuration has two cells, the `<k>` cell for holding the remainder of the program and the `<mem>` cell for storing the mapping between program variables and values.

```k
    configuration
      <imp>
        <k>   $PGM:Stmt </k>
        <mem> .Map      </mem>
      </imp>
```

Example rules for this language are `lookup` and `assignment`, which interact with the `<mem>` cell.

```k
    rule <k> X:Id        => I ... </k> <mem> ... X |-> I        ... </mem>
    rule <k> X = I:Int ; => . ... </k> <mem> ... X |-> (_ => I) ... </mem>
```

An example program in this language is `sum.imp`, which sums the numbers from 1 to 10 stores the result in a variable `s`.

```imp
int n , s ;
s = 0 ;
n = 10 ;
while (0 <= n) {
  s = s + n ;
  n = n + -1 ;
}
```

We would like to summarize this program as the following transition system:

![IMP program `sum.imp` transition system **TODO**](imp-sum-transition.png)

The following observations about IMP are important for proving that the SBC algorithm presented is correct:

1.  All variables are introduced at the beginning of a program.

2.  The branching rules (`iftrue`, `iffalse`, `divzero`, and `divnonzero`) are only dependent on the contents of the `mem` cell.

3.  On any infinite execution of an IMP program, the following `whileIMP` rule will fire infinitely often:

    ```k
        syntax Stmt ::= "while" "(" BExp ")" Block
     // ------------------------------------------
        rule <k> while (B) STMT => if (B) {STMT while (B) STMT} else {} ... </k>
    ```

### FUN: A simple functional language

Configuration has three cells: the `<k>` cell for the current computation, the `<env>` cell for the current environment, and the `<envs>` cell for past environments.

```k
    configuration
      <FUN>
        <k>    $PGM:Exp </k>
        <env>  .Map     </env>
        <envs> .List    </envs>
      </FUN>
```

This language includes polymorphic algebraic data-types and supports pattern matching over said data-types.
The function application operator is juxstaposition (similar to Haskell), and algebraic datatypes have constructors that start with uppercase identifiers.
FUN is higher-order, and partial application of both constructors and functions is supported.
The operational semantics assumes that the input program has already been type-checked[^typeErasure].

[^typeErasure]: **TODO** Mumble mumble, something about type erasure.

Some example programs in this language are as follows:

-   Simple sum from 1 to 10:

    ```fun
    letrec sum = fun 0 -> 0
                 |   n -> n + sum (n - 1)
    in sum 10
    ```

-   Folding over a tree data-type:

    ```fun
    datatype 'a tree = Leaf | Tree ('a tree) 'a ('a tree)

    let g x y z = x + y + z
     in letrec foldtree f b = fun Leaf                -> b
                              |   (Tree left n right) -> f n (foldtree f b left) (foldtree f b right)
            in foldtree g 0 (Tree (Tree (Tree Leaf 3 Leaf) 6 (Tree Leaf 21 Leaf)) 1 (Tree Leaf 11 Leaf))
    ```

    which folds the following tree:

    ```
        1
       / \
      6   11
     / \
    3  21
    ```

    into the value `42` using a `foldtree` function for polymorphic datatype `'a tree`.

Each step of the pattern-matching procedure creates a branching point in execution, giving a high branching factor to FUN programs which use pattern-matching.

Looping happens when a function (`f p1 ... pn -> E`) defined in a recursive `letrec` is invoked.
When beginning an execution of the body `E` begins, all of the bindings from the recursive environment are added to the current environment.

The following observations about FUN are important for proving that the SBC algorithm presented is correct:

1.  On any infinite execution of a FUN program, the following `recCall` rule will fire infinitely often:

    ```k
        syntax Exp ::= mu ( Names , Exp )
     // ---------------------------------
        rule <k> mu ( .Names , E ) => E ... </k>
    ```

    This rule fires after all the bindings of the recursive environment have been added to the new environment.

Algorithm
---------

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