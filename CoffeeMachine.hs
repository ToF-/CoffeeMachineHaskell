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
order beverage sugar (money,c) = (money,(beverageCode beverage) : sugarCode sugar)


message :: String -> CoffeeMachine -> CoffeeMachine 
message msg (money,_) = (money, 'M':':':msg)

insert :: Money -> CoffeeMachine -> CoffeeMachine
insert money (_,cmd) = (money, cmd)

beverageCode :: Beverage -> Char
beverageCode Coffee = 'C'
beverageCode Tea    = 'T'
beverageCode Chocolate = 'H'

sugarCode :: Integer -> String
sugarCode 0 = "::"
sugarCode 1 = ":1:0"
sugarCode 2 = ":2:0"

