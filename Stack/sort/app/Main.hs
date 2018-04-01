module Main where

import Qsort
import Msort

main :: IO ()
main = do
    let input = [5,2,3,1,7,9,8,4,6,0]
        sorted1 = qsort input
        sorted2 = mergeSort input
    putStrLn $ "input: " ++ show input
    putStrLn $ "quick sorted: " ++ show sorted1
    putStrLn $ "merge sorted: " ++ show sorted2

