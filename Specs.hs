-- Spec.hs
import Test.Hspec
import CoffeeMachine

main :: IO ()
main = hspec $ do
    describe "Coffee Machine\n" $ do 
        it "should send instruction for coffee" $ do
            command (Order Coffee 0) `shouldBe` "C::"

        it "should send instruction for tea" $ do
            command (Order Tea 0) `shouldBe` "T::"

        it "should send instruction for chocolate" $ do
            command (Order Chocolate 0) `shouldBe` "H::"

        it "should send instruction for 1 or 2 sugar" $ do
            command (Order Tea 1)  `shouldBe` "T:1:0"
            command (Order Coffee 2) `shouldBe` "C:2:0"

        it "should send a message" $ do
            command (Message "hello world!") `shouldBe` "M:hello world!"
