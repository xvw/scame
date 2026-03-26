;; Some useful commands

(require 'transient)

(defun dune--call (&rest args)
  "Run `dune' something passing TARGET."
  (compile (format "dune %s"(mapconcat #'identity args " "))))

(defun dune--build ()
  "run `dune build'"
  (interactive)
  (dune--call "build"))

(defun dune--check ()
  "Run `dune build @check'"
  (interactive)
  (dune--call "build" "@check"))

(defun dune--index ()
  "run `dune build @ocaml-index'"
  (interactive)
  (dune--call "build" "@ocaml-index"))

(defun dune--test ()
  "run `dune test'"
  (interactive)
  (dune--call "test"))

(defun dune--test-auto ()
  "run `dune test --auto'"
  (interactive)
  (dune--call "test" "--auto"))

(defun dune--promote ()
  "run `dune promote'"
  (interactive)
  (dune--call "promote"))

(defun dune--doc ()
  "run `dune build @doc-new'"
  (interactive)
  (dune--call "build" "@doc-new"))

(defun dune--doc--legacy ()
  "run `dune build @doc'"
  (interactive)
  (dune--call "build" "@doc"))

(defun dune--fmt ()
  "run `dune fmt'"
  (interactive)
  (dune--call "fmt"))

(transient-define-prefix ocaml-build ()
  "Transient menu for dealing with ocaml build"
  [[:description "compile"
                 ("b" "build" dune--build)
                 ("c" "check" dune--check)
                 ("i" "index" dune--index)]
   [:description "tests"
                 ("t" "test" dune--test)
                 ("p" "promote" dune--promote)
                 ("ap" "test & promote" dune--test-auto)]
   [:description "doc"
                 ("d" "doc" dune--doc)
                 ("od" "doc-old" dune--doc--legacy)]
   ;; Since commands are transient, allow to closes quicly, without
   ;; making `C-g' mandatory
   [:description "misc"
                 ("f" "fmt" dune--fmt)
                 ("q" "exit" transient-quit-one)]])

