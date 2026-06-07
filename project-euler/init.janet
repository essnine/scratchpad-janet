(use spork)
(import project-euler/euler-libs.janet/sieve-primes :as sieve-primes)

(defn problem-nine
    `Solving for a Pythagorean triplet (a^2 + b^2 = c^2 where a < b < c and a+b+c=1000) and calculating (abc)`
    []
    (print "running!")
    (def sum 1000)
    (for a 1 (/ sum 3)
        (for b (inc a) (/ sum 2)
            (def c (- 1000 (+ a b)))
            (if (= (* c c) (+ (* a a) (* b b)))
                (do
                    (print "Found! a=" a " b=" b " c=" c)
                    (print "answer is: " (* a b c))
                )
            )
        )
    )
)



(defn problem-ten
    `finding the sum of all primes below two million`
    []
    (def primes-list (sieve-primes 2_000_000))
    (def sum-amount-two-mill (sum primes-list))
    (print "sum is " sum-amount-two-mill)
)


(defn problem-eleven 
    `finding the larger product in a grid` [grid]

    )

(defn hello
  `Evaluates to "Hello!"`
  []
  "Hello!")

(defn main
  [& args]
  (print (hello))
  (problem-nine)
  (problem-ten)
)
