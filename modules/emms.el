(use-package emms
  :ensure t
  :config
  (require 'emms-setup)
  (require 'emms-mpris)
  (emms-all)
  (emms-default-players)
  (emms-mpris-enable)
  (setq emms-source-file-default-directory
        (expand-file-name "~/Music/"))
  :bind
  (("<XF86AudioPrev>" . emms-previous)
   ("<XF86AudioNext>" . emms-random)
   ("<XF86AudioPlay>" . emms-pause)))
