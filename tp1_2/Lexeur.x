{
module Lexeur where
import Control.Monad.Except
}

%wrapper "basic"


@nombre = [0-9]+
@espace = [\ \t \n]
@float = @nombre"."[0-9]*



tokens :-
  @nombre     { \s-> NOMBRE (read s) }
  @float      { \s-> FLOAT (read s :: Float) }
  \+          { \_-> PLUS    }
  \-          { \_-> MOINS   }
  \*          { \_-> MULT    }
  \/          { \_-> DIV     }
  \%          { \_-> MODULO }
  \(          { \_-> PARENTG }
  \)          { \_-> PARENTD }
  @espace     ;


{

data Token =
       NOMBRE Int
     | FLOAT Float
     | PLUS
     | MOINS
     | MULT
     | DIV
     | MODULO
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
