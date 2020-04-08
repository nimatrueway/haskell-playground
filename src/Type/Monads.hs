module Type.Monads(main) where

import Data.Function((&))
import Data.Text(replace, pack, unpack)

------------------------ define a data container type

-- functor laws, reference: https://en.wikibooks.org/wiki/Haskell/The_Functor_class
-- fmap id = id
-- fmap (g . f) = (fmap g) . (fmap f)

data Box a = Box a | EmptyBox deriving (Show)

boxedInt :: Box Int
boxedInt = Box 10

boxedName :: Box String
boxedName = Box "Nima Taheri"

mulBy10 :: Int -> Int
mulBy10 = (* 10)

------------------------ functor, mappable types. function-lifter to mapper.

--  class Functor f where
--    fmap :: (a -> b) -> f a -> f b

instance Functor Box where
  fmap f (Box v) = Box (f v)
  fmap f EmptyBox = EmptyBox

--------------- in action

boxedIntMultiplied = boxedInt & (fmap mulBy10) -- equivalent to `lifted boxedInt`

------------------------ monad, computation-composition-friendly-wrapper around data.

--  class Functor f => Applicative f where
--    pure :: a -> f a

--  class Applicative m => Monad m where
--    (>>=) :: forall a b. m a -> (a -> m b) -> m b

instance Applicative Box where
  pure = Box
  (<*>) (Box f) (Box a) = Box (f a) -- I wrote this just to get rid of a compile warning :D

instance Monad Box where
  (>>=) (Box x) f  = f x
  (>>=) EmptyBox f = EmptyBox

--------------- in action

boxedNameReplaced :: Box String
boxedNameReplaced = do
  name <- boxedName
  return $ pack name & replace (pack "Nima") (pack "Ishan") & replace (pack "Taheri") (pack "Sharma") & unpack

------------------------ in action

main :: IO ()
main = do
  putStr "val boxedInt = "
  print boxedInt
  putStr "val boxedIntMultiplied = "
  print boxedIntMultiplied
  putStr "val boxedName = "
  print boxedName
  putStr "val boxedNameReplaced = "
  print boxedNameReplaced