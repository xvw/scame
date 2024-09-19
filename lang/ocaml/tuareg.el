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
