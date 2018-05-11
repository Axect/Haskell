import Data.Functor
import Data.Csv
import qualified Data.ByteString.Lazy as BSL

main = do
  let init1 = fmap
        (* au)
        ( Cartesian (-9.851920196143998e-01)
                    (1.316466809434336e-01)
                    (-4.877392224782687e-06)
        )
      init2 = fmap
        (* au)
        ( Cartesian (-9.864337701483683e-01)
                    (1.230799243164879e-01)
                    (-4.374019384763304e-06)
        )
  let result = map fst (taylor n (init1, init2))
  BSL.writeFile "taylor.csv" $ encode (map extract result)

g     = 6.67259e-11
m     = 5.9736e24
m0    = 1.19891e30
au    = 1.49597870691e11
tstep = 43200
n     = 730 * 10

data Pos a = Cartesian a a a deriving (Show, Eq)
type Vel a = Pos a
type Acc a = Pos a

instance Num a => Num (Pos a) where
  Cartesian x y z + Cartesian x' y' z' = Cartesian (x+x') (y+y') (z+z')
  Cartesian x y z * Cartesian x' y' z' = Cartesian (x*x') (y*y') (z*z')
  Cartesian x y z - Cartesian x' y' z' = Cartesian (x-x') (y-y') (z-z')
  abs (Cartesian x y z) = Cartesian (abs x) (abs y) (abs z)
  signum (Cartesian x y z) = Cartesian (signum x) (signum y) (signum z)
  fromInteger n = Cartesian (fromInteger n) (fromInteger n) (fromInteger n)

instance Functor Pos  where
  fmap f (Cartesian x y z) = Cartesian (f x) (f y) (f z)

norm :: Pos Double -> Double
norm (Cartesian x y z) = sqrt (x ^ 2 + y ^ 2 + z ^ 2)

potential :: Pos Double -> Double
potential c = -1 * g * m * m0 / norm c

kinetic :: Pos Double -> Double
kinetic = (* (-0.5)) . potential

taylor :: Int -> (Pos Double, Pos Double) -> [(Pos Double, Pos Double)]
taylor 0 _        = []
taylor n (c1, c2) = (c1, c2)
  : taylor (n - 1) (c2, c2 + (fmap (* tstep) (v c2)))
 where
  a :: Pos Double -> Acc Double
  a = fmap (* (-g * m0 / (norm c2) ^ 3))
  v :: Pos Double -> Vel Double
  v = fmap (* (tstep)) . a

extract :: Pos Double -> (Double, Double, Double)
extract (Cartesian x y z) = (x, y, z)
