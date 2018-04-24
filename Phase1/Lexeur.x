{
module Lexeur where
import Control.Monad.Except
}

%wrapper "basic"

$digit      = [0-9]
$octdig     = [0-7]
$hexdig     = [0-9A-Fa-f]
$special    = [\.\;\,\$\|\*\+\?\#\~\-\{\}\(\)\[\]\^\/]
$graphic    = $printable # $white

@nombre = [0-9]+
@espace = [\ \t \n]
@float = @nombre"."@nombre
@bool = "True" | "False"
@string = "'".[a-zA-Z0-9\ \t]+."'"
@variable = [a-z].[a-zA-Z0-9]*
@begin = "Begin"
@end = "End;"
@var = "Var"
@epsilon = "£"
@affectation = ":="
@if = "If"
@then = "Then"
@else = "Else"
@while = "While"
@do = "Do"
@for = "For"
@to = "To"
@writeln = "Writeln"
@and = "And"
@or = "Or"


tokens :-
  @nombre     { \s-> NOMBRE (read s :: Int) }
  @float      { \s-> FLOAT (read s :: Float) }
  @variable   { \s-> VARIABLE (show s :: String ) }
  @string     { \s-> STRING (show s :: String ) }
  @bool       { \s-> BOOLEAN (read s :: Bool) }
  @begin      { \_-> BEGIN }
  @end        { \_-> END }
  @var        { \_-> VAR }
  @epsilon    { \_-> EPSILON }
  @affectation { \_-> AFFECTATION }
  @if           { \_-> IF }
  @then         { \_-> THEN }
  @else         { \_-> ELSE }
  @while        { \_-> WHILE }
  @do           { \_-> DO }
  @for          { \_-> FOR }
  @to           { \_-> TO }
  @writeln      { \_-> WRITELN }
  @espace     ;
  @and          { \_-> AND }
  @or           { \_-> OR }
  \+          { \_-> PLUS    }
  \-          { \_-> MOINS   }
  \*          { \_-> MULT    }
  \/          { \_-> DIV     }
  \%          { \_-> MOD     }
  \:          { \_-> DEUXPOINTS }
  \(          { \_-> PARENTG }
  \)          { \_-> PARENTD }
  \=          { \_-> EQUAL }
  \,          { \_-> VIRGULE }
  \¬          { \_-> NOT }
  \;          { \_-> POINTVIRGULE }
  \<>         { \_-> DIFFERENT }
  \>          { \_-> SUPERIEUR }
  \<          { \_-> INFERIEUR }
  \>=         { \_-> SUPERIEUREQ }
  \<=         { \_-> INFERIEUREQ }

{
data Token =
       NOMBRE Int
     | FLOAT Float
     | BOOLEAN Bool
     | STRING String
     | VARIABLE String
     | NOT
     | PLUS
     | MOINS
     | MULT
     | EQUAL
     | DIV
     | MOD
     | VIRGULE
     | PARENTG
     | PARENTD
     | POINTVIRGULE
     | DEUXPOINTS
     | DIFFERENT
     | SUPERIEUR
     | INFERIEUR
     | INFERIEUREQ
     | SUPERIEUREQ
     | AND
     | OR
     | VAR
     | BEGIN
     | END
     | EPSILON
     | AFFECTATION
     | IF
     | THEN
     | ELSE
     | WHILE
     | DO
     | FOR
     | TO
     | WRITELN
    deriving (Eq, Show)

scanTokens :: String -> Except String [Token]
scanTokens prog = scanTokensAux ('\n',[],prog)                     -- le '\n' est un caractère par défault

scanTokensAux :: AlexInput -> Except String [Token]
scanTokensAux inp@(_,_,str) =
  case alexScan inp 0 of
    AlexEOF      -> return []
    AlexError _  -> throwError "ceci n'est pas une expression arithmetique"
    AlexSkip inp' _ -> scanTokensAux inp'
    AlexToken inp' n act -> do
      let rest = act (take n str)                                  -- "take len str" donne le lexem lu
      res <- scanTokensAux inp'
      return (rest : res)




}
