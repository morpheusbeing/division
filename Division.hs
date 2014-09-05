{- Division.hs - provide check answers for kids long division exercises -}


main :: IO ()
main = do
   putStrLn "Please enter the dividend :"
   inputx  <- getLine
   putStrLn "Please enter the divisor :"
   inputy  <- getLine
   
   let x = (read inputx) :: Int
   let y = (read inputy) :: Int
   let z = x `div` y
   let remain = x `mod` y
   
   let result = "Result: " ++ show x ++ " / " ++ show y ++ " =  " ++ show z ++  " remainder " ++ show remain
   let proof =  "Proof: (" ++ show y ++ " x " ++ show z ++ ") = " ++ show (y * z) ++ " + " ++ show remain ++ " = " ++ show ((y * z) + remain)
   
   putStrLn result
   putStrLn proof
   putStrLn ( "Is this what you had? ")
   
