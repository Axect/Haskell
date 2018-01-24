import Graphics.Rendering.Chart.Easy

import Graphics.Rendering.Chart.Backend.Cairo

import Autodiff

year = 60 * 60 * 24 * 365

a t = t ** (2/3)

hubble t = takeDual (a $ Dual t 1)

radius :: [Double] -> [(Double, Double)]
radius ts = [(t, 1 / (hubble t)) | t <- ts]

main = toFile def "hubble.png" $ do
  layout_title .= "Hubble Radius"
  plot (line "radius" [radius [0,380000*year,10**(10)*year]])
