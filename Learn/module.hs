import Data.List (nub, sort)
import qualified Data.Map as M

main = do
  print $ numUniques [1,3,2,1,1,4,2,5,5,3]
  print $ map ($ 3) [sin, tan, cos]

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

