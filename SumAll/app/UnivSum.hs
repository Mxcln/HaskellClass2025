{-# LANGUAGE FlexibleInstances,UndecidableInstances,MultiParamTypeClasses #-}

module UnivSum where

class Summable a where
    userSum :: a -> a -> a

instance Summable Int where
    userSum x y = x + y

instance Summable Double where
    userSum x y = x + y

instance Summable [a] where
    userSum x y = x ++ y

class (Summable a) => UnivSum a b where
    univSum :: a -> b

instance Summable a => UnivSum a a where
    univSum = id

instance (Summable a, UnivSum a b) => UnivSum a (a -> b) where
    univSum x = univSum . userSum x

-- univSum :: (Summable a, UnivSum a b) => a -> b
-- univSum = sumAll

