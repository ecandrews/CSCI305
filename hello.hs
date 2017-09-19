myMult x y z = x * y * z

kSucc :: (Integral a, Enum b) => a -> b -> b
kSucc k x = if k <= 0 then x else kSucc (k-1) (succ x)




