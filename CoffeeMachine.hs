-- CoffeeMachine.hs
module CoffeeMachine
where
import Text.Printf

data CoffeeMachine = CoffeeMachine { money :: Money,
                                     instructions :: Instructions }
type Money   = Integer
type Instructions = String 

data Order = Coffee    Integer
           | Tea       Integer
           | Chocolate Integer
           | OrangeJuice

newMachine :: CoffeeMachine
newMachine = CoffeeMachine 0 ""

message :: String -> CoffeeMachine -> CoffeeMachine 
message msg m = m { instructions = 'M':':':msg }

insert :: Money -> CoffeeMachine -> CoffeeMachine
insert n cm = cm { money = n }

order :: Order -> CoffeeMachine -> CoffeeMachine 
order o m 
    | money m < price o = message (moneyMissing o m) m
    | otherwise         = m { instructions = beverage o }

moneyMissing :: Order -> CoffeeMachine -> String
moneyMissing o cm = "missing " ++ (showMoney missing) ++ " euros"
    where missing = price o - money cm
          showMoney n = printf "%d.%02d" (n `div` 100) (n `mod` 100)

price :: Order -> Money
price (Tea _)       = 40
price (Coffee _)    = 60
price (Chocolate _) = 50
price OrangeJuice   = 60

beverage :: Order -> String
beverage (Coffee    s) = 'C' : sugarCode s
beverage (Tea       s) = 'T' : sugarCode s
beverage (Chocolate s) = 'H' : sugarCode s
beverage OrangeJuice   = 'O' : sugarCode 0

sugarCode :: Integer -> String
sugarCode 0 = "::"
sugarCode 1 = ":1:0"
sugarCode 2 = ":2:0"

