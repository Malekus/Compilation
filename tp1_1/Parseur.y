{
module Parseur where

import Lexeur
import Control.Monad.Except
}

%tokentype { Token }

%monad { Except String } { (>>=) } { return }
%error { \_ -> throwError "Ceci n'est pas une expression arithmetique\n" }

%name parseExpr

%token
  '+'     { PLUS }
  '-'     { MOINS }
  '*'     { MULT }
  '/'     { DIV }
  '('     { PARENTG }
  ')'     { PARENTD }
  NOMBRE  { NOMBRE }
  '%'     { MODULO }
  FLOTTANT     { FLOTTANT }
%%


mainNT     : expression        {}

expression : expression '+' terme  {}
           | expression '-' terme  {}
           | terme                 {}

terme      : terme '*' facteur     {}
           | terme '/' facteur     {}
           | terme '%' facteur     {}
           | facteur               {}

facteur    : '(' expression ')'    {}
           | '-' facteur           {}
           | NOMBRE                {}
           | FLOTTANT              {}


{

}
