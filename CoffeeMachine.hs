-- CoffeeMachine.hs
module CoffeeMachine
where

data Order = Coffee | Tea | Chocolate

command :: Order -> String
command order = beverage order : "::"

beverage :: Order -> Char
beverage Coffee = 'C'
beverage Tea    = 'T'
beverage Chocolate = 'H'

