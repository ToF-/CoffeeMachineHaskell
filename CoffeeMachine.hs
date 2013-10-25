-- CoffeeMachine.hs
module CoffeeMachine
where

type CoffeeMachine = String

data Order = Order Beverage Integer
            | Message String
data Beverage = Coffee | Tea | Chocolate

command :: CoffeeMachine -> String
command = id

order :: Beverage -> Integer -> CoffeeMachine
order beverage sugar = (beverageCode beverage) : sugarCode sugar

message :: String -> CoffeeMachine
message m = 'M':':':m


beverageCode :: Beverage -> Char
beverageCode Coffee = 'C'
beverageCode Tea    = 'T'
beverageCode Chocolate = 'H'

sugarCode :: Integer -> String
sugarCode 0 = "::"
sugarCode 1 = ":1:0"
sugarCode 2 = ":2:0"

