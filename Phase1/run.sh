#!/bin/bash
rm Lexeur.hi Lexeur.o Parseur.hi Parseur.o Phase1.hi Phase1.o Lexeur.hs Parseur.hs Phase1
alex Lexeur.x
happy Parseur.y
ghc Phase1.hs
./Phase1
