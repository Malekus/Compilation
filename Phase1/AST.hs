
module AST where

data Expression_a =
    Plus  Expression_a Expression_a
  | Moins Expression_a Expression_a
  | Mult  Expression_a Expression_a
  | Div   Expression_a Expression_a
  | Neg   Expression_a
  | Not Expression_a
  | Mod Expression_a Expression_a
  | And Expression_a Expression_a
  | Or Expression_a Expression_a
  | Sup Expression_a Expression_a
  | Inf Expression_a Expression_a
  | SupEq Expression_a Expression_a
  | InfEq Expression_a Expression_a
  | Equal Expression_a Expression_a
  | Num   Int
  | Float Float
  | Boolean Bool
  | String [Char]
  | Variable Expression_a Expression_a
  deriving (Eq,Show)

data Type_a =
    CharacterT Char
  | IntegerT Int
  | BooleanT Bool
  deriving(Eq, Show)
