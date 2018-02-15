{
module Parseur where

import Lexeur
import AST
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
  '%'     { MODULO }
  '('     { PARENTG }
  ')'     { PARENTD }
  NOMBRE  { NOMBRE $$ }
  FLOAT  { FLOAT $$ }
%%


mainNT     : expression            {$1}

expression : expression '+' terme  { Plus  $1 $3 }
           | expression '-' terme  { Moins $1 $3 }
           | terme                 { $1 }

terme      : terme '*' facteur     { Mult  $1 $3 }
           | terme '/' facteur     { Div   $1 $3 }
           | terme '%' facteur     { Mod   $1 $3 }
           | facteur               { $1 }

facteur    : '(' expression ')'    { $2 }
           | '-' facteur           { Neg $2 }
           | NOMBRE                { Num $1 }
           | FLOAT                 { Float $1 }


{

}
