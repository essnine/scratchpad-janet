(import project-euler/euler-libs.janet :as euler-libs)


(defn solve [inp-num div-count]
	(var count-match false)
	(var num inp-num)
	(while (not count-match)
		(do
			(if (> (length (euler-libs/sieve-primes (euler-libs/get-triangle-number-level num))) div-count)
				(set count-match true)
				(set num (inc num))
			))
	(pp num)))

(solve 50 500)