-- Spec.hs
import Test.Hspec
import CoffeeMachine

main :: IO ()
main = hspec $ do
    describe "Coffee Machine\n" $ do 
        let machine = insert 1.0 newMachine
        it "should send instruction for coffee" $ do
            command (order Coffee 0 machine) `shouldBe` "C::"

        it "should send instruction for tea" $ do
            command (order Tea 0 machine) `shouldBe` "T::"

        it "should send instruction for chocolate" $ do
            command (order Chocolate 0 machine) `shouldBe` "H::"

        it "should send instruction for 1 or 2 sugar" $ do
            command (order Tea 1 machine)  `shouldBe` "T:1:0"
            command (order Coffee 2 machine) `shouldBe` "C:2:0"

        it "should send a message" $ do
            command (message "hello world!" machine) `shouldBe` "M:hello world!"
