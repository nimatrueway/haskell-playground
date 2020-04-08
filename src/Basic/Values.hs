module Basic.Values(main) where

------------------------ binding declarations

number1 :: Int  -- type signature
number1 = 50    -- value bind

number2 :: Int
number2 = number3 - 100 -- haskell has no problem with forward-referencing
                        -- every value in haskell is like a Scala `lazy val`

number3 :: Int
number3 = 200

character :: Char
character = 'H'

------------------------ function calling

numberSum = number1 + number2    -- Haskell has type inference
numberProd = (*) number1 number2 -- Notice the signature of product operator:
                                 --       (*) :: a -> a -> a 
                                 -- its scala equivalent would be:
                                 --   def `*`[A](a1: A)(a2: A): A
                                 -- Note: all functions in haskell use currying,
                                 --         its Scala equivalent would be a list of singleton-list parameter 
main :: IO ()
main = do
  putStr "val number1 = "
  print number1
  putStr "val number2 = "
  print number2
  putStr "val number3 = "
  print number3
  putStr "val numberSum = "
  print numberSum
  putStr "val numberProd = "
  print numberProd
  putStr "val character = "
  print character