module Autodiff where

import GHC.Float

data Dual a = Dual a a deriving (Eq, Read, Show)

instance Num a => Num (Dual a) where
  (Dual u u') + (Dual v v') = Dual (u + v) (u' + v')
  (Dual u u') * (Dual v v') = Dual (u * v) (u' * v + u * v')
  (Dual u u') - (Dual v v') = Dual (u - v) (u' - v')
  abs (Dual u u')           = Dual (abs u) (u' * signum(u))
  signum (Dual u u')        = Dual (signum u) 0
  fromInteger n             = Dual (fromInteger n) 0

instance Fractional a => Fractional (Dual a) where
  (Dual u u') / (Dual v v') = Dual (u / v) ((u' * v - u * v') / (v*v))
  fromRational n            = Dual (fromRational n) 0

instance (Eq a, Floating a) => Floating (Dual a) where
  pi = Dual pi 0
  exp (Dual u u') = Dual (exp u) (u' * exp u)
  log (Dual u u') = Dual (log u) (u'/ u)
  sqrt (Dual u u') = Dual (sqrt u) (u' / (2 * sqrt u))
  sin (Dual u u') = Dual (sin u) (u' * cos u)
  cos (Dual u u') = Dual (cos u) (-1 * u' * sin u)
  tan (Dual u u') = Dual (tan u) (1 / (cos u)**2)
  (Dual u u')**(Dual n 0) = Dual (u**n) (n * u**(n-1))
  (Dual u 0)**(Dual v v') = Dual (u**v) (u**v * log v * v')
  (Dual u u')**(Dual v v') = Dual (u**v) (v'**(log u) + (v * u') / u)

takeDual :: Num a => Dual a -> a
takeDual (Dual _ y) = y

--dual2Double :: (Eq a, Floating a) => Dual a -> Double
--dual2Double t = float2Double $ takeDual t
