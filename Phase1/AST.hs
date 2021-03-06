
module AST where

data Programme_a =
    ProgEpsilon
  | ProgCommande Commande_a Programme_a
  deriving(Eq, Show)

data Commande_a =
    ComBegin    Programme_a
  | ComVar      Variable_a Type_a
  | ComVarExp   Variable_a Expression_a
  | ComIf       Expression_a Commande_a Commande_a
  | ComWhileDo  Expression_a Commande_a
  | ComFor      Variable_a Expression_a Expression_a Commande_a
  | ComWriteln  Expression_a
  deriving(Eq, Show)

data Type_a =
    TypeString      String
  | TypeNum         Int
  | TypeFloat       Float
  | TypeBoolean     Bool
  | TypeCharacter   Char
  deriving (Eq, Show)

checkType (TypeNum _) (TypeNum _) = True

checkType _ _ = False

data Variable_a =
    VarVariable  String
  | VarVariables String Variable_a
  deriving (Eq, Show)

data Expression_a =
    ExpPlus  Type_a Expression_a
  | ExpMoins Expression_a Expression_a
  | ExpMult  Expression_a Expression_a
  | ExpDiv   Expression_a Expression_a
  | ExpNeg   Expression_a
  | ExpNot   Expression_a
  | ExpMod   Expression_a Expression_a
  | ExpAnd   Expression_a Expression_a
  | ExpOr    Expression_a Expression_a
  | ExpSup   Expression_a Expression_a
  | ExpInf   Expression_a Expression_a
  | ExpSupEq Expression_a Expression_a
  | ExpInfEq Expression_a Expression_a
  | ExpEqual Expression_a Expression_a
  | ExpType Type_a
  deriving (Eq,Show)

x = TypeNum 5
d = ExpPlus (TypeNum 5) (ExpNeg (ExpType (TypeNum 5)))




evaluateAST (ExpType a)  =  a


{-

evaluateAST (ExpPlus a b) =
  case (a, b) of
    () ->


evaluate (Mod a b) =
  case (evaluate a, evaluate b) of
  (Floatant x, _)   -> error "Impossible de faire un modulo avec une Float"
  (_, Floatant y)  -> error "Impossible de faire un modulo avec une Float"
  (Num x, Num y)   -> Num (x `mod` y)

evaluate (Neg x) =
  case (evaluate x) of
    (Num a)       -> Num (-a)
    (Floatant a)  -> Floatant (-a)



-}
