-- |'String' producing Haskell code contains often a tremendous amount of
-- 'show' and 'shows', making it verbose and cumbersome. In Java one uses the
-- '+' operator both for string concatenation and converting data into
-- strings. This module provides some »cousins« of Haskell's concatenating
-- operator '++', which resemble some meanings of Java's special '+'. They
-- have the same precedence and associativity as '++'.

-- TODO: Why returns Haddock an error on this paragraph?
--
-- In order to use them you may start by writing code assuming '++' works like
-- '+' in Java:
-- > 12 ++ " + " ++ 3 ++ " = " ++ (12+3) -- error
-- It does not type check. At first replace all '++' with '>+', where the left
-- hand side needs to be transformed into a 'String'.
-- > 12 >+ " + " ++ 3 >+ " = " ++ (12+3) -- error
-- Still does not work, because (12+3) has to be transformed as well. But '>+'
-- could not be used, so lets use '+<'.
-- > 12 >+ " + " ++ 3 >+ " = " +< (12+3) -- results to "12 + 3 = 15"
-- Please note that '++', '>+' and '+<' are right associative. This means '+<'
-- may not work as you might expect:
-- > 12 >+ " + " +< 3 ++ " = " +< (12+3) -- error
-- is equivalent to
-- > 12 >+ " + " +< (3 ++ " = " +< (12+3)) -- error
-- with the parentheses you should spot the error.
-- 
-- Further examples:
-- 
-- >>> 12 >+ " + " +< 3 >+ " = " +< (12+3) -- probably not what you want
-- "12 + \"3 = 15\""
-- 
-- >>> 1 >+ 2 >+ 3 >+ " looks like " +< 123
-- "123 looks like 123"
 
module Text.Show.Infix where

infixr 5 >+, +<

-- |'>+' transforms the left hand side into a 'String' and prepends it to the
-- right hand side. It has the same precedence and associativity (@infixr 5@)
-- as the 'String' concatenating operator '++'.
(>+) :: Show a => a -> String -> String
(>+) = shows

-- |'+<' transforms the right hand side into a 'String' and prepends the left
-- hand side to it. It has the same precedence and associativity (@infixr 5@)
-- as the 'String' concatenating operator '++'.
(+<) :: Show a => String -> a -> String
str +< a = str ++ show a
