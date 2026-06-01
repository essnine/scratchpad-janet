(import ./eleven)
(import spork)

(spork/test/timeit ["%G"]
	eleven/solve)
