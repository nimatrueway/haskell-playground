module Type.StateMonads(main) where

import Data.Functor.Identity
import Data.Traversable
import Data.Function((&))
import Control.Monad.State(State, state, runState, get, put, return)

------------------------ identity monad, reference: https://stackoverflow.com/questions/28645505/why-is-identity-monad-useful

boxedString :: Identity String
boxedString = Identity "hack"

------------------------ state, reference: https://stackoverflow.com/a/25464968/1556045

-- "State s a" takes a "state_old", transforms it to "state_new" and also generates "a_value"
-- State s a = \s -> (a, s)

-- Composition
--
-- compose :: (State s a)
--         -> (a -> (State s b))
--         -> (State s b)
--
-- compose :: (s -> (a, s))         -- the initial state transformer
--         -> (a -> (s -> (b, s)))  -- a new state transformer, built using the "result"
--                                  -- of the previous one
--         -> (s -> (b, s))         -- the result state transformer
--

peopleList :: [String]
peopleList = ["Bas", "Nima", "Jackpot!", "Ishan", "Augusto"]
--   prize = [0,     0,      0,          10$,      10$]

------------------------ simple recursive

approachVanilla :: [String] -> [Int]
approachVanilla list =
  let
    fState :: Bool -> [String] -> [Int]
    fState s [] = []
    fState s (x:xs) = newX : fState newS xs where
      newS = s || (x == "Jackpot!")
      newX = (if s then 10 else 0)
  in fState False list

------------------------ map accumulate

approachMapAccum :: [] String -> [] Int
approachMapAccum l = snd (mapAccumL f False l) where
  f :: Bool -> String -> (Bool, Int)
  f s x =
    let
      newS = s || (x == "Jackpot!")
      newX = (if s then 10 else 0)
    in (newS, newX)

------------------------ state monad

approachStateM :: [String] -> [Int]
approachStateM list =
  let
    stateM :: String -> State Bool Int  -- define: fmap:         element -> state-monad
    stateM e = state f where            --         state-monad:  old-state -> new-state, element (new-element)
      f False = (0, e == "Jackpot!")
      f True  = (10, True)
      
    intermediate :: State Bool [ Int ]
    intermediate = traverse stateM list -- traverse(list: List[A], mapper: A -> M[B]): M[List[B]] = liftM . map
                                        --      map(list: List[A], mapper: A -> M[B]): List[M[B]]
  in runState intermediate False & fst

------------------------ state monad + composition | reference: https://wiki.haskell.org/State_Monad

approachStateM2 :: [String] -> [Int]
approachStateM2 list =
  let
    stateM :: String -> State Bool Int
    stateM e = do
      old_state <- get                     -- \x1 -> (x1, x1)
      put (old_state || e == "Jackpot!")   -- \x1 -> ((), x2)
      return (if old_state then 10 else 0) -- \x2 -> (v,  x2)

    intermediate :: State Bool [ Int ]
    intermediate = traverse stateM list

  in runState intermediate False & fst

------------------------ in action

main :: IO ()
main = do
  putStr "val boxedString = "
  print boxedString
  putStr "runIdentity boxedString = "
  print $ runIdentity boxedString
  putStr "val peopleList = "
  print peopleList
  putStr "#1 approachVanilla(peopleList) = "
  print $ approachVanilla peopleList
  putStr "#1 approachMapAccum(peopleList) = "
  print $ approachMapAccum peopleList
  putStr "#1 approachStateM(peopleList) = "
  print $ approachStateM peopleList
  putStr "#1 approachStateM2(peopleList) = "
  print $ approachStateM2 peopleList
  return ()