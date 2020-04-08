module Type.Types(main) where

import Data.Function((&))

------------------------ type aliasing with same constructor

type Sankhya = Int

myNumber = 10

mySankhya :: Sankhya
mySankhya = myNumber

------------------------ ADT, reference: https://wiki.haskell.org/Algebraic_data_type

data Point = IntPoint  {x :: Int, y :: Int}                 -- IntPoint is constructor + used also for decomposition
           | FloatPoint    Float     Float  deriving (Show) -- almost equivalent to:
                                                            --      trait Point
                                                            -- case class IntPoint   (x: Int, y: Int) extends Point
                                                            -- case class FloatPoint (_: Int, _: Int) extends Point
data Line = Line Point Point deriving (Show)

horizontalLine = Line (IntPoint   0   0  ) (IntPoint   10  0  )
verticalLine   = Line (IntPoint   0   0  ) (FloatPoint 0.0 5.5)
skewedLine     = Line (FloatPoint 3.0 0.0) (FloatPoint 0.0 4.0)

len :: Line -> Float
len (Line (FloatPoint x1 y1) (FloatPoint x2 y2)) = sqrt $ (x2 - x1) ^ 2 + (y2 - y1) ^ 2
len (Line point1 point2) = len $ Line (toFloatPoint point1) (toFloatPoint point2) where
                             toFloatPoint :: Point -> Point
                             toFloatPoint (IntPoint x y) = FloatPoint (fromIntegral x) (fromIntegral y)
                             toFloatPoint f = f

------------------------ new-type a == data a
                      -- but the trivial wrapping and unwrapping of the single field is eliminated by the compiler

newtype Wrapper a = Wrapper a deriving (Show)

------------------------ action

main :: IO ()
main = do
  putStr "val horizontalLine = "
  print horizontalLine
  putStr "len horizontalLine = "
  print (len horizontalLine)
  putStr "val verticalLine = "
  print verticalLine
  putStr "len (verticalLine) = "
  print (len verticalLine)
  putStr "val skewedLine = "
  print skewedLine
  putStr "len (skewedLine) = "
  print (len skewedLine)
  putStr "pair(1, 10) = "
  print (Wrapper 1)