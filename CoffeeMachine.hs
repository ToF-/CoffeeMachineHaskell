-- CoffeeMachine.hs
module CoffeeMachine
where

data Order = Coffee | Tea

command :: Order -> String
command order = beverage order : "::"

beverage :: Order -> Char
beverage Coffee = 'C'
beverage Tea    = 'T'

