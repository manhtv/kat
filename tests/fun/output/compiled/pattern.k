module COMPILED
    imports INT
    imports MAP

    rule <FUN>
           <k>
             letrec ( length = fun [ .Exps ] -> 0 | [ h : t ] -> 1 + length [ t ] | .Cases ) and complex = fun Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases and cons h [ t ] = [ h : t ] and map f = fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases and .Bindings in map complex [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ]
          => muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases )
          ~> #apply ( map )
          ~> #arg ( [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] )
           </k>
           <env>
             .Map
          => complex |-> 1
             cons |-> 2
             length |-> 0
             map |-> 3
           </env>
           <store>
             .Map
          => 0 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , [ .Exps ] -> 0 | [ h : t ] -> 1 + length [ t ] | .Cases )
             1 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases )
             2 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , h [ t ] -> [ h : t ] | .Cases )
             3 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
           </store>
           <nextLoc>
             0
          => 4
           </nextLoc>

    rule <FUN>
           <k>
             muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases )
          ~> #apply ( map )
          ~> #arg ( [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] )
          => muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
          ~> #arg ( closure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases ) )
          ~> #arg ( [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] )
           </k>
           <env>
             complex |-> 1
             cons |-> 2
             length |-> 0
             map |-> 3
           </env>
           <store>
             0 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , [ .Exps ] -> 0 | [ h : t ] -> 1 + length [ t ] | .Cases )
             1 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases )
             2 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , h [ t ] -> [ h : t ] | .Cases )
             3 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
           </store>
           <nextLoc>
             4
           </nextLoc>

    rule <FUN>
           <k>
             muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
          ~> #arg ( closure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases ) )
          ~> #arg ( [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] )
          => matchResult ( .Names , .Exps )
          ~> #closure ( complex |-> 1 cons |-> 2 f |-> 4 length |-> 0 map |-> 3 , .Cases , [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] : .Exps )
          ~> #args ( [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] : .Exps )
          ~> setEnv ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 )
           </k>
           <env>
             complex |-> 1
             cons |-> 2
             length |-> 0
             map |-> 3
             (.Map => f |-> 4)
           </env>
           <store>
             0 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , [ .Exps ] -> 0 | [ h : t ] -> 1 + length [ t ] | .Cases )
             1 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases )
             2 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , h [ t ] -> [ h : t ] | .Cases )
             3 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
             (.Map => 4 |-> closure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases ) )
           </store>
           <nextLoc>
             4 => 5
           </nextLoc>
         </FUN>

    rule <FUN>
           <k>
             muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
          ~> #arg ( closure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases ) )
          ~> #arg ( [ Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] )
          => muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
          ~> #arg ( closure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases ) )
          ~> #arg ( [ Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps ] )
          ~> #apply ( cons ( f h ) )
          ~> setEnv ( complex |-> 1 cons |-> 2 f |-> 4 length |-> 0 map |-> 3 )
          ~> setEnv ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 )
           </k>
           <env>
             complex |-> 1
             cons |-> 2
             length |-> 0
             map |-> 3
             (.Map =>  f |-> 4
                       t |-> 5
                       h |-> 6
             )
           </env>
           <store>
             0 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , [ .Exps ] -> 0 | [ h : t ] -> 1 + length [ t ] | .Cases )
             1 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases )
             2 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , h [ t ] -> [ h : t ] | .Cases )
             3 |-> muclosure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , f -> ( fun [ .Exps ] -> [ .Exps ] | [ h : t ] -> cons ( f h ) ( map f [ t ] ) | .Cases ) | .Cases )
             (.Map => 4 |-> closure ( complex |-> 1 cons |-> 2 length |-> 0 map |-> 3 , Triple [ Pair h1 h2 : t ] l [ Pair a 2 : Pair 3 b : c ] -> Pair ( h2 + length [ t ] + b ) a | ( Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : x : c ] ) -> x | default -> Pair 0 0 | .Cases )
                      5 |-> Triple [ .Exps ] [ .Exps ] [ Pair 7 2 : Pair 0 1 : Pair -1 -1 : .Exps ] : Triple [ .Exps ] [ .Exps ] [ .Exps ] : .Exps
                      6 |-> Triple [ Pair 8 7 : .Exps ] [ .Exps ] [ Pair 9 2 : Pair 3 3 : Pair 2 2 : .Exps ]
             )
           </store>
           <nextLoc>
             4 => 7
           </nextLoc>
         </FUN>
endmodule
