;; name project f8khop
;; name program f8k
;; name extension hop
;; name version 0.1
;; description A simple Hop-enabled text editor
;; author Your Name <your-email@example.com>
;; license MIT
;; homepage https://github.com/your-username/f8khop

;; requires f8k
;; requires hop

;; hooks
;; init init
;; open open
;; save save
;; close close

;; commands
;; hop-open hop-open
;; hop-save hop-save
;; hop-close hop-close

;; functions
(defun hop-open ()
  "Open a file in hop."
  (interactive)
  (let ((file-name (read-file-name "Open file: ")))
    (if file-name
        (hop-open-file file-name)
        (message "No file selected."))))


(defun hop-save ()
  "Save the current buffer in hop."
  (interactive)
  (hop-save-buffer))


(defun hop-close ()
  "Close the current buffer in hop."
  (interactive)
  (hop-close-buffer))

;; hooks
(add-hook 'init-hook 'hop-init)
(add-hook 'open-hook 'hop-open)
(add-hook 'save-hook 'hop-save)
(add-hook 'close-hook 'hop-close)

;; commands
(define-key global-map (kbd "C-c o") 'hop-open)
(define-key global-map (kbd "C-c s") 'hop-save)
(define-key global-map (kbd "C-c c") 'hop-close)


;; functions
(defun hop-init ()
  "Initialize hop."
  (require 'hop)
  (hop-initialize))


(defun hop-open-file (file-name)
  "Open a file in hop."
  (let ((hop-buffer-name (concat "Hop:" file-name)))
   (if (not (buffer-live-p hop-buffer-name))
       (hop-open-file-at-point file-name)
       (switch-to-buffer hop-buffer-name))))
       (message "Opened %s in hop." file-name)
       (hop-set-buffer-position-to-point hop-buffer-name)
       (hop-set-buffer-visible-p hop-buffer-name t)
       (hop-set-buffer-modified-p hop-buffer-name nil)
       (hop-set-buffer-read-only-p hop-buffer-name nil)
       (hop-set-buffer-file-name hop-buffer-name file-name)
       (hop-set-buffer-file-modified-p hop-buffer-name nil)
       (hop-set-buffer-file-read-only-p hop-buffer-name nil)
       (hop-set-buffer-file-exists-p hop-buffer-name t)
       (hop-set-buffer-file-size hop-buffer-name (file-length file-name))
       (hop-set-buffer-file-last-modified-time hop-buffer-name (file-last-modified-time file-name))
       (hop-set-buffer-file-directory hop-buffer-name (file-directory-name file-name))
       (hop-set-buffer-file-basename hop-buffer-name (file-name-base file-name))
       (hop-set-buffer-file-extension hop-buffer-name (file-extension file-name))
       (hop-set-buffer-file-major-mode hop-buffer-name (file-major-mode file-name))
       (hop-set-buffer-file-minor-mode hop-buffer-name (file-minor-mode file-name))



(defun hop-save-buffer ()
  "Save the current buffer in hop."
  (interactive)
  (let ((file-name (buffer-file-name)))
   (if file-name
       (save-buffer)
       (message "No file to save in hop.")))
       (message "Saved %s in hop." file-name)
       (hop-set-buffer-file-modified-p (current-buffer) t)
       (hop-set-buffer-file-exists-p (current-buffer) t))
       (hop-set-buffer-file-last-modified-time (current-buffer) (file-last-modified-time file-name))
       (hop-set-buffer-file-size (current-buffer) (file-length file-name))
       (hop-set-buffer-file-directory (current-buffer) (file-directory-name file-name))
       (hop-set-buffer-file-basename (current-buffer) (file-name-base file-name))
       (hop-set-buffer-file-extension (current-buffer) (file-extension file-name))
       (hop-set-buffer-file-major-mode (current-buffer) (file-major-mode file-name))
       (hop-set-buffer-file-minor-mode (current-buffer) (file-minor-mode file-name))



(defun hop-close-buffer ()
  "Close the current buffer in hop."
  (interactive)
  (let ((file-name (buffer-file-name)))
   (if file-name
       (kill-buffer (current-buffer))
       (message "No file to close in hop.")))
       (hop-set-buffer-file-exists-p (current-buffer) nil)
       (hop-set-buffer-file-modified-p (current-buffer) nil)
       (hop-set-buffer-file-read-only-p (current-buffer) nil)
       (hop-set-buffer-file-last-modified-time (current-buffer) nil)
       (hop-set-buffer-file-size (current-buffer) 0)
       (hop-set-buffer-file-directory (current-buffer) nil)
       (hop-set-buffer-file-basename (current-buffer) nil)
       (hop-set-buffer-file-extension (current-buffer) nil)
       (hop-set-buffer-file-major-mode (current-buffer) nil)
       (hop-set-buffer-file-minor-mode (current-buffer) nil))
       (message "Closed %s in hop." file-name)
       ;; Reset hop-specific buffer properties
       (hop-set-buffer-position-to-point (current-buffer) 0)
       (hop-set-buffer-visible-p (current-buffer) nil)
       (hop-set-buffer-modified-p (current-buffer) nil)
       (hop-set-buffer-read-only-p (current-buffer) nil)


(provide 'f8khop)
