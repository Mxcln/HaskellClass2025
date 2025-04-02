module SumInt where

class SumInt a where
    sumInt :: Integer -> a

instance SumInt Integer where
    sumInt = id

instance (Integral a, SumInt s) => SumInt (a -> s) where
    sumInt x = sumInt . (x +) . toInteger

