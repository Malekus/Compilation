
module AST where

data Expression_a =
    Plus  Expression_a Expression_a
  | Moins Expression_a Expression_a
  | Mult  Expression_a Expression_a
  | Div   Expression_a Expression_a
  | Mod   Expression_a Expression_a
  | Neg   Expression_a
  | Num   Int
  | Float Float
  deriving (Eq,Show)

x = Plus (Num 5) (Num 5)
y = Float 2.5

evaluate (Plus a b) = evaluate a + evaluate b
evaluate (Moins a b) = evaluate a - evaluate b
evaluate (Mult a b) = evaluate a * evaluate b
--evaluate (Div a b) = evaluate a / evaluate b
evaluate (Mod a b) = evaluate a `mod` evaluate b
evaluate (Neg a) = -(evaluate a)
evaluate (Num a) = a
--evaluate (Float a) = a
