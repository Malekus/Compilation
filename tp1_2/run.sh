#!/bin/bash
rm Lexeur.hi Lexeur.o Parseur.hi Parseur.o TP.hi TP.o Lexeur.hs Parseur.hs TP AST.o AST.hi
alex Lexeur.x
happy Parseur.y
ghc TP.hs
