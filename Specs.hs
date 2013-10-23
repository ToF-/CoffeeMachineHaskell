-- Spec.hs
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Coffee Machine\n" $ do 
        it "does nothing for now" $ do
            True `shouldBe` True
