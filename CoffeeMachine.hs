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
order Tea sugar m@(0,c)  = message "missing 0.4 euros" m
order Coffee sugar m@(0,c)  = message "missing 0.5 euros" m
order Chocolate sugar m@(0,c)  = message "missing 0.6 euros" m
order beverage sugar (amount,c) = (amount,(beverageCode beverage) : sugarCode sugar)


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

