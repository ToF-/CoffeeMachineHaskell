-- CoffeeMachine.hs
module CoffeeMachine
where

type CoffeeMachine = (Money, Command)
type Money   = Double
type Command = String 

data Beverage = Coffee | Tea | Chocolate

newMachine :: CoffeeMachine
newMachine = (0.0, "")

command :: CoffeeMachine -> String
command = snd

order :: Beverage -> Integer -> CoffeeMachine -> CoffeeMachine 
order beverage sugar m@(0,c)  = message ("missing " ++ (show (price beverage)) ++ " euros") m
order beverage sugar (amount,c) = (amount,(beverageCode beverage) : sugarCode sugar)

price :: Beverage -> Money
price Tea = 0.4
price Coffee = 0.6
price Chocolate = 0.5

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

