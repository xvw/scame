;; Support for OCaml edition OCaml support is based essentially on
;; tuareg-mode, for syntax support and a few additional functions and
;; merlin for IDE services.

(load "lang/ocaml/tuareg")   ;; Load Tuareg (OCaml root)
(load "lang/ocaml-merlin/packages") ;; load and configure need packages
(load "lang/ocaml-merlin/lab")
