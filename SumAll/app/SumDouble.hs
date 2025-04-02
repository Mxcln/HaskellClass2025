{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses, UndecidableInstances #-}

module SumDouble where

class Convertible a where
  toDouble :: a -> Double

instance Convertible Int where
  toDouble = fromIntegral

instance Convertible Integer where
  toDouble = fromIntegral

instance Convertible Double where
  toDouble = id

instance Convertible String where
  toDouble = read

class SumDouble a where
  sumOf :: Double -> a

instance SumDouble Double where
  sumOf = id

instance (Convertible a, SumDouble r) => SumDouble (a -> r) where
  sumOf x = sumOf . (toDouble x +) . toDouble

sumDouble :: SumDouble r => r
sumDouble = sumOf 0

-- --------------------------------------------------------------------------------
-- -- 示例使用：
-- main :: IO ()
-- main = do
--   -- 求和函数可以接受任意数量的参数，并且支持不同类型：
--   -- 例如：Int, Double, Integer 混合使用
--   print (sumArgs (3 :: Int) (4 :: Integer) (2.5 :: Double))  -- 输出 9.5
--   -- 也可以只传入一个参数
--   print (sumArgs (10 :: Int))                                 -- 输出 10.0
--   -- 如果不传参数，则直接返回初始值 0
--   print (sumArgs :: Double)                                   -- 输出 0.0
