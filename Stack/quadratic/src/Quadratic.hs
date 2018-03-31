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
roots (Quadratic a b c) =
    let discriminant = b * b - 4 * a * c in
        rootsInternal (Quadratic a b c) discriminant

rootsInternal :: Quadratic -> Double -> Roots
rootsInternal q d
    | d==0 = let r    = (-b q / 2.0 / a q)
                 root = r :+ 0
                   in Roots root root
    | d<0 = Roots (realpart :+ complexpart) (realpart :+ (-complexpart))
        where
            plusd       = -d
            twoa        = 2.0 * a q
            complexpart = sqrt plusd / twoa
            realpart    = - b q / twoa