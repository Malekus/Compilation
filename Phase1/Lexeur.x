{
module Lexeur where
import Control.Monad.Except
}

%wrapper "basic"


@nombre = [0-9]+
@espace = [\ \t \n]
@float = @nombre"."@nombre
@bool = "True" | "False"
@string = [a-z]+
@type = "" | "" | ""
@variable = [a-z][a-zA-Z0-9]*

tokens :-
  @nombre     { \s-> NOMBRE (read s :: Int) }
  @float      { \s-> FLOAT (read s :: Float) }
  \+          { \_-> PLUS    }
  \-          { \_-> MOINS   }
  \*          { \_-> MULT    }
  \/          { \_-> DIV     }
  \%          { \_-> MOD     }
  \(          { \_-> PARENTG }
  \)          { \_-> PARENTD }
  \=          { \_-> EQUAL }
  \:=         { \_-> VARIABLE }
  @string     { \s-> STRING (show s :: [Char])}
  \¬          { \_-> NOT }
  @bool       { \s-> BOOLEAN (read s :: Bool) }
  @espace     ;



{

data Token =
       NOMBRE Int
     | FLOAT Float
     | BOOLEAN Bool
     | STRING [Char]
     | NOT
     | PLUS
     | MOINS
     | MULT
     | EQUAL
     | DIV
     | MOD
     | VARIABLE
     | PARENTG
     | PARENTD
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
