-- Spec.hs
import Test.Hspec
import CoffeeMachine

main :: IO ()
main = hspec $ do
    describe "Coffee Machine\n" $ do 
        let machineWith1 = insert 100 newMachine
        it "should send instruction for coffee" $ do
            instructions (order (Coffee 0) machineWith1) `shouldBe` "C::"

        it "should send instruction for tea" $ do
            instructions (order (Tea 0) machineWith1) `shouldBe` "T::"

        it "should send instruction for chocolate" $ do
            instructions (order (Chocolate 0) machineWith1) `shouldBe` "H::"

        it "should send instruction for 1 or 2 sugar" $ do
            instructions (order (Tea 1) machineWith1)  `shouldBe` "T:1:0"
            instructions (order (Coffee 2) machineWith1) `shouldBe` "C:2:0"

        it "should send a message" $ do
            instructions (message "hello world!" machineWith1) `shouldBe` "M:hello world!"

        it "should signal missing amount of money for beverage" $ do
            instructions (order (Tea 0) newMachine) `shouldBe` "M:missing 0.40 euros"
            instructions (order (Coffee 0) newMachine) `shouldBe` "M:missing 0.60 euros"
            instructions (order (Chocolate 0) newMachine) `shouldBe` "M:missing 0.50 euros"

        it "should signal missing amount of money taking money inserted into account" $ do
            instructions (order (Tea 0) (insert 10 newMachine)) `shouldBe` "M:missing 0.30 euros"
            instructions (order (Chocolate 0) (insert 23 newMachine)) `shouldBe` "M:missing 0.27 euros"

        it "should send instruction for orange juice" $ do
            instructions (order OrangeJuice machineWith1) `shouldBe` "O::"
