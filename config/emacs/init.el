;;; -*- lexical-binding: t -*-

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(load-theme 'deeper-blue)
(set-cursor-color "white")
(add-to-list 'default-frame-alist '(font . "Iosevka Fixed-14"))
(setq ring-bell-function 'ignore)

(add-to-list 'load-path "/usr/share/emacs/site-lisp")

(setq gc-cons-threshold 20000000)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq vc-follow-symlinks t)

(setq auto-window-vscroll nil)

(put 'dired-find-alternate-file 'disabled nil)

(setq-default dired-listing-switches "-alh")

(fset 'yes-or-no-p 'y-or-n-p)

(global-auto-revert-mode t)

(add-hook 'org-mode-hook 'auto-fill-mode)

(put 'narrow-to-region 'disabled nil)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(add-hook 'eww-mode-hook 'scroll-lock-mode)

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(setq user-full-name "Siva Mahadevan")
(setq send-mail-function 'smtpmail-send-it)
(setq message-citation-line-format "%f said:")
(setq message-citation-line-function 'message-insert-formatted-citation-line)
(setq message-cite-reply-position 'traditional)
(setq message-kill-buffer-on-exit t)
(setq message-sendmail-envelope-from 'header)
(setq user-mail-address "me@svmhdvn.name")
(setq smtpmail-smtp-server "smtp.fastmail.com")
(setq smtpmail-smtp-service 465)
(setq smtpmail-stream-type 'ssl)

(show-paren-mode t)

(setq-default js-indent-level 4)
(setq-default c-default-style
	      '((java-mode . "java")
		(awk-mode . "awk")
		(other . "linux")))
(setq backward-delete-char-untabify-method 'hungry)

(use-package lsp-ui
  :straight t)

(use-package lsp-ivy
  :straight t
  :commands lsp-ivy-workspace-symbol)

(use-package flycheck
  :straight t)

(use-package elfeed
  :straight t
  :config
  (setq elfeed-feeds
	'("https://drewdevault.com/feed.xml"
	  "https://danluu.com/atom.xml"
	  "https://jvns.ca/atom.xml"
	  "https://thume.ca/atom.xml"
	  "https://blog.trello.com/feed"
	  "https://ambrevar.xyz/atom.xml"
	  "https://andrewkelley.me/rss.xml")))

(use-package elpher
  :straight t)

(use-package haskell-mode
  :straight t)

;; (use-package lsp-haskell
;;   :straight t
;;   :config
;;   (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper"))

(use-package flycheck-haskell
  :straight t
  :hook ((haskell-mode . flycheck-haskell-setup)))

(use-package zig-mode
  :straight t
  :mode (("\\.zig\\'" . zig-mode)))

(use-package ivy
  :straight t
  :config
  (setq ivy-mode 1)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  (setq projectilevy-completion-system 'ivy)
  (setq mu4e-completing-read-function 'ivy-completing-read))

(use-package swiper
  :straight t
  :bind ("C-s" . swiper))

(use-package counsel
  :straight t
  :config
  (counsel-mode 1))

(use-package ledger-mode
  :straight t
  :mode "ledger\\.dat\\'")

(use-package magit
  :straight t
  :bind ("C-x g" . magit-status))

(use-package org
  :straight t
  :config
  (setq org-agenda-files
	'("~/syncthing/backup/org/inbox.org"
	  "~/syncthing/backup/org/projects.org"
	  "~/syncthing/backup/org/calendar.org"
	  "~/syncthing/backup/org/reminders.org"))
  (setq org-capture-templates
	'(("i" "Inbox" entry
	   (file "~/syncthing/backup/org/inbox.org")
	   "* TODO %i%?")
	  ("r" "Reminders" entry
	   (file "~/syncthing/backup/org/reminders.org")
	   "* TODO %i%?\n%T")
	  ("c" "Calendar" entry
	   (file "~/syncthing/backup/org/calendar.org")
	   "* %i%?\n%T")))
  (setq org-todo-keywords
	'((sequence "TODO(t)" "INPROGRESS(p)" "WAITING(w)" "|"
		    "DONE(d)" "CANCELLED(c)")))
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-targets
	'(("~/syncthing/backup/org/projects.org" :maxlevel . 3)
	  ("~/syncthing/backup/org/someday.org" :level . 1)
	  ("~/syncthing/backup/org/calendar.org" :level . 1)
	  ("~/syncthing/backup/org/reminders.org" :level . 1)))
  (setq org-confirm-babel-evaluate nil)
  :bind (("C-c o l" . org-store-link)
	 ("C-c o a" . org-agenda)
	 ("C-c o c" . org-capture)))

(use-package projectile
  :straight t
  :config
  (projectile-mode +1)
  :bind ("C-c p" . projectile-command-map))

(use-package which-key
  :straight t
  :config
  (which-key-mode))

(use-package yasnippet
  :straight t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :straight t)

(use-package company
  :straight t
  :config
  (setq company-minimum-prefix-length 3)
  (global-company-mode t))

;(load-file (let ((coding-system-for-read 'utf-8))
;            (shell-command-to-string "agda-mode locate")))



(server-start)
