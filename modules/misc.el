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
