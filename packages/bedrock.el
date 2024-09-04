;; A list of fundamental packages (the bedrock of the configuration)

;; Command log displays operations performed by keyboard shortcuts
(use-package command-log-mode)

;; A set of icons used in particular by doomline-mode
(use-package nerd-icons)

;; A more expressive mode-line
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode))

;; Vertico allows completion in the mini-buffer
(use-package vertico
  :diminish
  :ensure t
  :init
  (vertico-mode))

;; Completion engine for vertico
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Completion result for vertico
(use-package consult
  :ensure t
  :bind (("C-c M-x" . consult-mode-command))
  :hook (completion-list-mode . consult-preview-at-point-mode))

;; Make anotation in the mini-buffer (also for vertico)
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Keyboard management for the minibuffer
(use-package embark
  :ensure t)

;; Hook between Embark and consult
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; General Completion Engine
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-preselect 'directory)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Git support for emacs
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function
   #'magit-display-buffer-same-window-except-diff-v1))

(use-package browse-at-remote
  :ensure t)

(use-package git-modes
  :ensure t)

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

;; Emoji in Emacs
(use-package emojify
  :hook (after-init . global-emojify-mode))

;; Dired improvement
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-nerd-fonts
  :after all-the-icons
  :demand t
  :config
  (all-the-icons-nerd-fonts-prefer))

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode))

(use-package diredfl
  :ensure t
  :hook (dired-mode))

;; Undo
(use-package vundo
  :ensure t
  :config
  (setq vundo-compact-display t)
  (setq vundo-glyph-alist vundo-unicode-symbols)
  :bind
  (("C-x u" . vundo)))


