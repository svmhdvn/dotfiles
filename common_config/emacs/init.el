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
(add-to-list 'default-frame-alist '(font . "Iosevka Term-18"))
(setq ring-bell-function 'ignore)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

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

(show-paren-mode t)

(setq-default js-indent-level 4)
(setq-default c-default-style
	      '((java-mode . "java")
		(awk-mode . "awk")
		(other . "linux")))
(setq backward-delete-char-untabify-method 'hungry)

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

(use-package zig-mode
  :straight t
  :mode (("\\.zig\\'" . zig-mode)))

;; (use-package ivy
;;   :straight t
;;   :config
;;   (setq ivy-mode 1)
;;   (setq ivy-count-format "(%d/%d) ")
;;   (setq enable-recursive-minibuffers t)
;;   (setq mu4e-completing-read-function 'ivy-completing-read))

;; (use-package swiper
;;   :straight t
;;   :bind ("C-s" . swiper))

;; (use-package counsel
;;   :straight t
;;   :config
;;   (counsel-mode 1))

(use-package vertico
  :straight t
  :init
  (vertico-mode)
  :config
  (setq enable-recursive-minibuffers t))

;;(use-package vertico-directory
;;  :after vertico
;;  :bind (:map vertico-map
;;	      ("RET" . vertico-directory-enter))
;; ;; Tidy shadowed file names
;;  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; (use-package consult
;;   :straight t
;;   :bind (;; C-c bindings (mode-specific-map)
;;          ("C-c M-x" . consult-mode-command)
;;          ("C-c h" . consult-history)
;;          ("C-c k" . consult-kmacro)
;;          ("C-c m" . consult-man)
;;          ("C-c i" . consult-info)
;;          ([remap Info-search] . consult-info)
;;          ;; C-x bindings (ctl-x-map)
;;          ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
;;          ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
;;          ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
;;          ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
;;          ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
;;          ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
;;          ;; Custom M-# bindings for fast register access
;;          ("M-#" . consult-register-load)
;;          ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
;;          ("C-M-#" . consult-register)
;;          ;; M-g bindings (goto-map)
;;          ("M-g e" . consult-compile-error)
;;          ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
;;          ("M-g g" . consult-goto-line)             ;; orig. goto-line
;;          ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
;;          ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
;;          ("M-g m" . consult-mark)
;;          ("M-g k" . consult-global-mark)
;;          ("M-g i" . consult-imenu)
;;          ("M-g I" . consult-imenu-multi)
;;          ;; M-s bindings (search-map)
;;          ("M-s d" . consult-find)
;;          ("M-s D" . consult-locate)
;;          ("M-s g" . consult-grep)
;;          ("M-s G" . consult-git-grep)
;;          ("M-s r" . consult-ripgrep)
;;          ("M-s l" . consult-line)
;;          ("M-s L" . consult-line-multi)
;;          ("M-s k" . consult-keep-lines)
;;          ("M-s u" . consult-focus-lines)
;;          ;; Isearch integration
;;          ("M-s e" . consult-isearch-history)
;;          :map isearch-mode-map
;;          ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
;;          ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
;;          ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
;;          ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
;;          ;; Minibuffer history
;;          :map minibuffer-local-map
;;          ("M-s" . consult-history)                 ;; orig. next-matching-history-element
;;          ("M-r" . consult-history)))                ;; orig. previous-matching-history-element

(use-package corfu
  :straight t
  :init
  (global-corfu-mode)
  :config
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete)
  (setq corfu-auto t)
  (setq corfu-quit-no-match 'separator))

(use-package avy
  :straight t
  :bind ("C-:" . avy-goto-char)
  :config
  (setq avy-keys '(?a ?r ?s ?t ?d ?h ?n ?e ?i ?o)))

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
	'("~/Syncthing/backup/org/gtd/in.org"
	  "~/Syncthing/backup/org/gtd/projects.org"
	  "~/Syncthing/backup/org/gtd/calendar.org"
	  "~/Syncthing/backup/org/gtd/tickler.org"))
  (setq org-capture-templates
	'(("i" "Inbox" entry
	   (file "~/Syncthing/backup/org/gtd/in.org")
	   "* TODO %i%?")
	  ("t" "Tickler" entry
	   (file "~/Syncthing/backup/org/gtd/tickler.org")
	   "* TODO %i%?\n%T")
	  ("c" "Calendar" entry
	   (file "~/Syncthing/backup/org/gtd/calendar.org")
	   "* %i%?\n%T")))
  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|"
		    "DONE(d)" "CANCELLED(c)")))
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-targets
	'(("~/Syncthing/backup/org/gtd/projects.org" :maxlevel . 3)
	  ("~/Syncthing/backup/org/gtd/someday.org" :level . 1)
	  ("~/Syncthing/backup/org/gtd/calendar.org" :level . 1)
	  ("~/Syncthing/backup/org/gtd/tickler.org" :level . 1)))
  (setq org-confirm-babel-evaluate nil)
  :bind (("C-c o l" . org-store-link)
	 ("C-c o a" . org-agenda)
	 ("C-c o c" . org-capture)))

