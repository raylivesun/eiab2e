;; name project k0vw
;; name program k0
;; name extension vw

;; define the program
(defprogram k0
  ;; define the input ports
  (input-ports [(input-port "input_vw")])
  ;; define the output ports
  (output-ports [(output-port "output_vw")])
  ;; define the code
  (let ((vw (open-input-file "input_vw")))
   (with-open [output (open-output-file "output_vw")]
     (loop
       (let ((line (read-line vw)))
         (when line
          (write-line output line)))))))


;; with open [output (open-output-file "output_")]
;;   (loop
;;     (let ((line (read-line vw)))
;;       (when line
;;         (write-line output line))))
;; ;; )
