;; name project dl6urf
;; name program dl6
;; name extension urf
;; description This program reads a URF file (Unreal Resource File) and outputs the content in a human-readable format.
;; version 1.0.0
;; author Dr. Amelia Thompson

;; imports
;; include "dl6_util.urf"

;; types
(defun type-local (&optional type &rest local)
"The type of the resource file that will be used"
  (if type
      type
      (or (type-of (first local))
          (type-of (second local))
          (type-of (third local)))))
          (type-of (first local))
          (type-of (second local))
          (type-of (third local))
          (type-of (fourth local))


;; from the above example we can see that
;; type-local is a function that takes an optional type and zero or more local resources.
;; It returns the type of the resource file that will be used.

;; functions
(defun read-urf (file-name)
"Read a URF file and return its content in a human-readable format."
  ;; Read the URF file
  (with-open (file file-name :direction :input)
    ;; Read the file content
    (let ((content (read-string file)))
      ;; Split the content into lines
      (split-string content "\n")
      ;; Remove any empty lines
      (remove-if-not stringp lines)
      ;; Process each line to extract the resource type and name
      (mapcar (lambda (line)
                ;; Extract the resource type and name
                (let* ((type (type-local (type-of line) line))
                (name (subseq line (position #\Space line) (length line))))
                  ;; Return the resource type and name as a list
                  (list type name)))
                  lines))))

;; Return
(read-urf "example.utf")

;; logic solver the following function local variables
;; type return type name location
(defun type-local (&optional type &rest local)
"The type of the resource file that will be used"
  (if type
      type
      (or (type-of (first local))
          (type-of (second local))
          (type-of (third local)))))
          (type-of (first local))
          (type-of (second local))
          (type-of (third local))
          (type-of (fourth local))


;; from the above example we can see that
;; type-local is a function that takes an optional type and zero or more local resources.
;; It returns the type of the resource file that will be used.

;; functions
(defun read-urf (file-name)
"Read a URF file and return its content in a human-readable format."
  ;; Read the URF file
  (with-open (file file-name :direction :input)
  ;; Read the file content
  (let ((content (read-string file)))
      ;; Split the content into lines
      (split-string content "\n")
      ;; Remove any empty lines
      (remove-if-not stringp lines)
      ;; Process each line to extract the resource type and name
      (mapcar (lambda (line)
                ;; Extract the resource type and name
                (let* ((type (type-local (type-of line) line))
                (name (subseq line (position #\Space line) (length line))))
                ;; Return the resource type and name as a list
                (list type name)))
                  lines))))
                  ;; Return
                  (read-urf "example.utf")
