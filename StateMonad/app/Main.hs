module Main where

import Control.Monad.State

inc :: Int -> State Int Int
inc _ = do
    modify (+1)
    get

dec :: Int -> State Int Int
dec _ = do
    modify (subtract 1)
    get

addNum :: Int -> Int -> State Int Int
addNum x y = return (x + y)

subNum :: Int -> Int -> State Int Int
subNum x y = return (x - y)

mulNum :: Int -> Int -> State Int Int
mulNum x y = return (x * y)

divNum :: Int -> Int -> State Int Int
divNum x y = return (x `div` y)

-- 算术表达式
exp1 :: State Int Int
exp1 = do
    x <- get
    x <- inc x
    x <- inc x
    x <- dec x
    x <- x `addNum` 10
    x <- x `subNum` 5
    x <- x `mulNum` 6
    x `divNum` 3

main :: IO ()
main = do
    let initState = 5
        (result, finalState) = runState exp1 initState
    putStrLn $ "result: " ++ show result
    putStrLn $ "finalState: " ++ show finalState
