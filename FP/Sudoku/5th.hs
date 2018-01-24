-- A Simple Sudoku Solver

module Sudoku where

type Matrix a = [Row a]
type Row a    = [a]
type Grid     = Matrix Digit
type Digit    = Char

digits :: [Char]
digits = ['1' .. '9'] -- Char is also an instance of Enum

blank :: Digit -> Bool
blank = (== '0') -- Section

solve :: Grid -> [Grid] -- Solutions are not unique
solve = filter valid . completions

completions :: Grid -> [Grid]
completions = expand . choices

choices :: Grid -> Matrix [Digit]
choices = map (map choice) where choice d = if blank d then digits else [d]

expand :: Matrix [Digit] -> [Grid]

valid :: Grid -> Bool

