;; Global key bindings

;; Add C-c g for Esc key
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Search using consult

(global-set-key (kbd "C-x r") 'consult-ripgrep)
(global-set-key (kbd "C-x s") 'consult-line)

;; Buffer movement
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

;; line manipulation
(defun duplicate-line (n)
  "Duplicate the current line N times."
  (interactive "p")
  (let ((col (current-column)))
    (save-excursion    
      (let ((line-text
             (buffer-substring
              (line-beginning-position)
              (line-end-position))))
        (end-of-line)
        (dotimes (_ n)
          (newline)
          (insert line-text))))
    (forward-line 1)
    (move-to-column col)))

(global-set-key (kbd "C-x C-<down>") 'duplicate-line)
