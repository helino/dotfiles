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

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(load-theme 'solarized-dark t)
(setq-default show-trailing-whitespace t)

(defun join-line-below()
  (interactive)
  (move-end-of-line nil)
  (next-line)
  (move-beginning-of-line nil)
  (join-line))


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

(defun kill-and-delete-window()
  (interactive)
  (kill-buffer)
  (delete-window))

(defun split-open-term()
  (interactive)
  (split-window-sensibly (selected-window))
  (other-window 1)
  (ansi-term (getenv "SHELL")))

(define-prefix-command 'leader-map)
(global-set-key (kbd "C-q") 'leader-map)
(define-key leader-map (kbd "q") 'kill-and-delete-window)

(define-key leader-map (kbd "k") 'windmove-up)
(define-key leader-map (kbd "h") 'windmove-left)
(define-key leader-map (kbd "l") 'windmove-right)
(define-key leader-map (kbd "j") 'windmove-down)
(define-key leader-map (kbd "t") 'split-open-term)
(define-key leader-map (kbd "r") 'execute-extended-command)
(define-key leader-map (kbd "TAB") 'ido-find-in-manifest)

; shadow mapping from C-x
(define-key leader-map (kbd "C-f") 'find-file)
(define-key leader-map (kbd "C-s") 'save-buffer)
(define-key leader-map (kbd "C-c") 'save-buffers-kill-terminal)
(define-key leader-map (kbd "0") 'delete-window)
(define-key leader-map (kbd "1") 'delete-other-windows)
(define-key leader-map (kbd "2") 'split-window-below)
(define-key leader-map (kbd "3") 'split-window-right)
(define-key leader-map (kbd "b") 'switch-to-buffer)
(define-key leader-map (kbd "o") 'other-window)
(define-key leader-map (kbd "u") 'undo)

(add-hook 'term-mode-hook
  (lambda ()
    (define-key term-raw-map (kbd "C-q") 'leader-map)
    (setq show-trailing-whitespace nil)))
