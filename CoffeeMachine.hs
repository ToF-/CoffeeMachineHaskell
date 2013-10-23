-- CoffeeMachine.hs
module CoffeeMachine
where

data Order = Coffee
command :: Order -> String
command _ = "C::"
