-- CoffeeMachine.hs
module CoffeeMachine
where

type CoffeeMachine = (Money, Instructions)
type Money   = Integer
type Instructions = String 

data Order = Coffee Integer
           | Tea Integer
           | Chocolate Integer
           | OrangeJuice

newMachine :: CoffeeMachine
newMachine = (0, "")

instructions :: CoffeeMachine -> String
instructions = snd

order :: Order -> CoffeeMachine -> CoffeeMachine 
order o m@(n,_) | n < (price o) = message ("missing " ++ (showMoney (price o - n)) ++ " euros") m
order o (n,c) = (n,beverage o)

price :: Order -> Money
price (Tea _)= 40
price (Coffee _) = 60
price (Chocolate _) = 50
price OrangeJuice  = 60

showMoney :: Money -> String
showMoney amount = euros (amount `div` 100) ++ "." ++ cents (amount `mod` 100)
    where euros = show
          cents n | n < 10 = '0' : show n
          cents n          = show n


message :: String -> CoffeeMachine -> CoffeeMachine 
message msg (amount,_) = (amount, 'M':':':msg)

insert :: Money -> CoffeeMachine -> CoffeeMachine
insert amount (_,cmd) = (amount, cmd)

beverage :: Order -> String
beverage (Coffee    s) = 'C' : sugarCode s
beverage (Tea       s) = 'T' : sugarCode s
beverage (Chocolate s) = 'H' : sugarCode s
beverage OrangeJuice   = 'O' : sugarCode 0

sugarCode :: Integer -> String
sugarCode 0 = "::"
sugarCode 1 = ":1:0"
sugarCode 2 = ":2:0"

