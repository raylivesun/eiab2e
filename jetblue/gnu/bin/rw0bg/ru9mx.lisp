;; name project ru9mx
;; name program ru9
;; name extension mx
;; description A simple RUST program to generate a random math expression
;; version 1.0.0

(defun with-version()
  (format "ru9mx v~a~%" project-version))

(defun generate-expression()
  (let ((operators '("+")))
  (format "~a ~a ~a"
        (random (length operators))
        (random 10)
        (random 10))))



(defun main()
  (print (with-version))
  (print (generate-expression)))

(main)

