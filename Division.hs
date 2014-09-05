{- Division.hs - provide check answers for kids long division exercises -}

{- get 2 integers from keyboard -}
getInts :: IO (Int, Int)
getInts = do
   putStrLn "Please enter the dividend :"
   x <- readLn
   putStrLn "Please enter the divisor  :"
   y <- readLn
   return (x, y)
   
{- do the calculations -}
sums :: (Int, Int) -> [Int]
sums (x, y) = [x, y, q, r, y * q, y * q + r] where
              q = x `div` y
              r = x `mod` y

{- create the explanation output with the results -}
explain :: [String] -> [String]
explain [x,y,q,r,yq,yq_r] = 
   [ concat ["Result: ", x, " / ", y, " = ", q, " remainder ", r]
   , concat ["Proof : (", y, " x ", q, ") + ", r, " = ", yq, " + ",r, " = ", yq_r]
   , "Is this what you had? "]
   
{- simpler main -}
{- rewritten main to use the developed functions 
main = do (x,y) <- getInts
          let ns = map show ( sums (x,y) )
              es = explain ns
          mapM_ putStrLn es
-}

{- most succint main -}
{- This main pipes the functions explain . map show . sums 
 - and applies that to the output of getInts using fmap
 -}
main :: IO ()
main = fmap (explain . map show . sums) getInts
       >>= mapM_ putStrLn
   
