-- CoffeeMachine.hs
module CoffeeMachine
where

data Order = Order Beverage Integer
            | Message String
data Beverage = Coffee | Tea | Chocolate

command :: Order -> String
command (Order beverage sugar) = (beverageCode beverage) : sugarCode sugar
command (Message message) = 'M':':':message

beverageCode :: Beverage -> Char
beverageCode Coffee = 'C'
beverageCode Tea    = 'T'
beverageCode Chocolate = 'H'

sugarCode :: Integer -> String
sugarCode 0 = "::"
sugarCode 1 = ":1:0"
sugarCode 2 = ":2:0"

