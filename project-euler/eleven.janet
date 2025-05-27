(defn rotate-grid [grid]
	(print "rotating grid")
	(var rotated-grid (array/new-filled 20 (array/new-filled 20 " ")))
	(loop [x :range [0 20]]
		(loop [y :range [0 20]]
			(put (rotated-grid x) y ((grid y) x))))
	rotated-grid)

(defn get-max-of-lines [grid]
	# (pp grid)
	(var sums @[])
	(loop [line :in grid]
		(loop [a :range [0 (- (length line) 4)]]
			(var acc 0)
			# (print (line a))
			(+ acc (line a))
			(+ acc (line (inc a)))
			(+ acc (line (inc (inc a))))
			(+ acc (line (inc (inc (inc a)))))
			(array/push sums acc))))

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
		(array/push diagonal-lines line-y))
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
	(loop [line :in rotated-grid]
		(pp line))
	(array/concat grid rotated-grid)
	(print "grids concatted")
	(array/push other-lines (get-diagonal-lines rotated-grid))
	(var other-lines-max (get-max-of-lines other-lines))
	(array/concat (other-lines-max (get-max-of-lines grid)))
	(array/concat (other-lines-max (get-max-of-lines rotated-grid)))
	(print (max other-lines-max)))

(solve)