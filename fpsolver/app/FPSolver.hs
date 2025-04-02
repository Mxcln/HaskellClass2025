module FPSolver where

fixpoint :: (Double -> Double) -> Double -> Double -> Double
fixpoint f start = iter start (f start)
  where
    iter old new eps'
      | abs(old - new) < eps' = old
      | otherwise = iter new (f new) eps'

-- find the fix point of cos
cosineFixedPoint :: Double
cosineFixedPoint = fixpoint cos 1.0 0.0001

-- find the fix point of 1/(1+x)
reciprocalFixedPoint :: Double
reciprocalFixedPoint = fixpoint (\x -> 1/(1 + x)) 1.0 0.0001

