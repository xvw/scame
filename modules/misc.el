;; colorful mode
(use-package colorful-mode
  :ensure t
  :hook (prog-mode text-mode))

;; Identation guides
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode text-mode conf-mode)
  :init
  (setq highlight-indent-guides-method 'bitmap)
  (setq highlight-indent-guides-bitmap-function
	#'highlight-indent-guides--bitmap-dots)
  (setq highlight-indent-guides-responsive 'top)
  :config
  (setq highlight-indent-guides-delay 0)
  (setq highlight-indent-guides-auto-character-face-perc 45)
  (setq highlight-indent-guides-auto-top-character-face-perc 100))

;; rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode text-mode conf-mode))

;; Display active key binding
(use-package command-log-mode
  :ensure t)

;; Shortcut for moving at the begining or the end of a buffer
(use-package beginend 
  :ensure t
  :demand t
  :config  
  (beginend-global-mode))

;; Highlight TODO
(use-package hl-todo
  :ensure t
  :hook (prog-mode text-mode))

;; Smartparens
(use-package smartparens
  :ensure smartparens
  :hook (prog-mode text-mode markdown-mode)
  :config
  (require 'smartparens-config))

;; iedit
(use-package iedit
  :ensure t)

;; imenu-list
(use-package imenu-list
  :ensure t
  :config
  (global-set-key (kbd "C-=") #'imenu-list-smart-toggle)
  (setq imenu-list-focus-after-activation t)
  (setq imenu-list-auto-resize t))

;; YASnippet
(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/scame/snippets"))
  (yas-global-mode 1))
