-- Spec.hs
import Test.Hspec
import CoffeeMachine

main :: IO ()
main = hspec $ do
    describe "Coffee Machine\n" $ do 
        let m0 = newMachine
            m100 = insert 100 m0
            instructionsFor o = instructions (order o m100)
            
        it "should send instructions for coffee, tea or chocolate" $ do
            instructionsFor (Coffee    0) `shouldBe` "C::"
            instructionsFor (Tea       0) `shouldBe` "T::"
            instructionsFor (Chocolate 0) `shouldBe` "H::"

        it "should send instructions for 1 or 2 sugar" $ do
            instructionsFor (Tea    1) `shouldBe` "T:1:0"
            instructionsFor (Coffee 2) `shouldBe` "C:2:0"

        it "should send instructions for displaying a message" $ do
            instructions (message "hello world!" m100) `shouldBe` "M:hello world!"

        it "should signal missing amount of money for beverage" $ do
            instructions (order (Tea       0) m0) `shouldBe` "M:missing 0.40 euros"
            instructions (order (Coffee    0) m0) `shouldBe` "M:missing 0.60 euros"
            instructions (order (Chocolate 0) m0) `shouldBe` "M:missing 0.50 euros"

        it "should signal missing amount of money taking money inserted into account" $ do
            instructions (order (Tea       0) (insert 10 m0)) `shouldBe` "M:missing 0.30 euros"
            instructions (order (Chocolate 0) (insert 23 m0)) `shouldBe` "M:missing 0.27 euros"

        it "should send instructions for orange juice" $ do
            instructions (order OrangeJuice m100) `shouldBe` "O::"
            instructions (order OrangeJuice m0  ) `shouldBe` "M:missing 0.60 euros"
