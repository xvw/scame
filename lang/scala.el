(use-package scala-mode
  :ensure t
  :interpreter ("scala" . scala-mode))

(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :config
  
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)

  
  (setq sbt:program-options '("-Dsbt.supershell=false")))

(add-hook #'scala-mode-hook #'eglot-ensure)
