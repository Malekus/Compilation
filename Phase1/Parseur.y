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
  '('     { PARENTG }
  ')'     { PARENTD }
  '%'     { MOD }
  NOMBRE  { NOMBRE $$ }
  FLOAT  { FLOAT $$ }
  BOOLEAN { BOOLEAN $$ }
  '¬'     { NOT }
  ':='    { VARIABLE }
  '='    { EQUAL }
  STRING { STRING $$ }

%%


mainNT     : expression            {$1}

expression :  NOMBRE                        { Num $1 }
           |  BOOLEAN                       { Boolean $1 }
           |  STRING                        { String $1 }
           |  FLOAT                         { Float $1 }
           |  '(' expression ')'            { $2 }
           |  '-' expression                { Neg $2 }
           |  expression '+' expression     { Plus $1 $3 }
           |  expression '-' expression     { Moins $1 $3 }
           |  expression '*' expression     { Mult $1 $3 }
           |  expression '/' expression     { Div $1 $3 }
           |  expression '%' expression     { Mod $1 $3 }
           |  expression '=' expression     { Equal $1 $3 }
           |  '¬' expression                { Not $2 }
           |  expression ':=' expression    { Variable $1 $3 }

{

}
