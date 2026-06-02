(import ./eleven)
(import spork)

(spork/test/timeit-loop [i :range [0 10]]
	(eleven/solve))
