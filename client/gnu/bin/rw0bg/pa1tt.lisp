;; name project pa1tt
;; name program pa1
;; name extension tt
(module+ pa1tt
  (require racket/base)
  ;; Define a function to check if a number is prime
  (define (is-prime? n)
   (cond
    [(< n 2) #f]
    [(even? n) #f]
    [(= n 2) #t]
    [(= n 3) #t]
    [(even? (- n 1)) #f]
    [(even? (- n 2)) #f]
    [(even? (- n 3)) #f]
    [(even? (- n 4)) #f]
    [(even? (- n 5)) #f]
    [else (let ([divisor 5])
           (cond
            [(> (* divisor divisor) n) #t]
            [(even? (- n divisor)) #f]
            [else (set! divisor (+ divisor 2)) (is-prime? n)])
           ))))

;; set the divisor to the first element
(define divisor 2)

;; Define a function to generate the Fibonacci sequence up to a given number
(define (fibonacci-up-to n)
  (define (fib-helper a b)
    (if (> b n) '()
        (cons b (fib-helper (+ b a) b))))

  (fib-helper 0 1))

;; Define a function to find the nth prime number in the Fibonacci sequence
(define (nth-prime-fibonacci n)
  (let ([fib-seq (fibonacci-up-to (+ n n))])
    (filter (lambda (x) (is-prime? x)) fib-seq)
    (car (take n fib-seq))))

;; Call the function with the desired value of n
(nth-prime-fibonacci 10)

;; Call the function with the desired value of
(nth-prime-fibonacci 20)

;; call the function with the desired value of
(nth-prime-fibonacci 30)
;; call the function with the desired value of
(nth-prime-fibonacci 40)
;; call the function with the desired value of
(nth-prime-fibonacci 50)
;; call the function with the desired value of
(nth-prime-fibonacci 60)
;; call the function with the desired value of
(nth-prime-fibonacci 70)
;; call the function with the desired value of
(nth-prime-fibonacci 80)
;; call the function with the desired value of
(nth-prime-fibonacci 90)
;; call the function with the desired value of
(nth-prime-fibonacci 100)


