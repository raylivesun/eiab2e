;; name project og5b
;; name program og5
;; name extension b
;; name extension o

;; description This is a simple text editor written in Scheme.

;; import necessary libraries
(import (scheme base)
        (scheme process)
        (scheme textio)
        (scheme syntax)
        (scheme list)
        (scheme string)
        (scheme file)
        (scheme read-eval-print)
        (scheme write)
        (scheme read)
        (scheme display)
        (scheme char)
        (scheme symbol)
        (scheme cons)
        (scheme car)
        (scheme cdr)
        (scheme null?)
        (scheme list?)
        (scheme vector)
        (scheme vector-ref)
        (scheme vector-set!)
        (scheme vector-length)
        (scheme vector-copy)
        (scheme vector->list)
        (scheme list->vector)
        (scheme string->symbol)
        (scheme symbol->string)
        (scheme string-length)
        (scheme string-substring)
        (scheme string-append)
        (scheme string-ref)
        (scheme string-equal?)
        (scheme string-downcase)
        (scheme string-trim)
        (scheme string-for-each)
        (scheme string-map)
        (scheme string-fold-left)
        (scheme string-split)
        (scheme string-join)
        (scheme string-for-each-char)
        (scheme string-map-char)
        (scheme string-fold-left-char)
        (scheme string-trim-left)
        (scheme string-trim-right)
        (scheme string-trim-both)
        (scheme string-split-at)
        (scheme string-split-at-char)
        (scheme string-split-at-whitespace)
        (scheme string-split-at-non-whitespace)
        (scheme string-split-at-non-alphanumeric)
        (scheme string-split-at-alphanumeric)
        (scheme string-split-at-symbol)
        (scheme string-split-at-comma)
        (scheme string-split-at-semicolon)
        (scheme string-split-at-colon)
        (scheme string-split-at-equal)
        (scheme string-split-at-hash)
        (scheme string-split-at-question)
        (scheme string-split-at-exclamation)
        (scheme string-split-at-plus)
        (scheme string-split-at-minus)
        (scheme string-split-at-asterisk)
        (scheme string-split-at-slash)
        (scheme string-split-at-percent)
        (scheme string-split-at-ampersand)
        (scheme string-split-at-pipe)
        (scheme string-split-at-caret)
        (scheme string-split-at-underscore)
        (scheme string-split-at-backtick)
        (scheme string-split-at-at)
        (scheme string-split-at-dollar)
        (scheme string-split-at-hash-hash)
        (scheme string-split-at-percent-percent)
        (scheme string-split-at-ampersand-ampersand)
        (scheme string-split-at-pipe-pipe)
        (scheme string-split-at-caret-caret)
        (scheme string-split-at-underscore-underscore)
        (scheme string-split-at-backtick-backtick)
        (scheme string-split-at-at-at)
        (scheme string-split-at-dollar-dollar)
        (scheme string-split-at-hash-hash-hash)
        (scheme string-split-at-percent-percent-percent)
        (scheme string-split-at-ampersand-ampersand-ampersand)
        (scheme string-split-at-pipe-pipe-pipe)
        (scheme string-split-at-caret-caret-caret-caret)
        (scheme string-split-at-underscore-underscore-underscore)
        (scheme string-split-at-backtick-backtick-backtick)
        (scheme string-split-at-at-at-at)
        (scheme string-split-at-dollar-dollar-dollar)
        (scheme string-split-at-hash-hash-hash-hash)
        (scheme string-split-at-percent-percent-percent-percent)
        (scheme string-split-at-ampersand-ampersand-ampersand-ampersand))


;; define the main editor function
(define (editor filename)
  ;; open the file
  (let ((file (open-input-file filename)))
   ;; create an empty buffer
   (let ((buffer (make-vector (string-length (read-line file)) #\space)))
    ;; read the file line by line and insert it into the buffer
     (do ((line (read-line file) (read-line file)))
         ((null? line)
          ;; close the file
          (close-input-port file)
          ;; display the buffer
          (display-buffer buffer)))
          (vector-set! buffer line-number line))
          ;; reset line number
          (define line-number 0))
          ;; prompt the user for input
          (display "> ")
          ;; read the user's input
          (let ((input (read)))
           ;; check if the user wants to save the buffer
            (if (string=? input "save")
                ;; save the buffer to a new file
                (let ((new-filename (prompt-for-filename "Save as:")))
                 (write-buffer buffer new-filename)
                 (display "Buffer saved to " new-filename)
                 (newline))
                ;; check if the user wants to quit
                (if (string=? input "quit")
                    (display "Goodbye!")
                    ;; check if the user wants to search for a pattern
                    (if (string=? input "search")
                     ;; prompt the user for a pattern
                     (let ((pattern (prompt-for-string "Search for:")))
                      ;; find all occurrences of the pattern in the buffer
                      (let ((positions (string-positions pattern buffer)))
                       ;; display the positions of the pattern in the buffer
                       (display "Occurrences of \"" pattern "\" at:")
                       (string-for-each (lambda (position) (display (string-ref buffer position) " ")) positions)
                       (newline))))
                        ;; check if the user wants to replace a pattern
                        (if (string=? input "replace")
                         ;; prompt the user for a pattern and replacement
                         (let ((pattern (prompt-for-string "Search for:"))
                               (replacement (prompt-for-string "Replace with:")))
                               ;; replace all occurrences of the pattern in the buffer
                               (let ((positions (string-positions pattern buffer)))
                                (vector-set! buffer positions
                                 (string-set! buffer (string-replace pattern replacement buffer) positions (length positions))
                                (display "Occurrences of \"" pattern "\" replaced with \"" replacement "\"")
                                (newline))))
                                ;; check if the user wants to undo
                                (if (string=? input "undo")
                                 ;; undo the last change to the buffer
                                 (let ((last-change (vector-ref buffer (- (vector-length buffer) 1))))
                                  (vector-set! buffer (- (vector-length buffer) 1) last-change)
                                  (display "Last change undone.")
                                  (newline))))
                                  ;; check if the user wants to redo
                                  (if (string=? input "redo")
                                   ;; redo the last undone change to the buffer
                                   (let ((last-change (vector-ref buffer (- (vector-length buffer) 1))))
                                    (if (null? last-change)
                                     (display "No more changes to redo.")
                                     (else
                                      (vector-set! buffer (- (vector-length buffer) 1) last-change)
                                      (display "Last change redone.")
                                      (newline)))
                                       ;; check if the user wants to jump to a line number
                                       (if (string=? input "jump")
                                        ;; prompt the user for a line number
                                        (let ((line-number (prompt-for-integer "Jump to line number:" 1)))
                                         ;; check if the line number is valid
                                         (if (<= line-number (vector-length buffer))
                                          (vector-set! buffer line-number (string-ref buffer line-number))
                                          (display "Invalid line number.")
                                          (newline))
                                          (display "Jumped to line number " line-number ".")))))))))
                                          (display "Invalid command.")
                                          (newline)