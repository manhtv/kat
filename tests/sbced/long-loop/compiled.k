// Made from 07e95bf0460f802f9e6d2f42a8119ccd.out

// `INIT |-> int x , y , z , c , b , .Ids ; x = 0 ; y = 0 ; z = 0 ; c = 0 ; b = 50 ; while ( c <= b ) { y = y * x + ( 100 - z ) ; x = x + 1 ; z = z * z * x ; y = 30 + y ; z = 15 * y ; c = c + 1 ; }`
// `LOOP |-> while ( c <= b ) { y = y * x + ( 100 - z ) ; x = x + 1 ; z = z * z * x ; y = 30 + y ; z = 15 * y ; c = c + 1 ; }`
// `END  |-> .`

module COMPILED
    imports MAP
    imports INT

    configuration
      <imp>
        <k> $N:Int ~> INIT </k>
        <mem> .Map </mem>
      </imp>

    syntax K ::= MapKeys
    syntax MapKeys ::= "x" | "y" | "z" | "c" | "b"
 // ----------------------------------------------

    syntax SBCBasicBlock ::= "INIT" | "LOOP" | "END"
 // ------------------------------------------------
    rule <imp>
          <k>
            N:Int ~> INIT => LOOP
          </k>
          <mem>
            .Map => b |-> N c |-> 0 x |-> 0 y |-> 0 z |-> 0
          </mem>
        </imp>

    rule <imp>
          <k>
            LOOP => END
          </k>
          <mem>
            b |-> V0
            c |-> V1
            x |-> V2
            y |-> V3
            z |-> V4
          </mem>
        </imp>
      requires notBool(V1 <=Int V0)

    rule <imp>
           <k>
             LOOP
           </k>
           <mem>
             b |-> V5
             c |-> (V6 => V6 +Int 1)
             x |-> (V7 => V7 +Int 1)
             y |-> (V8 => 30 +Int ( V8 *Int V7 +Int ( 100 -Int V9 )))
             z |-> (V9 => 15 *Int ( 30 +Int ( V8 *Int V7 +Int ( 100 -Int V9 ))))
           </mem>
         </imp>
      requires V6 <=Int V5
endmodule
