spec: CoffeeMachine.hs Specs.hs
	ghc --make Specs.hs -o ./bin/Specs
	./bin/Specs
