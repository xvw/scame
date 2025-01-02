;; Vertico allows completion in the mini-buffer
(use-package vertico
  :diminish
  :ensure t
  :custom
  (vertico-cycle t)
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
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators
   '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

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
  (global-corfu-mode)
  :config
  (corfu-popupinfo-mode 1))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Some usage of icon because...


(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-marginalia-setup)
  (nerd-icons-completion-mode 1))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
