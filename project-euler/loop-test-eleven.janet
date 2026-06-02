(import ./eleven)
(import spork)

(def loop-max 1000)

(pp (string "Running " loop-max " iterations..."))

(spork/test/timeit-loop [i :range [0 loop-max]]
	(eleven/solve))
