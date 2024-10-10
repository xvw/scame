;; Some experimentation


;; Transient pannel for moving using merlin-jump, merlin-phrase-prev
;; and merlin-phrase-next

(defun merlin--t-jump-fun ()
  (interactive)
  (merlin--goto-file-and-point (merlin-call-jump "fun")))

(defun merlin--t-jump-let ()
  (interactive)
  (merlin--goto-file-and-point (merlin-call-jump "let")))

(defun merlin--t-jump-match ()
  (interactive)
  (merlin--goto-file-and-point (merlin-call-jump "match")))

(defun merlin--t-jump-mod ()
  (interactive)
  (merlin--goto-file-and-point (merlin-call-jump "module")))

(defun merlin--t-jump-mod-typ ()
  (interactive)
  (merlin--goto-file-and-point (merlin-call-jump "module-type")))


;; A little trick to make browsing the source interactive using a
;; transient pan
(transient-define-prefix merlin-move ()
  "Transient mode for moving inside an OCaml buffer."
  [[:description "Expression"
		 ("f" "Fun"             merlin--t-jump-fun     :transient t)
		 ("l" "Let"             merlin--t-jump-let     :transient t)
		 ("ma" "Match"          merlin--t-jump-match   :transient t)]
   [:description "Modules"
		 ("mo" "Module"         merlin--t-jump-mod     :transient t)
		 ("mt" "Module type"    merlin--t-jump-mod-typ :transient t)]
   [:description "Phrases"
		 ("p" "Previous phrase" merlin-phrase-prev     :transient t)
		 ("n" "Next phrase"     merlin-phrase-next     :transient t)]

   ;; Since commands are transient, allow to closes quicly, without
   ;; making `C-g' mandatory
   [("q" "done" transient-quit-one)]])

(transient-define-prefix xvw/test ()
  "a comprehensive description"
  [("a" "select" transient-quit-one)])
