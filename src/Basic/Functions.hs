module Basic.Functions(main) where

import Data.Function((&))
import Data.Char(ord, chr)

------------------------ functions definition

add :: Int -> Int -> Int
add a b = a + b

------------------------ function copying

int2str :: Int -> String
int2str = show

------------------------ function multi-binding

fibonacci :: Int -> Int
fibonacci 0 = 1 -- binding for a particular value
fibonacci 1 = 1 -- you can bind multiple times
fibonacci i = fibonacci (i - 1) + fibonacci (i - 2)

------------------------ use let

doAllMathOperations :: Int -> Int -> String
doAllMathOperations a b =
  let sum = a + b -- use let to calculate all intermediary values you need for creating the final value
      sub = a - b
      mul = a * b
      div = ((fromIntegral a) :: Float) / (fromIntegral b :: Float)
   in
  "sum: " ++ show sum ++ ", sub: " ++ show sub ++ ", mul: " ++ show mul ++ ", div: " ++ show div

------------------------ use where

addBigDecimal :: String -> String -> String
addBigDecimal a b = frecursive "" (reverse b) (reverse a) 0 where -- you can use functions/values and define them later

  frecursive :: String -> String -> String -> Int -> String
  frecursive output [] [] 0 = output
  frecursive output [] [] surplus = show surplus ++ output
  frecursive output (headA:tailA) [] surplus = frecursive newOutput tailA [] newSurplus where
      (addOutput, newSurplus) = fstep headA '0' surplus
      newOutput = addOutput : output
  frecursive output [] (headB:tailB) surplus = frecursive newOutput [] tailB newSurplus where
      (addOutput, newSurplus) = fstep '0' headB surplus
      newOutput = addOutput : output
  frecursive output (headA:tailA) (headB:tailB) surplus = frecursive newOutput tailA tailB newSurplus where
      (addOutput, newSurplus) = fstep headA headB surplus
      newOutput = addOutput : output

  fstep :: Char -> Char -> Int -> (Char, Int)
  fstep char1 char2 surplus = let
    total = (ord char1 - ord '0') + (ord char2 - ord '0') + surplus
    (newSurplus, addOutput) = quotRem total 10
    in (chr (addOutput + ord '0'), newSurplus)

------------------------ lists

printFibs n = map (int2str.fibonacci) [0..n] & unwords --  "(g . f)(x)" function composition == "f(g(x))"

main :: IO ()
main = do
  putStr "5 + 10 = "
  print $ add 5 10
  putStr "fib(0..7) = "
  putStrLn $ printFibs 7
  putStr "doAllMathOperations(10, 2) = "
  putStrLn $ doAllMathOperations 10 2
  putStr "addBigDecimal('910', '599') = "
  putStrLn $ addBigDecimal "910" "599"