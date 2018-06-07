// Made from 3e50cea79068bc3d648203f4f720176b.out

// Changes necessary:
// -   add imports of MAP and INT
// -   add `$N:Int ~> INIT` to <k> cell to specify that we want to pass `N` on command line, and then go to `INIT` (also update `mem` in rule to use `N`)
// -   add productions of sort `SBCBasicBlock` which are just program states as Terminals
// -   wrap the Identifiers in the <mem> cell as strings (bug in K?)
// -   format the requires clauses as proper `Bool`
// -   create the following map of program states:
//     -   `INIT |-> int n , s , .Ids ; s = 0 ; n = 10 ; while ( 0 <= n ) { s = s + n ; n = n + -1 ; }`
//     -   `LOOP |-> while ( 0 <= n ) { s = s + n ; n = n + -1 ; }`
//     -   `END  |-> .`
// -   create the constants `n` and `s` for the map keys
// -   unify LHS and RHS of rules as much as possible

module COMPILED
    imports MAP
    imports INT

    configuration
      <imp>
        <k> $N:Int ~> INIT </k>
        <mem> .Map </mem>
      </imp>

    syntax K ::= MapKeys
    syntax MapKeys ::= "n" | "s"
 // ----------------------------

    syntax SBCBasicBlock ::= "INIT" | "LOOP" | "END"
 // ------------------------------------------------
    rule <imp>
           <k>
             N:Int ~> INIT => LOOP
           </k>
           <mem>
             .Map => n |-> N s |-> 0
           </mem>
         </imp>

    rule <imp>
           <k>
             LOOP => END
           </k>
           <mem>
             n |-> V1
             s |-> V2
           </mem>
         </imp>
      requires notBool (0 <=Int V1)

    rule <imp>
           <k>
             LOOP
           </k>
           <mem>
             n |-> (V3 => V3 +Int -1)
             s |-> (V4 => V4 +Int V3)
           </mem>
         </imp>
      requires 0 <=Int V3
endmodule
