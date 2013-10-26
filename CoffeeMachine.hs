-- CoffeeMachine.hs
module CoffeeMachine
where

type CoffeeMachine = (Money, Command)
type Money   = Integer
type Command = String 

data Beverage = Coffee | Tea | Chocolate

newMachine :: CoffeeMachine
newMachine = (0, "")

command :: CoffeeMachine -> String
command = snd

order :: Beverage -> Integer -> CoffeeMachine -> CoffeeMachine 
order beverage sugar m@(amount,c) | amount < (price beverage)  = message ("missing " ++ (showMoney (price beverage - amount)) ++ " euros") m
order beverage sugar (amount,c) = (amount,(beverageCode beverage) : sugarCode sugar)

price :: Beverage -> Money
price Tea = 40
price Coffee = 60
price Chocolate = 50

showMoney :: Money -> String
showMoney amount = euros (amount `div` 100) ++ "." ++ cents (amount `mod` 100)
    where euros = show
          cents n | n < 10 = '0' : show n
          cents n          = show n


message :: String -> CoffeeMachine -> CoffeeMachine 
message msg (amount,_) = (amount, 'M':':':msg)

insert :: Money -> CoffeeMachine -> CoffeeMachine
insert amount (_,cmd) = (amount, cmd)

beverageCode :: Beverage -> Char
beverageCode Coffee = 'C'
beverageCode Tea    = 'T'
beverageCode Chocolate = 'H'

sugarCode :: Integer -> String
sugarCode 0 = "::"
sugarCode 1 = ":1:0"
sugarCode 2 = ":2:0"

