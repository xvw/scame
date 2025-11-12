;;; cram-mode.el --- Emacs mode for CRAM tests            -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Kiran Gopinathan, 2024 Michael Shulman, 2025 Xavier Van de Woestyne

;; Authors: Kiran Gopinathan, Michael Shulman, Xavier Van de Woestyne
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;;; Imports & Declarations:

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.t$" . cram-mode))

;;; Font lock syntax highlighting:

(defvar cram--font-lock-defaults
  '((
     ("^  [^$>][^\n]*\n" . font-lock-comment-face)
     ("\\(^ ?\n\\|^ ?[^ \n][^\n]*\n\\)" . font-lock-doc-face)
     ;; ("\\(^  \\$[^\n]*\n\\|^  >[^\n]*\n\\)" . font-lock-type-face)
     ;; ("^[^\"]*\\(\"[^\"\n]*\"\\)[^\"]*$" . (1 font-lock-string-face))
     ("\"\\([^\"\n]\\|\\\"\\)*\"" . (0 font-lock-string-face))
     ("'\\([^'\n]\\|\\'\\)*'" . font-lock-string-face)
     ))
  ;; "Default highlighting expressions for cram mode"
  )

;;; Compilation functions:

(defun cram-mode-compile ()
  "Compile the project and run cram test."
  (interactive)
  (compile "CLICOLOR_FORCE=1 OCAML_COLORS=always dune runtest"))

(defun cram-mode-compile-and-promote ()
  "Compile the project and run cram test, promote results."
  (interactive)
  (compile "CLICOLOR_FORCE=1 OCAML_COLORS=always dune runtest --auto-promote"))

(defun cram-mode-relative-position ()
  "Compute a position from a virtual file into a cram file"
  (interactive)
  (save-excursion
    (let ((orig-line (line-number-at-pos))
          (orig-char (current-column))
          start-line
          delim)
      (unless (re-search-backward "<<\\([A-Za-z0-9_]+\\)" nil t)
        (user-error "Heredoc not found"))
      (setq delim (match-string 1))
      (setq start-line (1+ (line-number-at-pos)))
      (save-excursion
        (when (re-search-forward (concat "^\\s-*\\(" delim "\\)\\s-*$") nil t)
          (let ((end-line (line-number-at-pos)))
            (when (>= orig-line end-line)
              (user-error "Position is after Heredoc %s" delim)))))
      (let* ((rel-line (1+ (- orig-line start-line)))
             (rel-char (- orig-char 3))
             (pos-str (format "%d:%d" rel-line rel-char)))
        (kill-new pos-str)
        (message "[%s] in kill-ring" pos-str)))))

;;; Mode map:

(defvar cram-mode-map
  (let ((map (make-keymap)))
    (define-key map (kbd "<f1>") #'cram-mode-compile)    
    (define-key map (kbd "<f2>") #'cram-mode-compile-and-promote)
    (define-key map (kbd "C-c C-p") #'cram-mode-relative-position)
    map)
  "Keymap for cram major mode.")

;;; Indentation function
(defun cram-indent-line ()
  (when (or (save-excursion
	      (beginning-of-line)
	      (looking-at "[ $>]"))
	    (save-excursion
	      (beginning-of-line)
	      (and
	       (looking-at " *$")
	       (forward-line -1)
	       (looking-at " "))))
    (beginning-of-line)
    (while (looking-at " ")
      (delete-char 1))
    (insert "  ")))

;;; Mode declaration: 
;;;###autoload
(define-derived-mode cram-mode fundamental-mode "cram"
  "Major mode for cram tests."
  ;; :syntax-table cram-mode-syntax-table
  (setq font-lock-keywords-only t)
  (setq font-lock-defaults cram--font-lock-defaults)
  (modify-syntax-entry ?\" "w" cram-mode-syntax-table)
  (modify-syntax-entry ?_ "w" cram-mode-syntax-table)
  (modify-syntax-entry ?. "w" cram-mode-syntax-table)
  (indent-tabs-mode 0)
  (setq indent-line-function 'cram-indent-line)
  (setq show-trailing-whitespace t)
  (auto-revert-mode))

(provide 'cram-mode)
;;; cram-mode.el ends here
