module Main where

-- 01-basic 
import qualified Basic.Lists
import qualified Basic.Functions
-- 02-types
import qualified Type.Types
import qualified Type.TypeClasses
import qualified Type.Monads
import qualified Type.StateMonads

main :: IO () -- val main: IO[Unit] | https://wiki.haskell.org/IO_inside

main = do
  -- 01-basic 
  putStrLn "Lists:"        >> Basic.Lists.main
  putStrLn ""
  putStrLn "Functions:"    >> Basic.Functions.main
  putStrLn ""
  -- 02-types
  putStrLn "Types:"        >> Type.Types.main
  putStrLn ""
  putStrLn "Type-Classes:" >> Type.TypeClasses.main
  putStrLn ""
  putStrLn "Monads:"       >> Type.Monads.main
  putStrLn ""
  putStrLn "StateMonads:"  >> Type.StateMonads.main
  return ()