(use-package which-key
  :straight t
  :config
  (which-key-mode))

(use-package yasnippet
  :straight t)

(use-package yasnippet-snippets
  :straight t)

(use-package bqn-mode
  :straight (bqn-mode
	     :type git
	     :host github
	     :repo "museoa/bqn-mode"))

(use-package package-lint
  :straight t)

(use-package mu4e
  :init
  ; TODO msg doesn't contain body field, need to find out how to retrieve it
  (defun mu4e-action-view-as-patch (msg)
    "Interpret the message as a patch and show it in a diff-mode buffer."
    (let* ((diff-default-read-only t)
	   (subject (concat "Subject: " (mu4e-message-field msg :subject) "\n\n"))
	   (body (mu4e-message-field msg :body-txt))
	   (buf (generate-new-buffer "*mu4e-patch*"))
	   (map (make-sparse-keymap)))
      (define-key map "q" 'quit-window)
      (switch-to-buffer buf)
      (insert subject)
      (insert body)
      (set-buffer-modified-p nil)
      (diff-mode)
      (let ((new-ro-bind (cons 'buffer-read-only map)))
	(add-to-list 'minor-mode-overriding-map-alist new-ro-bind))
      (goto-char (point-min))))
  :config
  (setq mail-user-agent 'mu4e-user-agent)
  (setq mu4e-attachment-dir "~/Downloads")

  (setq mu4e-headers-fields
	'((:human-date . 12)
	  (:flags . 6)
	  (:mailing-list . 25)
	  (:from . 30)
	  (:subject)))

  ;; show images
  (setq mu4e-show-images t)

  ;; always show email addresses when showing people's names
  (setq mu4e-view-show-addresses t)

  ;; attempt to show images when viewing messages
  (setq mu4e-view-show-images t)

  ;; rename files to avoid name collision when moving to other folders
  (setq mu4e-change-filenames-when-moving t)

  ;; convert html emails properly
  ;; Possible options:
  ;;   - html2text -utf8 -width 72
  ;;   - textutil -stdin -format html -convert txt -stdout
  ;;   - html2markdown | grep -v '&nbsp_place_holder;' (Requires html2text pypi)
  ;;   - w3m -dump -cols 80 -T text/html
  ;;   - view in browser (provided below)
  ;; (setq mu4e-html2text-command "w3m -dump -cols 80 -T text/html")

  ;; add option to view html message in a browser
  ;; `aV` in view to activate
  (add-to-list 'mu4e-view-actions
	       '("git apply patch" . mu4e-action-git-apply-mbox) t)
  (add-to-list 'mu4e-view-actions
	       '("pview as patch" . mu4e-action-view-as-patch) t)

  (setq mu4e-confirm-quit nil)
  ;(add-hook 'mu4e-view-mode-hook 'visual-line-mode)

  ;; mu4e context-specific settings
  ;; =====
  (setq mu4e-contexts
	`(,(make-mu4e-context
	    :name "Personal"
	    :enter-func (lambda ()
			  (mu4e-message "Switch to the Personal context"))
	    :match-func (lambda (msg)
			  (when msg
			    (string= "~/Mail" (mu4e-message-field msg :maildir))))
	    :vars '((mu4e-maildir . "~/Mail")
		    (mu4e-sent-folder . "/Sent")
		    (mu4e-drafts-folder . "/Drafts")
		    (mu4e-trash-folder . "/Trash")
		    (mu4e-refile-folder . "/Archive")
		    (user-mail-address . "me@svmhdvn.name")
		    (smtpmail-smtp-server . "smtp.migadu.com")
		    (smtpmail-smtp-service . 465)
		    (smtpmail-stream-type . ssl)))))
  
  (setq mu4e-context-policy 'pick-first)
  (setq mu4e-compose-context-policy nil))

;(load-file (let ((coding-system-for-read 'utf-8))
;            (shell-command-to-string "agda-mode locate")))

(server-start)
