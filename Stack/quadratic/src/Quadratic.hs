module Quadratic where

import Data.Complex

data Quadratic = Quadratic { a :: Double
                           , b :: Double
                           , c :: Double
                           }
                 deriving Show

type RootT = Complex Double
data Roots = Roots RootT RootT deriving Show

roots :: Quadratic -> Roots
roots (Quadratic 0 0 _) = error "Not a quadratic Polynomial"
roots (Quadratic 0 b c) = let root = ( (-c) / b :+ 0) in Roots root root

