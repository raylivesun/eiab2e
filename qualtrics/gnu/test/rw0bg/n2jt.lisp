;; name project n2jt
;; name program n2
;; name extension jt
;; name version 1.0.0

(project
  :name "n2jt"
  :description "A simple calculator in Java"
  :author "John Doe"
  :license "MIT"
  :url "https://github.com/johndoe/n2jt"
  :dependencies [[org.clojure/clojure "1.10.1"]]
  :main n2)

(defproject n2jt "1.0.0"
  :description "A simple calculator in Java"
  :url "https://github.com/johndoe/n2jt"
  :license {:name "MIT License"
            :url "http://opensource.org/licenses/MIT"}

  :dependencies [[org.clojure/clojure "1.10.1"]])


(defn main [& args]
  (println "Welcome to n2jt!")
  (loop []
   (println "Enter an expression (e.g., 2 + 3):")
   (let [input (read-line)]
     (cond
      (nil? input) (println "Goodbye!")
       (try
        (let [result (eval (read-string input))]
          (println "Result: " result)))))))


(defn + [a b]
  (+ a b))

(defn - [a b]
  (- a b))

(defn * [a b]
  (* a b))

(defn / [a b]
  (if (= b 0)
    (throw (Exception. "Division by zero is not allowed."))))