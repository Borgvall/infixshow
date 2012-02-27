Introduction
============

Generating strings from data in Haskell [1] usually requires a combination of the show, shows functions and the string concatenation '++' operator. Such code tends to be verbose and cumbersome. This package provides some infix operators, that behaves like ++, but additionally convert one operand into strings. They allow writing concise code for string generation.

Installation and Usage
======================

infixshow uses Cabal [2] for distribution and can be installed with the command
> cabal install
inside the directory of the unzipped archive. Afterwards the 'Text.Show.Infix' module could be imported and used.

Documentation
=============

The code of infixshow contains Haddock [3] annotations. The command 
> cabal haddock
produces the html documentation in the directory dist/doc. At the beginning you should read the documentation of the 'Text.Show.Infix' module.

Resources
=========

The file LICENSE contains copyright information.

[1]: http://www.haskell.org		"The programming language Haskell"
[2]: http://www.haskell.org/cabal	"Cabal distribution system"
[3]: http://www.haskell.org/haddock	"Haddock documentation system"
