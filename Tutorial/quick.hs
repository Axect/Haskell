-- f null -> null
f [] = 
    []
-- : means cons
-- head:tail -> f small in tail : head : f large in tail
f (x:xs) = f ys ++ [x] ++ f zs
    where
        ys = [a | a <- xs, a <= x]
        zs = [b | b <- xs, b > x]
