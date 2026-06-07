(defn sieve-primes 
    [num]
    (var primes @[])
    (print "creating primes table...")
    (var p-index (seq [i :range [0 num]]
            @[i true]
        )
    )
    (print "primes table ready! length is " (length p-index))
    (loop ([k f] :in p-index)
        (if (< k 2)
            (print "skipping")
            (do 
                (if (true? f)
                    (do
                        # (print "current prime is " k)
                        (array/push primes k)
                        (loop [v :range [(* k k ) num k]]
                            (put p-index v @[v false])
                        )
                    )
                )
            )
        )
    )
    primes
)


(defn get-triangle-number-level [num]
    (sum (range (inc num)))
)


(defn factors [num]
    (var factor-list @[])
    (let 
        [max-v (math/round (math/sqrt 500))
                factor-nums-map (tabseq [i :in (range 2 (inc max-v))] i false)]
        (loop [[ch val] :pairs factor-nums-map]
            (if (not val)
                (if (not (truthy? (% num ch)))
                        (do 
                            (put factor-nums-map ch true)
                            (loop [step-ch :range-to [ch max-v ch]]
                                (do (put factor-nums-map step-ch true)
                                    (pp (string/format "Adding to %i list" step-ch))))))
                (do 
                    (array/push factor-list ch)
                    (pp factor-nums-map)))))
    factor-list)
