main = do
  print $ take 10 (cycle [1 .. 3])
  print $ take 10 (repeat 5)
  print $ replicate 3 10
  let xxs = [[1 .. 10], [2, 5 .. 30], [3, 6 .. 30]]
  print $ [ [ x | x <- xs, even x ] | xs <- xxs ]

length' xs = sum [ 1 | _ <- xs ]


