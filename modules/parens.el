(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
  (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
  (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)
  (define-key smartparens-mode-map (kbd "C-)") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-(") 'sp-forward-barf-sexp)
  (define-key smartparens-mode-map (kbd "M-(") 'sp-wrap-round)
  (define-key smartparens-mode-map (kbd "M-[") 'sp-wrap-square)
  (define-key smartparens-mode-map (kbd "M-{") 'sp-wrap-curly)
  
  (show-smartparens-global-mode 1)
  (smartparens-global-mode 1))
