-- CoffeeMachine.hs
module CoffeeMachine
where

data Order = Coffee | Tea

command :: Order -> String
command Coffee = "C::"
command Tea    = "T::"

