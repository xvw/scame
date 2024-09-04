;; Auto create missing dir when opening a file
;; from: https://emacsredux.com/blog/2022/06/12/auto-create-missing-directories/

(defun er-auto-create-missing-dirs ()
  (let ((target-dir (file-name-directory buffer-file-name)))
    (unless (file-exists-p target-dir)
      (make-directory target-dir t))))

(add-to-list 'find-file-not-found-functions #'er-auto-create-missing-dirs)
