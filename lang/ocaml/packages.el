;; Import tuareg and activate it, also on .ocamlinit
(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode))
  :config
  (add-hook
   'tuareg-mode-hook
   (lambda ()
     (when (functionp 'prettify-symbols-mode)
       (prettify-symbols-mode))))
  (setq tuareg-prettify-symbols-full t))

;; Import the dune mode for editing dune files
(use-package dune
  :ensure t)

;; Import merlin as an hook for tuareg
(use-package merlin
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  :init
  (merlin-mode))

;; Use company as a backend
(use-package merlin-company
  :ensure t
  :config
  (add-to-list 'company-backends 'merlin-company-backend))

;; Import eldoc that display the list of argument of a function call,
;; currently writing
(use-package merlin-eldoc
  :ensure t
  :hook (merlin-mode . merlin-eldoc-setup))

;; Import utop to use utop as a shell for an emacs session
(use-package utop
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'utop-minor-mode))

;; Import ocp-indent to define where should the cursor be positionned
;; during an edition
(use-package ocp-indent
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'ocp-setup-indent))

;; Import ocamlformat and use-it before-save
(use-package ocamlformat
  :ensure t
  :config
  (add-hook
   'tuareg-mode-hook
   (lambda ()
     (setq ocamlformat-show-errors "echo")
     (add-hook 'before-save-hook #'ocamlformat-before-save))))

(use-package opam-switch-mode
  :ensure t
  :hook
  ((tuareg-mode merlin-mode) . opam-switch-mode))


