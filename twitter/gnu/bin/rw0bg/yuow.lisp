;; name project yuow
;; name program yuo
;; name extension ow

(define-module project-yuow
  (require "yuow")
  (require "yuow-extensions")
  (require "yuow-extensions-ow")

  (define (format-ow input)
    (yuow-extensions-ow:format input))

  (define (validate-ow input)
   (yuow-extensions-ow:validate input)))

  ;; Example usage
  (format-ow "Hello, World!")
  ;; Output: "Hello, World!"
  (validate-ow "Hello, World!")
  ;; Output: #f (false)

  (format-ow "Hello, Yuow!")
  ;; Output: "Hello, Yuow!"
  (validate-ow "Hello, Yuow!")
  ;; Output: #t (true)




