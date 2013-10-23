-- Spec.hs
import Test.Hspec
import CoffeeMachine

main :: IO ()
main = hspec $ do
    describe "Coffee Machine\n" $ do 
        it "should send correct instruction to the drink maker for coffee" $ do
            command Coffee `shouldBe` "C::"
