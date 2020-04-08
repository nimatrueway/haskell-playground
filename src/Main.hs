module Main where

-- 01-basic 
import qualified Basic.Values
import qualified Basic.Lists
import qualified Basic.Functions

main :: IO () -- val main: IO[Unit] | https://wiki.haskell.org/IO_inside

main = do
  -- 01-basic 
  putStrLn "Values:"       >> Basic.Values.main
  putStrLn ""
  putStrLn "Lists:"        >> Basic.Lists.main
  putStrLn ""
  putStrLn "Functions:"    >> Basic.Functions.main
  return ()