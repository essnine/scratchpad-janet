(defn rotate-grid [grid]
	(print "rotating grid")
	(var rotated-grid (seq [_ :range [0 20]] (array/new-filled 20 0)))
	(loop [y :range [0 20]]
		(loop [x :range [0 20]]
			(put (rotated-grid x) y ((grid y) x))))
	(pp "Input Grid:")
	(loop [line :in grid]
		(pp line))
	(pp "Rotated Grid:")
	(loop [line :in rotated-grid]
		(pp line))
	# (debug)
	rotated-grid)

(defn get-max-of-lines [grid]
	# (pp grid)
	(var sums @[])
	(loop [line :in grid]
		# (pp line)
		(loop [a :range [0 (- (length line) 4)]]
			(var acc 0)
			# (print (line a))
			# (debug)
			(var idx 0)
			(loop [idx :range [0 4]]
				(do
					(var val 0)
					(if-not (= (type (line idx)) :number)
						(set val ((line idx) 0))
						(set val (line idx)))
					(print "val is " val " and idx is " idx)
					(if (= idx 0)
						(set acc (+ acc val))
						(set acc (* acc val)))
					(inc idx)))
			(array/push sums acc)))
	(def maxc (max-of sums))
	(print "Max sums is " maxc)
	maxc)

(defn get-diagonal-lines [grid]
	(var diagonal-lines @[])
	(loop [index :range [0 16]]
		(var line-x @[])
		(var line-y @[])
		(var x-index 0)
		(var y-index 17)
		(loop [:while [> y-index 0]]
			(array/push line-y ((grid y-index) index)))
		(loop [:while [< x-index 16]]
			(array/push line-x ((grid x-index) index)))
		(array/push diagonal-lines line-x)
		(array/push diagonal-lines line-y)
		)
	diagonal-lines)

(defn solve []
	(var grid @[])
	(loop [line :in (string/split "\n" (slurp "./eleven-input.txt"))]
		(array/push grid (map scan-number (string/split " " line))))
	(print (length grid))
	(loop [line :in grid]
		(pp line))
	(var other-lines @[])
	(array/push other-lines (get-diagonal-lines grid))
	(print "diagonal normal lines gotten")
	(def rotated-grid (rotate-grid grid))
	(pp "Rotated Grid!")
	# (pp rotated-grid)
	(loop [line :in rotated-grid]
		(pp line))
	(array/concat grid rotated-grid)
	(print "grids concatted")
	(array/push other-lines (get-diagonal-lines rotated-grid))
	# (debug)
	(var other-lines-max @[])
	(array/push other-lines-max (get-max-of-lines other-lines))
	(array/push other-lines-max (get-max-of-lines grid))
	(array/push other-lines-max (get-max-of-lines rotated-grid))
	(def max-actual (max-of other-lines-max))
	(pp other-lines-max)
	(pp max-actual))

(defn main [&]
	(solve))