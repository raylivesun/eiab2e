;; name project ew8ok
;; name program ew8
;; name extension ok
;; name function ew8

(defun ew8ok:ew8 (file-name)
  "Check if a file is a valid ew8ok project."
  ;; Check if the file name ends with ".ew8ok"
  (string-equal (file-name-extension file-name) ".ew8ok")
  ;; Check if the file name starts with "ew8ok-"
  (string-equal (substring file-name 0 6) "ew8ok-"))
  ;; Check if the file contains a valid project name
  (let ((project-name (file-name-sans-extension file-name)))
   (string-match "^[a-zA-Z0-9_-]+$" project-name))
  ;; Check if the file contains a valid program name
  (let ((program-name (nth 1 (string-split "-" file-name))))
   (string-match "^[a-zA-Z0-9_-]+$" program-name))
  ;; Check if the file contains a valid extension name
  (let ((extension-name (nth 2 (string-split "-" file-name)))))
   (string-match "^[a-zA-Z0-9_-]+$" extension-name)
  ;; Check if the file contains a valid function name
  (let ((function-name (nth 3 (string-split "-" file-name))))
   (string-match "^[a-zA-Z0-9_-]+$" function-name))
  ;; Return true if all checks pass)
  (and (string-equal (file-name-extension file-name) ".ew8ok"))
   (string-equal (substring file-name 0 6) "ew8ok-")
   (string-match "^[a-zA-Z0-9_-]+$" project-name)
   (string-match "^[a-zA-Z0-9_-]+$" program-name)
   (string-match "^[a-zA-Z0-9_-]+$" extension-name)
   (string-match "^[a-zA-Z0-9_-]+$" function-name)

