module Infix where

infixr 5 >+, +<
(>+) :: Show a => a -> ShowS
(>+) = shows

(+<) :: Show a => String -> a -> String
str +< a = str ++ show a
