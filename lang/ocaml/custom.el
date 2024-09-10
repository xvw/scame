;; Some custom commands related to OCaml mode

(progn
  (require 'merlin)
  (when (boundp 'merlin-mode-map)
    (define-key merlin-mode-map (kbd "M-W") #'merlin-copy-enclosing)))

