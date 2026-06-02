
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
						(if (and (< (+ dinc yidx) gw-max) (< (+ dinc xidx) gw-max))
							(array/push pdline ((grid (+ dinc yidx)) (+ dinc xidx))))
						(if (and (> yidx 2) (< (+ dinc xidx) gw-max))
							(array/push ndline ((grid (- yidx dinc)) (+ dinc xidx))))
						))
			(array/push sums (product hline))
			(array/push sums (product vline))
			(array/push sums (product pdline))
			(array/push sums (product ndline))
			)))
	(def max-of-sums (max-of sums))
	(def sums-size (length sums))
	(def sorted-sums (sorted sums))
	(def largest-in-sorted-sums (sorted-sums (dec sums-size)))
	# (pp "DONE!")
	# (pp (string "Largest in sorted sums is " largest-in-sorted-sums " and max-of-sums is " max-of-sums))
	largest-in-sorted-sums)

(defn solve []
	(def start-time (os/clock))
	(var grid @[])
	(loop [line :in (string/split "\n" (slurp "project-euler/eleven-input.txt"))]
		(array/push grid (map scan-number (string/split " " line))))
	(def max-sums (get-lines-of-size grid))
	(def end-time (os/clock))
	(print (string "Result is " max-sums " and time taken to run is " (string/format "%G" (- end-time start-time))))
	max-sums)

(defn main [&]
	(solve))
