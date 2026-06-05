;; -*- lexical-binding: t; -*-

(use-package whitespace
  :config
  (setq whitespace-display-mappings
        '((space-mark 32 [183])
          (tab-mark 9 [8614 9])))
  (setq whitespace-style '(face spaces tabs trailing space-mark tab-mark))
  (setq whitespace-action '(cleanup auto-cleanup))
  :hook
  (conf-mode prog-mode))

(use-package transient
  :ensure t)

;; (use-package eldoc-box
;;   :init
;;   (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t))


;; (use-package flyover
;;   :ensure t
;;   :hook ((flycheck-mode . flyover-mode)
;;          (flymake-mode . flyover-mode))
;;   :custom
;;   ;; Checker settings
;;   (flyover-checkers '(flycheck flymake))
;;   (flyover-levels '(error warning info))

;;   ;; Appearance
;;   (flyover-use-theme-colors t)
;;   (flyover-background-lightness 45)

;;   ;; Text tinting
;;   (flyover-text-tint 'lighter)
;;   (flyover-text-tint-percent 50)

;;   ;; Icon tinting (foreground and background)
;;   (flyover-icon-tint 'lighter)
;;   (flyover-icon-tint-percent 50)
;;   (flyover-icon-background-tint 'darker)
;;   (flyover-icon-background-tint-percent 50)

;;   ;; Icons
;;   (flyover-info-icon " ")
;;   (flyover-warning-icon " ")
;;   (flyover-error-icon " ")

;;   ;; Border styles: none, pill, arrow, slant, slant-inv, flames, pixels
;;   (flyover-border-style 'pill)
;;   (flyover-border-match-icon t)

;;   ;; Display settings
;;   (flyover-hide-checker-name t)
;;   (flyover-show-virtual-line t)
;;   (flyover-virtual-line-type 'curved-dotted-arrow)
;;   (flyover-line-position-offset 1)

;;   ;; Message wrapping
;;   (flyover-wrap-messages t)
;;   (flyover-max-line-length 80)

;;   ;; Performance
;;   (flyover-debounce-interval 0.2)
;;   (flyover-cursor-debounce-interval 0.3)

;;   ;; Display mode (controls cursor-based visibility)
;;   (flyover-display-mode 'always)

;;   ;; Completion integration
;;   (flyover-hide-during-completion t))
