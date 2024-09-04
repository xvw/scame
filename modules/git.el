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
