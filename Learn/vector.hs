import Data.Functor
import Control.Applicative

main :: IO ()
main =
    print $ Vector 1 2 3 + Vector 3 4 5

data Vector a = Vector a a a deriving (Eq, Show)

instance Functor Vector where
    fmap f (Vector a b c) = Vector (f a) (f b) (f c)

instance Applicative Vector where
    pure a = Vector a a a 
    Vector f g h <*> Vector a b c = Vector (f a) (g b) (h c) 

instance (Num a) => Num (Vector a) where
    negate v = negate <$> v
    (+) v1 v2 = (+) <$> v1 <*> v2
    (*) v1 v2 = (*) <$> v1 <*> v2
    fromInteger n = fromInteger <$> Vector n n n
    signum v = signum <$> v 
    abs v = abs <$> v


    