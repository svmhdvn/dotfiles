;; Inspired by and adapted from github.com/munen/emacs.d

(package-initialize)

(defun load-config ()
  "Load the actual configuration by evaluating the literate org file config"
  (interactive)
  (org-babel-load-file "~/.emacs.d/configuration.org"))

(load-config)
