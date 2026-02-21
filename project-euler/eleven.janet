
(defn get-lines-of-size [grid]
	(def gw-max (length grid))
	(def sums @[])
	(loop [yidx :range [0 gw-max]]
		(loop [xidx :range [0 gw-max]]
			(do
				(def hline @[])
				(def vline @[])
				(def pdline @[])
				(def ndline @[])
				(loop [dinc :range [0 4]]
					(do
						(if (< (+ dinc yidx) gw-max)
							(array/push hline ((grid (+ dinc yidx)) xidx)))
						(if (< (+ dinc xidx) gw-max)
							(array/push vline ((grid yidx) (+ dinc xidx))))
						
						(var valid-diag-pos (and (< (+ dinc yidx) gw-max) (< (+ dinc xidx) gw-max)))
						(if valid-diag-pos
							(array/push pdline ((grid (+ dinc yidx)) (+ dinc xidx))))

						(var valid-diag-neg (and (> yidx 2) (< (+ dinc xidx) gw-max)))
						(if valid-diag-neg
							(array/push ndline ((grid (- yidx dinc)) (+ dinc xidx))))
						))
			(array/push sums (product hline))
			(array/push sums (product vline))
			(array/push sums (product pdline))
			(array/push sums (product ndline))
			)))
	# (loop [item :in sums]
	# 	(pp item))
	(def res (max sums))
	(def sums-size (length sums))
	(def sorted-sums (sorted sums))
	(pp (sorted-sums (dec sums-size)))
	res)

(defn solve []
	(var grid @[])
	(loop [line :in (string/split "\n" (slurp "./eleven-input.txt"))]
		(array/push grid (map scan-number (string/split " " line))))
	(print (length grid))
	(loop [line :in grid]
		(pp line))
	(def max-sums (get-lines-of-size grid))
	(pp max-sums))

(defn main [&]
	(solve))
