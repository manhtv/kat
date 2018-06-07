// Made from 48d1b417860ba96d40275543886c40ff.out

// `INIT  |-> int b , c , n , x , .Ids ; b = 2000 ; c = 0 ; n = 1 ; x = 0 ; while ( c <= b ) { n = b ; while ( 2 <= n ) { if ( n <= ( n / 2 ) * 2 ) { n = n / 2 ; } else { n = 3 * n + 1 ; } x = x + 1 ; } c = c + 1 ; }`
// `LOOP1 |-> while ( c <= b ) { n = c ; while ( 2 <= n ) { if ( n <= ( n / 2 ) * 2 ) { n = n / 2 ; } else { n = 3 * n + 1 ; } x = x + 1 ; } c = c + 1 ; }`
// `LOOP2 |-> while ( 2 <= n ) { if ( n <= ( n / 2 ) * 2 ) { n = n / 2 ; } else { n = 3 * n + 1 ; } x = x + 1 ; } ~> c = c + 1 ; ~> while ( c <= b ) { n = b ; while ( 2 <= n ) { if ( n <= ( n / 2 ) * 2 ) { n = n / 2 ; } else { n = 3 * n + 1 ; } x = x + 1 ; } c = c + 1 ; }`
// `END   |-> .`

module COMPILED
    imports MAP
    imports INT

    configuration
      <imp>
        <k> $N:Int ~> INIT </k>
        <mem> .Map </mem>
      </imp>

    syntax K ::= MapKeys
    syntax MapKeys ::= "b" | "c" | "n" | "x"
 // ----------------------------------------

    syntax SBCBasicBlock ::= "INIT" | "LOOP1" | "LOOP2" | "END"
 // -----------------------------------------------------------
    rule <imp>
           <k>
             N:Int ~> INIT => LOOP1
           </k>
           <mem>
             .Map => b |-> N c |-> 0 n |-> 1 x |-> 0
           </mem>
         </imp> 

    rule <imp>
           <k>
             LOOP1 => END
           </k>
           <mem>
             b |-> V0
             c |-> V1
             n |-> V2
             x |-> V3
           </mem>
         </imp>
      requires notBool (V1 <=Int V0)

    rule <imp>
           <k>
             LOOP1 => LOOP2
           </k>
           <mem>
             b |-> V4
             c |-> V5
             n |-> (V6 => V5)
             x |-> V7
           </mem>
         </imp>
      requires V5 <=Int V4

    rule <imp>
           <k>
             LOOP2 => LOOP1
           </k>
           <mem>
             b |-> V8
             c |-> (V9 => V9 +Int 1)
             n |-> V10
             x |-> V11
           </mem>
         </imp>
      requires notBool (2 <=Int V10)

    rule <imp>
           <k>
             LOOP2
           </k>
           <mem>
             b |-> V12
             c |-> V13
             n |-> (V14 => 3 *Int V14 +Int 1)
             x |-> (V15 => V15 +Int 1)
           </mem>
         </imp>
      requires 2 <=Int V14
       andBool notBool (V14 <=Int V14 /Int 2 *Int 2)

    rule <imp>
           <k>
             LOOP2
           </k>
           <mem>
             b |-> V16
             c |-> V17
             n |-> (V18 => V18 /Int 2)
             x |-> (V19 => V19 +Int 1)
           </mem>
         </imp>
      requires 2 <=Int V18
       andBool V18 <=Int V18 /Int 2 *Int 2
endmodule
