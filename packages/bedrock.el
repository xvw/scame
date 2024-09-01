;; A list of fundamental packages (the bedrock of the configuration)

;; Command log displays operations performed by keyboard shortcuts
(use-package command-log-mode)

;; A set of icons used in particular by doomline-mode
(use-package nerd-icons)

;; A more expressive mode-line
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-position-column-line-format '("%l:%c")))

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
(use-package company
  :ensure t
  :config
  (global-company-mode t))

;; Git support for emacs
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function
   #'magit-display-buffer-same-window-except-diff-v1))

(load "packages/ligature.el") ;; Handle ligatures for Fira Code

;; colorful mode
(use-package colorful-mode
  :ensure t
  :hook (prog-mode text-mode))

;; rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode text-mode))
