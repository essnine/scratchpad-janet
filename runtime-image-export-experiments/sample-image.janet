(defn run-sample-func []
  (pp "Running func")
  (def va (+ 32 32))
  va)


(defn main [&]
  (pp (run-sample-func)))

