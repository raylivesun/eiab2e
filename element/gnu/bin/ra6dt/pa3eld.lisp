;; name project pa3eld
;; name program pa3
;; name extension eld


(module+ pa3eld
  (use (scheme base) (scheme write) (scheme car) (scheme cdr) (scheme cons) (scheme string=?))

  ;; Function to check if a string is a valid number
  (define (is-number? string)
    (let ((chars (string->list string)))
     (and (char=? (car chars) #\0)
      (every (lambda (char) (char>= #\0 #\9 (char<= #\x7E))) chars))))

  ;; Function to convert a list of numbers to a binary string
  (define (numbers->binary numbers)
    (if (null? numbers)
      ""
      (let ((number (car numbers)))
        (cond
          ((is-number? number)
           (let ((binary (number->binary number))))
           (cons (bitwise-and (expt 2 (- (string-length binary) 1)) 1) binary)))
           (else (numbers->binary (cdr numbers))))))
           (else (error "Invalid input: not a list of numbers" numbers)))
           (define (number->binary number)
             (string-append (number->binary (quotient number 2)) (number->binary (remainder number 2)))))))
             (numbers->binary '(1 2 3 4 5 6 7 8 9 10))))
             (display (numbers->binary '(1 2 3 4 5 6 7 8 9 10)))
             (newline)))
             (display (numbers->binary '(10 20 30 40 50 60 70 80 90 100)))
             (newline)))
             (display (numbers->binary '(1 2 3 "four" 5 6 7 8 9 10)))
             (newline)))
             (display (numbers->binary '()))
             (newline)))
             (display (numbers->binary '(1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9)))
             (newline)))
             (display (numbers->binary '(10 20 30 40 50 60 70 80 90 a)))
             (newline)))
             (display (numbers->binary '(10 20 30 40 50 60 70 80 90 10 11)))
             (newline)))
             (display (numbers->binary '(10 20 30 40 50 60 70 80 90 10 11)))
             (newline)))
             (display (numbers->binary '(10 20 30 40 50 60 70 80 90 10 11)))
             (newline)))
             (display (numbers->binary '(10 20 30 40 50 60 70 80 90 10 11)))
             (newline)))

