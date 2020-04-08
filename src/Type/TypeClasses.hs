module Type.TypeClasses(main) where

------------------------ type class

-- Fibonacci = eFirst, eFirst, eFirst+eFirst, eFirst+eFirst+eFirst, eFirst*5..

class FibonacciAble a where -- Define a "protocol" for a certain "property" (FibonacciAble)
  first :: a                -- that "a class of types" might possess
  aggregate :: a -> a -> a

fib :: FibonacciAble a => [a]
fib = let
  tupleGen :: FibonacciAble a => [(a, a)]
  tupleGen = iterate (\(x, y) -> (y, aggregate x y)) (first, first)
  in map fst tupleGen

------------------------ instantiate for Int

instance FibonacciAble Int where -- instantiate that "protocol" for our own type
  first = 1
  aggregate x y = x + y
  
------------------------ instantiate for prepending linked-list

data LinkedList = Prepend LinkedList | Empty deriving (Show) 

instance FibonacciAble LinkedList where
  first = Prepend Empty
  aggregate Empty ll = ll 
  aggregate (Prepend ll1) ll2 = Prepend (aggregate ll1 ll2) 

------------------------ in action

main :: IO ()
main = do
  putStr "Integer Fibonacci, take(7): "
  print (take 10 (fib :: [Int]))
  putStr "LinkedList Fibonacci, take(5): "
  print (take 5 (fib :: [LinkedList]))
