;; name project la6lda
;; name program la6
;; name extension lda


(defmodule LA6LDA
  (require 'la6)
  (require 'math)
  (require 'pprint)
  (require 'random)
  (require 'sets))


;; Load the dataset
(def dataset (la6/load-dataset "dataset.txt"))

;; Define the number of topics and iterations
(def num-topics 10)
(def num-iterations 100)

;; Initialize the model
(def model (LA6LDA/initialize-model dataset num-topics num-iterations))

;; Run the LDA algorithm
(LA6LDA/run-lda model dataset num-topics num-iterations)

;; Print the top words for each topic
(LA6LDA/print-top-words model num-topics)

;; Print the top documents for each topic
(LA6LDA/print-top-documents model num-topics)


;; Define a function to print the top words for each topic
(defn print-top-words [model num-topics]
  (pprint (LA6LDA/top-words model num-topics))
  nil)

;; Define a function to print the top documents for each topic
(defn print-top-documents [model num-topics]
  (pprint (LA6LDA/top-documents model num-topics))
  nil)


;; Run the program
(main)
