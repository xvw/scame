;; Global key bindings

;; Add C-c g for Esc key
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Search using consult

(global-set-key (kbd "C-x r") 'consult-ripgrep)
(global-set-key (kbd "C-s") 'consult-line)

;; Buffer movement
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
