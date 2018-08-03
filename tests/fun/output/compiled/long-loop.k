module COMPILED
    imports MAP
    imports INT

    rule <FUN>
           <k>
             letrec ( longLoop = fun ( 0 -> fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases ) and .Bindings in longLoop V0 0 0 0
          => muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases ) ~> #arg ( V0 )
           </k>
           <extraComp>
             .
          => #arg ( 0 ) ~> #arg ( 0 ) ~> #arg ( 0 ) ~> setEnv ( .Map )
           </extraComp>
           <env>
             .Map
          => longLoop |-> 0
           </env>
           <store>
             .Map
          => 0 |-> muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases )
           </store>
           <nextLoc>
             0
          => 1
           </nextLoc>
         </FUN>

    rule <FUN>
           <k>
             muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases ) ~> #arg ( V1 )
          => muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases ) ~> #arg ( V1 -Int 1 )
           </k>
           <extraComp>
             #arg ( 0 ) ~> #arg ( 0 ) ~> #arg ( 0 )
          ~> setEnv ( .Map )
          => #arg ( 1 ) ~> #arg ( 130 ) ~> #arg ( 1500 )
          ~> setEnv ( c |-> 1 longLoop |-> 0 x2 |-> 6 x |-> 2 y2 |-> 5 y3 |-> 8 y |-> 3 z2 |-> 7 z3 |-> 9 z |-> 4 )
          ~> setEnv ( c |-> 1 longLoop |-> 0 x2 |-> 6 x |-> 2 y2 |-> 5 y3 |-> 8 y |-> 3 z2 |-> 7 z |-> 4 )
          ~> setEnv ( c |-> 1 longLoop |-> 0 x2 |-> 6 x |-> 2 y2 |-> 5 y |-> 3 z2 |-> 7 z |-> 4 )
          ~> setEnv ( c |-> 1 longLoop |-> 0 x2 |-> 6 x |-> 2 y2 |-> 5 y |-> 3 z |-> 4 )
          ~> setEnv ( c |-> 1 longLoop |-> 0 x |-> 2 y2 |-> 5 y |-> 3 z |-> 4 )
          ~> setEnv ( c |-> 1 longLoop |-> 0 x |-> 2 y |-> 3 z |-> 4 )
          ~> setEnv ( longLoop |-> 0 )
          ~> setEnv ( .Map )
           </extraComp>
           <env>
             longLoop |-> 0
          => c2 |-> 10
             c |-> 1
             longLoop |-> 0
             x2 |-> 6
             x |-> 2
             y2 |-> 5
             y3 |-> 8
             y |-> 3
             z2 |-> 7
             z3 |-> 9
             z |-> 4
           </env>
           <store>
             0 |-> muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases )
          => 0 |-> muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases )
             1 |-> V1
             2 |-> 0
             3 |-> 0
             4 |-> 0
             5 |-> 100
             6 |-> 1
             7 |-> 0
             8 |-> 130
             9 |-> 1500
             10 |-> V1 -Int 1
           </store>
           <nextLoc>
             1
          => 11
           </nextLoc>
         </FUN>
      requires notBool (0 ==K V1)

    rule <FUN>
           <k>
             muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases ) ~> #arg ( 0 )
          => 0
           </k>
           <extraComp>
             #arg ( 0 ) ~> #arg ( 0 ) ~> #arg ( 0 ) ~> setEnv ( .Map )
          => .
           </extraComp>
           <env>
          => longLoop |-> 0
             .Map
           </env>
           <store>
             0 |-> muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases )
          => 0 |-> muclosure ( longLoop |-> 0 , 0 -> ( fun ( x -> fun ( y -> fun ( z -> 0 ) | .Cases ) | .Cases ) | .Cases ) | c -> ( fun ( x -> fun ( y -> fun ( z -> let ( y2 = y * x + ( 100 - z ) ) and .Bindings in let ( x2 = x + 1 ) and .Bindings in let ( z2 = z * z * x2 ) and .Bindings in let ( y3 = 30 + y2 ) and .Bindings in let ( z3 = 15 * y2 ) and .Bindings in let ( c2 = c - 1 ) and .Bindings in longLoop c2 x2 y3 z3 ) | .Cases ) | .Cases ) | .Cases ) | .Cases )
             1 |-> 0
             2 |-> 0
             3 |-> 0
           </store>
           <nextLoc>
             1
          => 4
           </nextLoc>
         </FUN>
endmodule
