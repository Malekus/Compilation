{-# OPTIONS_GHC -w #-}
module Parseur where

import Lexeur
import Control.Monad.Except
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

action_0 (9) = happyShift action_5
action_0 (12) = happyShift action_6
action_0 (14) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 _ = happyFail

action_1 (9) = happyShift action_5
action_1 (12) = happyShift action_6
action_1 (14) = happyShift action_7
action_1 (16) = happyShift action_8
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 _ = happyFail

action_2 (8) = happyShift action_15
action_2 (9) = happyShift action_16
action_2 _ = happyReduce_1

action_3 (10) = happyShift action_12
action_3 (11) = happyShift action_13
action_3 (15) = happyShift action_14
action_3 _ = happyReduce_4

action_4 _ = happyReduce_8

action_5 (9) = happyShift action_5
action_5 (12) = happyShift action_6
action_5 (14) = happyShift action_7
action_5 (16) = happyShift action_8
action_5 (7) = happyGoto action_11
action_5 _ = happyFail

action_6 (9) = happyShift action_5
action_6 (12) = happyShift action_6
action_6 (14) = happyShift action_7
action_6 (16) = happyShift action_8
action_6 (5) = happyGoto action_10
action_6 (6) = happyGoto action_3
action_6 (7) = happyGoto action_4
action_6 _ = happyFail

action_7 _ = happyReduce_11

action_8 _ = happyReduce_12

action_9 (17) = happyAccept
action_9 _ = happyFail

action_10 (8) = happyShift action_15
action_10 (9) = happyShift action_16
action_10 (13) = happyShift action_22
action_10 _ = happyFail

action_11 _ = happyReduce_10

action_12 (9) = happyShift action_5
action_12 (12) = happyShift action_6
action_12 (14) = happyShift action_7
action_12 (16) = happyShift action_8
action_12 (7) = happyGoto action_21
action_12 _ = happyFail

action_13 (9) = happyShift action_5
action_13 (12) = happyShift action_6
action_13 (14) = happyShift action_7
action_13 (16) = happyShift action_8
action_13 (7) = happyGoto action_20
action_13 _ = happyFail

action_14 (9) = happyShift action_5
action_14 (12) = happyShift action_6
action_14 (14) = happyShift action_7
action_14 (16) = happyShift action_8
action_14 (7) = happyGoto action_19
action_14 _ = happyFail

action_15 (9) = happyShift action_5
action_15 (12) = happyShift action_6
action_15 (14) = happyShift action_7
action_15 (16) = happyShift action_8
action_15 (6) = happyGoto action_18
action_15 (7) = happyGoto action_4
action_15 _ = happyFail

action_16 (9) = happyShift action_5
action_16 (12) = happyShift action_6
action_16 (14) = happyShift action_7
action_16 (16) = happyShift action_8
action_16 (6) = happyGoto action_17
action_16 (7) = happyGoto action_4
action_16 _ = happyFail

action_17 (10) = happyShift action_12
action_17 (11) = happyShift action_13
action_17 (15) = happyShift action_14
action_17 _ = happyReduce_3

action_18 (10) = happyShift action_12
action_18 (11) = happyShift action_13
action_18 (15) = happyShift action_14
action_18 _ = happyReduce_2

action_19 _ = happyReduce_7

action_20 _ = happyReduce_6

action_21 _ = happyReduce_5

action_22 _ = happyReduce_9

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 _
	 =  HappyAbsSyn4
		 (
	)

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn5
		 (
	)

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 _
	_
	_
	 =  HappyAbsSyn6
		 (
	)

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 _
	_
	_
	 =  HappyAbsSyn6
		 (
	)

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 _
	_
	_
	 =  HappyAbsSyn6
		 (
	)

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn6
		 (
	)

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 _
	_
	_
	 =  HappyAbsSyn7
		 (
	)

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 _
	_
	 =  HappyAbsSyn7
		 (
	)

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn7
		 (
	)

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn7
		 (
	)

happyNewToken action sts stk [] =
	action 17 17 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PLUS -> cont 8;
	MOINS -> cont 9;
	MULT -> cont 10;
	DIV -> cont 11;
	PARENTG -> cont 12;
	PARENTD -> cont 13;
	NOMBRE -> cont 14;
	MODULO -> cont 15;
	FLOTTANT -> cont 16;
	_ -> happyError' (tk:tks)
	}

happyError_ 17 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Except String a -> (a -> Except String b) -> Except String b
happyThen = ((>>=))
happyReturn :: () => a -> Except String a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Except String a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> Except String a
happyError' = \_ -> throwError "Ceci n'est pas une expression arithmetique\n"

parseExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq



{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 10 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc9827_0/ghc_2.h" #-}


































































































































































{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
