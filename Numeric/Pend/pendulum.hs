{-# OPTIONS_GHC -Wall                   #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators    #-}

import Data.Number.Symbolic
import Numeric.AD
import Prelude                            as P
import Data.Csv
import qualified Data.ByteString.Lazy as BSL
--import Data.Array.Accelerate              as A   hiding ((^))
--import Data.Array.Accelerate.LLVM.Native  as CPU
--import Data.Array.Accelerate.Linear              hiding (trace)
--import Data.Array.Accelerate.Control.Lens
--import qualified Linear                   as L

main = do
  let result = take 10000 (hs (pi/4, 0.0))
  BSL.writeFile "pend.csv" $ encode result

bigH1 :: P.Floating a => a -> a -> a
bigH1 q p = p ^ 2 / 2 - cos q

ham1 :: P.Floating a => [a] -> a
ham1 [qq1, pp1] = 0.5 * pp1 ^ 2 - cos qq1
ham1 _ = error "Hamiltonian defined for 2 generalized co-ordinates only"

q1, q2, p1, p2 :: Sym a
q1 = var "q1"
q2 = var "q2"
p1 = var "p1"
p2 = var "p2"

nabla1 :: [[Sym Double]]
nabla1 = jacobian ((\x -> [x]) . ham1) [q1, p1]

nablaQ, nablaP :: P.Floating a => a -> a
nablaQ = sin
nablaP = id

-- Verlet Algorithm
oneStep :: P.Floating a => (a -> a) -> (a -> a) -> a -> (a, a) -> (a, a)
oneStep nablaQQ nablaPP hh (qPrev, pPrev) = (qNew, pNew)
 where
  h2   = hh / 2
  pp2  = pPrev - h2 * nablaQQ qPrev
  qNew = qPrev + hh * nablaPP pp2
  pNew = pp2 - h2 * nablaQQ qNew

h :: Double
h = 0.01

hs :: (Double, Double) -> [(Double, Double)]
hs = P.iterate (oneStep nablaQ nablaP h)
