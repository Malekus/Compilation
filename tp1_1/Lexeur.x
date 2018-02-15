{
module Lexeur where
import Control.Monad.Except
}

%wrapper "basic"


@nombre = [0-9]+
@espace = [\ \t \n]
@flottant = @nombre"."[0-9]*




tokens :-
  @nombre     { \_-> NOMBRE  }
  \+          { \_-> PLUS    }
  \-          { \_-> MOINS   }
  \*          { \_-> MULT    }
  \/          { \_-> DIV     }
  \(          { \_-> PARENTG }
  \)          { \_-> PARENTD }
  @espace     ;
  \%          { \_-> MODULO  }
  @flottant   { \_-> FLOTTANT}

{

data Token =
       NOMBRE
     | PLUS
     | MOINS
     | MULT
     | DIV
     | PARENTG
     | PARENTD
     | MODULO
     | FLOTTANT
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
