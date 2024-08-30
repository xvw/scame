;; Global key bindings

;; Add C-c g for Esc key
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Buffer movement
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
