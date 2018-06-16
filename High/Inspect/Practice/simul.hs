type Func = Double -> Double

data Fermions = Fermions { fu :: Func
                         , fd :: Func
                         , fc :: Func
                         , fs :: Func
                         , ft :: Func
                         , fb :: Func}

simulExec :: Fermions -> [Double] -> [Double]
simulExec ferms xs = gs
 where
  gs = map (apl ferms) xs
  apl hs x =
    let us = fu hs x
        ds = fd hs x
        cs = fc hs x
        ss = fs hs x
        ts = ft hs x
        bs = fb hs x
    in  us
        `seq` ds
        `seq` cs
        `seq` ss
        `seq` ts
        `seq` bs
        `seq` (us + ds + cs + ss + ts + bs)

tradExec :: [Double -> Double] -> [Double] -> [Double]
tradExec fs = map (\x -> sum (map (\f -> f x) fs))

main = do
  --let ferms = Fermions (+ 1) (+ 2) (+ 3) (+ 4) (+ 5) (+ 6)
  let ts = [(+ 1), (+ 2), (+ 3), (+ 4), (+ 5), (+ 6)]
      us = [1 .. 1e+6]
  --print $ sum (simulExec ferms us)
  print $ sum (tradExec ts us)
