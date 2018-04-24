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
  '+'       { PLUS }
  '-'       { MOINS }
  '*'       { MULT }
  '/'       { DIV }
  '('       { PARENTG }
  ')'       { PARENTD }
  '%'       { MOD }
  '¬'       { NOT }
  '='       { EQUAL }
  ','       { VIRGULE }
  ';'       { POINTVIRGULE }
  ':'       { DEUXPOINTS }
  '£'       { EPSILON }
  ':='      { AFFECTATION }
  '<>'      { DIFFERENT }
  '>'       { SUPERIEUR }
  '<'       { INFERIEUR }
  '>='      { INFERIEUREQ }
  '<='      { SUPERIEUREQ }
  'And'     { AND }
  'Or'      { OR }
  'Begin'   { BEGIN }
  'End;'    { END }
  'Var'     { VAR }
  'If'      { IF }
  'Then'    { THEN }
  'Else'    { ELSE }
  'While'   { WHILE }
  'Do'      { DO }
  'For'     { FOR }
  'To'      { TO }
  'Writeln' { WRITELN }
  NOMBRE    { NOMBRE $$ }
  FLOAT     { FLOAT $$ }
  BOOLEAN   { BOOLEAN $$ }
  STRING    { STRING $$ }
  VARIABLE  { VARIABLE $$ }


%%


mainNT      : programme                                           { $1 }

programme   : '£'                                                 { ProgEpsilon }
            | commande programme                                  { ProgCommande $1 $2 }

commande    : 'Begin' programme 'End;'                            { ComBegin $2 }
            | 'Var' variable ':' type ';'                         { ComVar $2 $4 }
            | VARIABLE ':=' expression ';'                        { ComVarExp (VarVariable $1) $3 }
            | 'If' expression 'Then' commande 'Else' commande     { ComIf $2 $4 $6 }
            | 'While' expression 'Do' commande                    { ComWhileDo $2 $4 }
            | 'For' VARIABLE ':=' expression 'To' expression 'Do' commande { ComFor (VarVariable $2) $4 $6 $8}
            | 'Writeln' '(' expression ')' ';'                    { ComWriteln $3 }

variable    : VARIABLE                       { VarVariable $1 }
            | VARIABLE ',' variable          { VarVariables $1 ($3) }

expression  : '(' expression ')'              { $2 }
            | '¬' expression                  { ExpNot $2 }
            | type '+' expression             { ExpPlus $1 $3 }
            | expression '-' expression       { ExpMoins $1 $3 }
            | expression '*' expression       { ExpMult $1 $3 }
            | expression '/' expression       { ExpDiv $1 $3 }
            | expression '%' expression       { ExpMod $1 $3 }
            | expression '=' expression       { ExpEqual $1 $3 }
            | expression '<>' expression      { ExpDiv $1 $3 }
            | expression '>' expression       { ExpSup $1 $3 }
            | expression '<' expression       { ExpInf $1 $3 }
            | expression '>=' expression      { ExpSupEq $1 $3 }
            | expression '<=' expression      { ExpInfEq $1 $3 }
            | expression 'And' expression     { ExpAnd $1 $3 }
            | expression 'Or' expression      { ExpOr $1 $3 }
            | '-' expression                  { ExpNeg $2 }
            | type                            { ExpType $1 }

type        :  NOMBRE                        { TypeNum $1 }
            |  BOOLEAN                       { TypeBoolean $1 }
            |  STRING                        { TypeString $1 }
            |  FLOAT                         { TypeFloat $1 }




{

}
