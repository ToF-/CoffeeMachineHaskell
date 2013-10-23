-- Spec.hs
import Test.Hspec
import CoffeeMachine

main :: IO ()
main = hspec $ do
    describe "Coffee Machine\n" $ do 
        it "should send instruction for coffee" $ do
            command Coffee `shouldBe` "C::"

        it "should send instruction for tea" $ do
            command Tea `shouldBe` "T::"

        it "should send instruction for chocolate" $ do
            command Chocolate `shouldBe` "H::"
