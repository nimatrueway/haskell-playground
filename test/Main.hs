module Main where

import Test.Hspec

import qualified Test.Basic.Values

main :: IO ()

main = hspec $ do
  Test.Basic.Values.spec