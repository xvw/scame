;; Support for Markdown edition

;; Global markdown mode
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "multimarkdown")
  :bind
  (:map markdown-mode-map
	("C-c C-e" . markdown-do)))

;; Generated Markdown table of content
(use-package markdown-toc
  :ensure t)
