;; name program et3ja
;; name program et3
;; name extension ja
(defvar et3ja-program-name "et3ja"
  "The name of the Emacs major mode for Japanese LaTeX documents.")

;; name extension et3
(defvar et3ja-file-extensions '(".tex" ".ltx")
  "The file extensions for Japanese LaTeX documents.")

;; hook function
(add-hook 'TeX-mode-hook
  (lambda ()
    (et3ja-setup-font-lock)))



;; function to setup font lock
(defun et3ja-setup-font-lock ()
  ;; Define font lock syntax for Japanese LaTeX documents
  (font-lock-add-keywords
   'tex-mode
   '((font-lock-keywords
      (,(regexp-quote "\\begin{document}") . font-lock-function-name-face)
      (,(regexp-quote "\\begin{part}") . font-lock-function-name-face)
      (,(regexp-quote "\\begin{chapter}") . font-lock-function-name-face)
      (,(regexp-quote "\\begin{section}") . font-lock-function-name-face)))))


;; // section header
;; (defun et3ja-section-header-face ()
;;   ;; Define face for section headers
;;   (font-lock-add-keywords
;;    'tex-mode
;;    '((font-lock-keywords
;;      (,(regexp-quote "\\section{}") . et3ja-section-header-face)
;;      (,(regexp-quote "\\section*{}") . et3ja-section-header-face)
;;      (,(regexp-quote "\\subsection{}") . font-lock-subheading-face)
;;      (,(regexp-quote "\\subsection*{}") . font-lock-subheading-face)
;;      (,(regexp-quote "\\subsubsection{}") . font-lock-subsubheading-face)
;;      (,(regexp-quote "\\subsection*{.*}") . font-lock-subsubheading-face)
;;      (,(regexp-quote "\\section*{.*}") . et3ja-section-header-face)
;;      (,(regexp-quote "\\part{}") . et3ja-part-header-face)
;;      (,(regexp-quote "\\part*{.*}") . et3ja-part-header-face)
;;      (,(regexp-quote "\\chapter{}") . et3ja-chapter-header-face)
;;      (,(regexp-quote "\\chapter*{.*}") . et3ja-chapter-header-face)
;;      (,(regexp-quote "\\section[.*]") . et3ja-section-header-face)
;;      (,(regexp-quote "\\section*{.*}[.*]") . et3ja-section-header-face)
;;      (,(regexp-quote "\\section*[.*}[.*]") . et3ja-section-header-face)
;;      (,(regexp-quote "\\section*[.*][.*][.*]") . et3ja-section-header-face)
;;      (,(regexp-quote "\\section*[.*][.*][.*][.*]") . et3ja-section-header-face)
;;      ;;... add more section headers as needed
;;    ))))

