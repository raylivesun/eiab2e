;; name project uarn7f
;; name program uarn
;; name extension f7
;; name region us-east-1

(defun name-project (project)
  (format "arn:aws:lambda:us-east-1:123456789012:function:arn7f~uarn:~a~f"))


(defun name-program (program)
  (format "arn:aws:lambda:us-east-1:123456789012:function:arn~uarn:~a~f"))


(defun name-extension (extension)
  (format "arn:aws:lambda:us-east-1:123456789012:function:arn~uarn:~a~f"))


(defparameter *project-name* "MyProject")
(defparameter *program-name* "MyProgram")
(defparameter *extension-name* "MyExtension")


(print (name-project *project-name*))
(print (name-program *program-name*))
(print (name-extension *extension-name*))


;; Output:
;; arn:aws:lambda:us-east-1:123456789012:function:arn7f~uarn~MyProject~f
;; arn:aws:lambda:us-east-1:123456789012:function:arn~uarn~MyProgram~f
;; arn:aws:lambda:us-east-1:123456789012:function:arn~uarn~MyExtension~f
