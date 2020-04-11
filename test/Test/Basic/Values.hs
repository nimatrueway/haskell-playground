module Test.Basic.Values(spec) where

import Basic.Values
import Test.Hspec

spec :: SpecWith ()
spec =
  describe "Values" $ do
    it "number1    = 50" $ number1 `shouldBe` 50    
    it "number2    = 125  (200 - 75)" $ number2 `shouldBe` 125          
    it "number3    = 200" $ number3 `shouldBe` 200
    it "character  = 'H'" $ character `shouldBe` 'H'
    it "numberSum  = 175  (50 + 125)" $ numberSum `shouldBe` 175
    it "numberProd = 6250 (50 * 125)" $ numberProd `shouldBe` 6250