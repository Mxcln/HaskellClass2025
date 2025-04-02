-- {-# LANGUAGE FlexibleInstances,UndecidableInstances,MultiParamTypeClasses #-}

module Main where

import UnivSum
import SumInt
import SumDouble

main :: IO ()
main = do

    putStrLn "===== Testing SumInt ====="
    
    let sumint = sumInt 1 2 3 4 5 :: Integer
    putStrLn $ "SumInt 1 2 3 4 5 = " ++ show sumint
    putStrLn ""

    putStrLn "===== Testing SumDouble ====="

    let sumdouble = sumDouble (1::Int) (2::Int) (3.0::Double) ("4.0"::String) (5.0::Double) :: Double
    putStrLn $ "SumDouble 1.0 2 3.0 \"4.0\" 5.0 = " ++ show sumdouble
    putStrLn ""
    
    putStrLn "===== Testing UnivSum ====="
    
    let x = univSum (1::Int) (2::Int) (3::Int) (4::Int) (5::Int) :: Int
    putStrLn $ "UnivSum 1 2 3 4 5 = " ++ show x
    
    let y = univSum ("hell"::String) ("o, "::String) ("world!"::String) :: String
    putStrLn $ "UnivSum \"hell\" \"o, \" \"world!\" = " ++ show y
    
    let z = univSum ([1,2,3]::[Int]) ([4,5,6]::[Int]) ([7,8,9]::[Int]) :: [Int]
    putStrLn $ "UnivSum [1,2,3] [4,5,6] [7,8,9] = " ++ show z
    putStrLn ""




