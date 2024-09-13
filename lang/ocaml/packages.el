;; Import tuareg and activate it, also on .ocamlinit
(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode))
  :config

  ;; Set constructor in Bold for readability purpose
  (set-face-attribute
   'tuareg-font-lock-constructor-face
   nil
   :weight 'bold)
  
  (add-hook
   'tuareg-mode-hook
   (lambda ()
     (when (functionp 'prettify-symbols-mode)
       (prettify-symbols-mode))))
  (setq tuareg-prettify-symbols-full t))


;; Import merlin as an hook for tuareg
(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    (require 'merlin-imenu)
    (require 'merlin-iedit nil 'noerror)
    (require 'ocp-indent)
    (require 'utop)
    (require 'dune)
    (require 'ocamlformat)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'tuareg-mode-hook 'ocp-setup-indent)
    (add-hook 'tuareg-mode-hook 'utop-minor-mode)
    (add-hook
     'tuareg-mode-hook
     (lambda ()
       (setq ocamlformat-show-errors "echo")
       (add-hook 'before-save-hook #'ocamlformat-before-save)))))

;; Import eldoc that display the list of argument of a function call,
;; currently writing
(use-package merlin-eldoc
  :ensure t
  :hook (merlin-mode . merlin-eldoc-setup))


(use-package opam-switch-mode
  :ensure t
  :hook
  ((tuareg-mode merlin-mode) . opam-switch-mode))


