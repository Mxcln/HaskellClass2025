--{-# LANGUAGE GADTs, StandaloneDeriving  #-} 


module Main where
import FPSolver

-- Show detailed information about fixed point calculation
showFixedPoint :: String -> (Double -> Double) -> Double -> Double -> IO ()
showFixedPoint name f start eps = do
    let x = fixpoint f start eps
    let fx = f x
    let diff = abs(x - fx)
    putStrLn $ "Function: " ++ name
    putStrLn $ "Fixed point x = " ++ show x
    putStrLn $ "f(x) = " ++ show fx
    putStrLn $ "|x - f(x)| = " ++ show diff
    putStrLn ""

main :: IO ()
main = do
    showFixedPoint "cos(x)" cos 1.0 0.0001
    showFixedPoint "1/(1+x)" (\x -> 1/(1 + x)) 1.0 0.0001
