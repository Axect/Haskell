module Autodiff where

data Dual a = Dual a a deriving (Eq, Read, Show)

instance Num a => Num (Dual a) where
  (Dual u u') + (Dual v v') = Dual (u + v) (u' + v')
  (Dual u u') * (Dual v v') = Dual (u * v) (u' * v + u * v')
  (Dual u u') - (Dual v v') = Dual (u - v) (u' - v')
  abs (Dual u u')           = Dual (abs u) (u' * signum(u))
  signum (Dual u u')        = Dual (signum u) 0
  fromInteger n             = Dual (fromInteger n) 0
