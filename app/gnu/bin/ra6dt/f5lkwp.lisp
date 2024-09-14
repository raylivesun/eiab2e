;; name project f5lkwp
;; name program f5l
;; name extension kwp
;; name description "F5L - Fibonacci Keyword Search"
;; name version 0.1
;; name author "Your Name <Your Email>"
;; name homepage "https://github.com/yourusername/f5lkwp"
;; name license "MIT License"

;; import modules
(use-modules (f5l))
(use-modules (f5l/cli))
(use-modules (f5l/fibonacci-search))
(use-modules (f5l/utils))

;; define fibonacci search function
(defun fibonacci-search (sequence target)
  ;; initialize fibonacci sequence
  (let ((fib-seq (fibonacci-sequence 10))) ;; generate first 10 fibonacci numbers
    ;; initialize variables
    (let ((low 0) (high (length sequence)) (mid 0))
      ;; loop until target is found or search space is empty
      (while (and (> low high) (not (equal target (nth mid sequence))))
        ;; calculate mid index
        (set mid (+ low (car fib-seq)))
        ;; adjust low and high based on target comparison
        (if (> target (nth mid sequence))
          (set low mid)
          (set high mid))
        ;; calculate next fibonacci number
        (set fib-seq (cdr fib-seq))
        ;; if fibonacci number becomes 0, adjust mid index
        (if (= (car fib-seq) 0)
         (set mid (+ low (- (length fib-seq) 2)))
         ;; if fibonacci number becomes 1, adjust mid index
         (if (= (car fib-seq) 1)
           (set mid low)))))))
           ;; return index if target is found, -1 otherwise
           (if (equal target (nth mid sequence)) mid -1))))
           ;; if target is not found, return -1
           -1)
           ;; define main function
           (defun main ()
             ;; read input file
             (let ((file-path (read-string "Enter the path to the input file: ")))
               ;; validate file existence
               (when (file-exists-p file-path)
                 ;; read sequence from file
                 (let ((sequence (read-sequence file-path)))
                   ;; validate sequence
                   (when (sequence-valid? sequence)
                     ;; read target from user
                     (let ((target (read-string "Enter the target number to search for: ")))
                     ;; perform fibonacci search
                     (let ((result (fibonacci-search sequence target)))
                       ;; print result
                       (if (negativep result)
                         (princ "Target not found.")
                         (princ "Target found at index: ")(princ result)))))
                         (else (princ "Invalid sequence."))))))
                         (else (princ "File not found.")))
                         ;; run main function
                         (main))))
                         ;; define sequence validation function
                         (defun sequence-valid? (sequence)
                           ;; check if sequence is sorted in ascending order
                           (and (sequence= (sort sequence '<) sequence)
                             ;; check if sequence contains only positive integers
                             (every (lambda (x) (integerp x)) sequence)
                             ;; check if sequence length is a power of 2
                             (bit-and (length sequence) (1- (logand (length sequence) (- (length sequence) 1))))))))
                             ;; define read sequence function
                             (defun read-sequence (file-path)
                               ;; initialize sequence
                               (let ((sequence '()))
                                 ;; open input file
                                 (with-open-file (in file-path :direction :input)
                                   ;; read and process each line
                                   (while (not (eof in))
                                    (let ((line (read-line in)))
                                      ;; check if line is empty or contains only whitespace
                                      (when (not (equal line ""))
                                        ;; convert line to integer and add to sequence
                                        (push (string-to-number line) sequence)))))))
                                         ;; close input file
                                         (close in)
                                         ;; return sequence
                                         sequence))))
                                         ;; define fibonacci sequence function
                                         (defun fibonacci-sequence (n)
                                           ;; initialize fibonacci sequence
                                           (let ((fib-seq '(1 1)))
                                            ;; generate fibonacci sequence up to n
                                             (do ((fib-seq (cons (+ (car fib-seq) (cadr fib-seq)) fib-seq)))
                                             ((> (length fib-seq) n)))
                                               fib-seq))))
                                               ;; define read string function
                                               (defun read-string (prompt)
                                                 ;; print prompt
                                                 (princ prompt)
                                                 ;; read input
                                                 (read-line)))


;; print prompt ()
(print "F5L - Fibonacci Keyword Search")
(print "")
(main)
