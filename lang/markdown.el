;; Support for Markdown edition

(defun markdown-compile-multimarkdown (beg end output-buffer)
  "Compiles markdown with the multimarkdown program, if available."
  (when (executable-find "multimarkdown")
    (call-process-region beg end "multimarkdown" nil output-buffer)))

(defun markdown-compile-pandoc (beg end output-buffer)
  "Compiles markdown with the pandoc program, if available."
  (when (executable-find "pandoc")
    (call-process-region beg end "pandoc" nil output-buffer nil
                         "-f" "markdown"
                         "-t" "html"
                         "--mathjax"
                         "--highlight-style=pygments")))

(defvar markdown-compile-functions
  '(markdown-compile-pandoc
    markdown-compile-multimarkdown)
  "Try to build markdown")

;; Global markdown mode
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "multimarkdown"
	markdown-italic-underscore t
	markdown-asymmetric-header t
	markdown-gfm-additional-languages '("sh")
	markdown-make-gfm-checkboxes-buttons t
	markdown-fontify-whole-heading-line t
	markdown-fontify-code-blocks-natively t
	markdown-command #'markdown-compile
	markdown-open-command (cond ((featurep :system 'macos) "open")
				    ((featurep :system 'linux) "xdg-open")))

  :bind
  (:map markdown-mode-map
	("C-c C-e" . markdown-do)))

;; Generated Markdown table of content
(use-package markdown-toc
  :ensure t)

;; Live preview
(use-package markdown-preview-mode
  :ensure t)
