import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Cairo
import Autodiff

-- Unit Conversion
year :: (Floating a,Ord a) => a
parsec :: (Floating a,Ord a) => a
hubbleInverse :: (Floating a,Ord a) => a
year = 60 * 60 * 24 * 365
parsec = 3.086e+13
hubbleInverse = 10 ** 6 * parsec / (70 * year) -- year

-- Omega
wrad :: (Floating a,Ord a) => a
wmat :: (Floating a,Ord a) => a
wvac :: (Floating a,Ord a) => a
wrad = 1/3
wmat = 0
wvac = -1

-- Formula
wexp :: (Floating a,Ord a) => a -> a
wexp omega = 2 / (3*(1+omega))

a :: (Floating a,Ord a) => a -> a
a t | t>0 && t<=47000 = 1/hubbleInverse ** w1 * t ** w1
    | t>47000 && t<=9.8*10**10 = 1/hubbleInverse ** w2 * t ** w2
    | otherwise = 1/hubbleInverse * exp t
    where w1 = wexp wrad
          w2 = wexp wmat

hubble t =  differentiateDual (a $ Dual t 1) / a t

radius :: [Double] -> [(Double, Double)]
radius ts = [(t, 1 / (a t * hubble t)) | t <- ts]

scaleFactor :: [Double] -> [(Double, Double)]
scaleFactor ts = [(t, a t) | t <- ts]

main = toFile def "hubble.png" $ do
  layout_title .= "Hubble Radius"
  plot (line "radius" [radius [1,10001..1.37*10**(10)]])

-- main = toFile def "scalefactor.png" $ do
--   layout_title .= "Scale Factor"
--   plot (line "scale" [scaleFactor [1,1001..1.37*10**(10)]])
