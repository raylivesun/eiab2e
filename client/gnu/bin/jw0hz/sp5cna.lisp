;; name project sp5cna
;; name program sp5
;; name extension cna
;; name library sp5

;; library sp5

(library sp5
  (export (all))

  ;; Define the type for SP5 objects
  (type SP5-object
   (field (name :string)
         (value :integer)))

  ;; Define the type for SP5-collection objects
  (type SP5-collection
   (field (objects :vector SP5-object)))

  ;; Define the function to add an object to a collection
  (defun add-object (collection object)
   (let ((new-objects (cons object (vector-copy collection))))
     (make-sp5-collection :objects new-objects)))
     ;; Define the function to find an object by name in a collection
     (defun find-object (collection name)
      (let ((found nil))
        (dolist (object collection)
         (if (equal (field-value object :name) name)
          (setf found object)
          (return found)))
          (return found))
          (values nil))
          ;; Define the function to calculate the sum of values in a collection
          (defun sum-values (collection)
           (let ((total 0))
             (dolist (object collection)
              (incf total (field-value object :value)))
             (return total)))
             ;; Define the function to calculate the average value in a collection
             (defun average-values (collection)
              (let ((total (sum-values collection)))
               (if (> total 0)
                (float (/ total (length collection))
                 :default 0.0))))
                ;; Define the function to sort a collection by value in descending order
                (defun sort-by-value (collection))
                 (let ((sorted-objects (sort (lambda (a b) (> (field-value b :value) (field-value a :value))) collection)))
                  (make-sp5-collection :objects sorted-objects)))
                  ;; Define the function to filter a collection by value range
                  (defun filter-by-value (collection min-value max-value))

