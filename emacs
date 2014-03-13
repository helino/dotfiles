(blink-cursor-mode 0)
(setq blink-cursor-mode nil)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq create-lockfiles nil)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)
(setq c-default-style "java"
      c-basic-offset 2)
(setq tab-width 4)

(show-paren-mode t)
(set-default-font "Terminus 12")
(electric-pair-mode 1)

(global-set-key (kbd "C-x k") 'windmove-up)
(global-set-key (kbd "C-x h") 'windmove-left)
(global-set-key (kbd "C-x l") 'windmove-right)
(global-set-key (kbd "C-x j") 'windmove-down)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(load-theme 'solarized-dark t)
(setq show-trailing-whitespace t)

(defun join-below()
  (interactive)
  (next-line)
  (move-beginning-of-line 1)
  (join-line))

(global-set-key (kbd "C-j") 'join-below)
(global-set-key (kbd "C-r") 'execute-extended-command)

(define-key key-translation-map (kbd "C-q") (kbd "C-x"))

(column-number-mode)

(defun sh (cmd) (shell-command-to-string cmd))

(defun hg-manifest() (split-string (sh "hg manifest")))

(defun hg-root() (replace-regexp-in-string "\n" "" (sh "hg root")))

(defun ido-find-in-manifest()
  (interactive)
  (find-file
   (expand-file-name
    (ido-completing-read "Filename: " (hg-manifest) nil t)
    (hg-root))))

(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
(global-set-key (kbd "H-i") 'ido-find-in-manifest)
