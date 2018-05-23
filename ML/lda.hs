import Data.Random.Normal
import Data.Functor ()
import Control.Applicative ()
import Vector


main :: IO ()
main = do
    let (x1, x2) = unWrap $ take 150 <$> sampleDistX 42
        (y1, y2) = unWrap $ take 150 <$> sampleDistY 42
    print $ take 10 x1

data DataPair a = DataPair String a a deriving (Eq, Show)

type SampleDist = DataPair [Double]

instance Functor DataPair where
    fmap f (DataPair s x y) = DataPair s (f x) (f y)

instance Applicative DataPair where
    pure a = DataPair "Pure" a a
    (DataPair _ f g) <*> (DataPair s2 x y) = DataPair s2 (f x) (g y)

unWrap :: DataPair a -> (a, a)
unWrap (DataPair _ x y) = (x, y)

sampleDistX :: Int -> SampleDist
sampleDistX n = mkNormals' <$> DataPair "m,sigma" (2,1) (-2,1) <*> DataPair "x" n n

sampleDistY :: Int -> SampleDist
sampleDistY n = mkNormals' <$> DataPair "m,sigma" (0,3) (0,3) <*> DataPair "y" n n