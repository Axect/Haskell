import Data.List (nub)

main :: IO ()
main = do
    print $ Set [1,2,3] `union` Set [1,4,5]
    print $ Set [1,2,3] `intersection` Set [1,4,5]
    print $ indicator (Set [1,2,3]) 1

newtype Set a = Set [a] deriving (Show)

intersection :: Eq a => Set a -> Set a -> Set a
intersection (Set x) (Set y) = Set [t | t <- x, t `elem` y]

union :: Eq a => Set a -> Set a -> Set a
union (Set x) (Set y) = Set $ nub (x ++ y)

indicator :: Eq a => Set a -> a -> Integer
indicator (Set a) x | x `elem` a  = 1
                    | otherwise   = 0