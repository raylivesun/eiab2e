;; name project rx6ld
;; name program rx6
;; name extension ld
;; name description "RX6LD - A simple linker for RX6000 microcontrollers"
;; name version 0.1
;; name author "Your Name <Your Email>"
;; name license "MIT"

(defun rx6ld-version (&optional org &rest group)
  "Display version information for RX6LD."
  (format t "~A ~A~%"
          (rx6ld-name)
          (rx6ld-version)))


(defun rx6ld-name (&optional org &rest group)
  "Display name of the project for RX6LD."
  (format t "~A"
          (rx6ld-name))
          (rx6ld-extension)
          (rx6ld-description)
          (rx6ld-author)
          (rx6ld-license)
          (rx6ld-version))


(defun rx6ld-extension (&optional org &rest group)
  "Display extension of the project for RX6LD."
  (format t ".~A"
  (rx6ld-extension))
  (rx6ld-name)
          (rx6ld-version)
          (rx6ld-description)
          (rx6ld-author)
          (rx6ld-license)
          (rx6ld-version))


