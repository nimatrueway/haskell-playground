module Basic.Lists(main) where

import Data.List

------------------------ lists

numberList :: [] Int         -- [] corresponds to scala List, has another sugar syntax `[Int]`
numberList = [1, 2, 3, 4, 5] -- could also be written as `1 : 2 : 3 : 4 : 5 : []`

-- String is just an alias for `[Char]` a list of Char
--   type String = [Char]
helloWithoutH :: String
helloWithoutH = "ello"

------------------------ list  operations, reference https://hackage.haskell.org/package/base-4.12.0.0/docs/Data-List.html

headOfNumberList = head numberList
tailOfNumberList = tail numberList
func = (+ 100)
mappedNumberList = map func numberList
sortedDescNumberList = sortOn (\x -> -x) numberList -- lambda (anonymous function)
sumOfNumberList = sum numberList
prodOfNumberList = product numberList
thirdElementOfNumberList = numberList !! 2 -- (!!) :: [a] -> Int -> a

hello = 'H' : helloWithoutH      -- prepend element to list
helloWorld = hello ++ " World"   -- join two lists

main :: IO ()
main = do
  putStr "val numberList = "
  print numberList
  putStr "val headOfNumberList = "
  print headOfNumberList
  putStr "val tailOfNumberList = "
  print tailOfNumberList
  putStr "val mappedNumberList = "
  print mappedNumberList
  putStr "val sortedDescNumberList = "
  print sortedDescNumberList
  putStr "val sumOfNumberList = "
  print sumOfNumberList
  putStr "val prodOfNumberList = "
  print prodOfNumberList
  putStr "val thirdElementOfNumberList = "
  print thirdElementOfNumberList
  putStr "val helloWithoutH = "
  print helloWithoutH
  putStr "val hello = "
  print hello
  putStr "val helloWorld = "
  print helloWorld