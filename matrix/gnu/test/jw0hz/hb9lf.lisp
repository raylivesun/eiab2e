;; name project hb9lf
;; name program hb9
;; name extension lf
;; name version 0.0.1
;; name description "A simple text editor with syntax highlighting and line numbering"

(defun hb0lf-project (project)
  (with-temp-directory (temp-dir)
    (let ((project-dir (concat temp-dir project)))
      (make-directory project-dir)
      (hb0lf-create-file project-dir "hb9.lf")
      (hb0lf-create-file project-dir "syntax.lf")
      (hb0lf-create-file project-dir "init.lf")
      (hb0lf-create-file project-dir "config.lf")
      (hb0lf-create-file project-dir "project.lf")
      (hb0lf-create-file project-dir "README.md"))))


(defun hb0lf-create-file (project-dir file-name)
  (with-current-directory project-dir
   (with-temp-buffer
     (insert-file-contents file-name)
     (save-buffer)))
     (message "Created %s" file-name))
     (hb0lf-project "hb9lf")


(hb0lf-create-file "hb9lf" "hb9.lf")
(hb0lf-create-file "hb9lf" "syntax.lf")
(hb0lf-create-file "hb9lf" "init.lf")
(hb0lf-create-file "hb9lf" "config.lf")
(hb0lf-create-file "hb9lf" "project.lf")
(hb0lf-create-file "hb9lf" "README.md")
