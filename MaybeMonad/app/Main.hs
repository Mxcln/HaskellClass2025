data Sheep = Sheep {
    name :: String,
    f :: Maybe Sheep,
    m :: Maybe Sheep
} deriving (Show)

father :: Sheep -> Maybe Sheep
father = f

mother :: Sheep -> Maybe Sheep
mother = m

maternalGrandfather :: Sheep -> Maybe Sheep
maternalGrandfather sheep =
    (return sheep) >>= mother >>= father

mothersPaternalGrandfather :: Sheep -> Maybe Sheep
mothersPaternalGrandfather sheep =
    (return sheep) >>= mother >>= father >>= father

main :: IO ()
main = do
    -- 构造家谱
    let grandpa = Sheep "grandpa" Nothing Nothing
        grandma = Sheep "grandma" Nothing Nothing
        mom = Sheep "mom" (Just grandpa) (Just grandma)
        dad = Sheep "dad" Nothing Nothing
        child = Sheep "child" (Just dad) (Just mom)
    
    let result = maternalGrandfather child
    let result2 = mothersPaternalGrandfather child
    putStrLn $ "sheep's maternal grandfather: " ++ case result of
        Just s  -> name s
        Nothing -> "unknown"
    
    putStrLn $ "sheep's mother's paternal grandfather: " ++ case result2 of
        Just s  -> name s
        Nothing -> "unknown"










