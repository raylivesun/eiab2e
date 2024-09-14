;; name project f6deom
;; name program f6d
;; name extension eom
;; name version 0.1.0

(module+ 'f6d
  (use 'cl-ppcre)
  (use 'cl-ppcre-posix)
  (use 'alexandria)
  (use 'cffi)
  (use 'trivial-features)
  (use 'trivial-gray-streams)
  (use 'trivial-gray-streams-utf8)
  (use 'trivial-gray-streams-utf8-unicode)
  (use 'trivial-gray-streams-utf8-unicode-case-fold)
  (use 'trivial-gray-streams-utf8-unicode-code-point)
  (use 'trivial-gray-streams-utf8-unicode-code-point-case-fold)
  (use 'trivial-gray-streams-utf8-unicode-code-point-case-fold-case-insensitive)
  (use 'trivial-gray-streams-utf8-unicode-code-point-case-fold-insensitive-case-insensitive)
  (use 'trivial-gray-streams-utf8-unicode-code-point-case-fold-insensitive-case-insensitive-fold)
  (use 'trivial-gray-streams-utf8-unicode-code-point-case-fold-insensitive-fold-case-insensitive)
  (use 'trivial-gray-streams-utf8-unicode-code-point-case-fold-insensitive-fold-case-insensitive-ignore-whitespace)
  (use 'trivial-gray-streams-utf8-unicode-code-point-case-fold-insensitive-fold-case-insensitive-ignore-whitespace-fold))


;; Define a function to load a file and convert it to a string
(defun load-file-to-string (file-name)
  (with-open-file (stream file-name :direction :input)
    (with-simple-string-output-stream (output-stream)
     (copy-stream stream output-stream)
     (string-stream-contents output-stream))))


;; Define a function to check if a string matches a pattern
(defun string-matches-pattern (pattern string)
  (ppcre:match pattern string))


;; Define a function to find all matches of a pattern in a string
(defun find-all-matches-of-pattern (pattern string)
  (ppcre:all-matches pattern string))


;; Define a function to convert a string to lowercase
(defun string-to-lowercase (string)
  (alexandria:downcase string))


;; Define a function to convert a string to uppercase
(defun string-to-uppercase (string)
  (alexandria:uppercase string))


;; Define a function to convert a string to title case
(defun string-to-title-case (string)
  (alexandria:title-case string))

;; Define a function to convert a string to snake case
(defun string-to-snake-case (string))

  ;; Split the string into words
  (let ((words (ppcre:split "\\s+" string)))

    ;; Convert each word to snake case
    (mapcar (lambda (word)
              (string-to-lowercase
               (ppcre:replace "^([[:lower:]])" "\\U\\1" word)
               (ppcre:replace "[[:upper:]]+" "_\\1" word)))
               words))

    ;; Join the words into a single string
    (string-join (nreverse words) "_")

;; Load the EOM file
(defvar eom-file-path "eom.txt")
(let ((eom-string (load-file-to-string eom-file-path)))
  ;; Find all matches of the pattern
  (let ((matches (find-all-matches-of-pattern pattern eom-string)))

    ;; Convert the matches to lowercase
    (let ((lowercase-matches (mapcar string-to-lowercase matches)))

      ;; Convert the matches to title case
      (let ((title-case-matches (mapcar string-to-title-case lowercase-matches)))

        ;; Convert the matches to snake case
        (let ((snake-case-matches (mapcar string-to-snake-case title-case-matches)))

          ;; Print the matches
          (format t "~&~%~a~%" "Matches:")
          (dolist (match lowercase-matches)
            (format t "~&~a~%" match))
            (format t "~&~a~%" (string-to-title-case match)))
            (format t "~&~a~%" (string-to-snake-case match)))
            (format t "~&~%~n~%"))))


;; Define the pattern to search for
(defvar pattern "example")

;; Call the function with the defined pattern
(f6d:find-and-convert-eom-matches pattern)

