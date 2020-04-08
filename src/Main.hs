module Main where

-- 01-basic 
import qualified Basic.Values

main :: IO () -- val main: IO[Unit] | https://wiki.haskell.org/IO_inside

main = do
  -- 01-basic 
  putStrLn "Values:"       >> Basic.Values.main
  return ()