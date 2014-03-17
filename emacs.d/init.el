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

(defun split-open-term()
  (interactive)
  (split-window-sensibly (selected-window))
  (other-window 1)
  (ansi-term (getenv "SHELL")))

(defun kill-current-buffer()
  (interactive)
  (kill-buffer))

(define-prefix-command 'leader-map)
(global-set-key (kbd "C-q") 'leader-map)
(define-key leader-map (kbd "q") 'kill-current-buffer)

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

(defun org-table-move-cell (direction)
  (interactive)
  (let* ((current-col  (org-table-current-column))
         (current-line (org-table-current-line))
         (next-col     (+ direction current-col))
         (field        (org-table-get-field current-col ""))
         (align-table  t))
    (org-table-put current-line next-col field align-table)
    (if (= direction 1)
        (org-table-next-field)
        (org-table-previous-field))))

(defun org-table-move-cell-right ()
  (interactive)
  (org-table-move-cell 1))

(defun org-table-move-cell-left ()
  (interactive)
  (org-table-move-cell -1))

(add-hook 'org-mode-hook
  (lambda ()
    (local-set-key (kbd "M-<right>") 'org-table-move-cell-right)
    (local-set-key (kbd "M-<left>") 'org-table-move-cell-left)))

(defun install-my-packages ()
  (interactive)
  (package-refresh-contents)
  (let ((packages '(solarized-theme magit)))
    (dolist (package packages)
      (package-install package))))

(custom-set-faces
 '(org-level-1 ((t (:inherit default :foreground "#cb4b16" :height 1.0))))
 '(org-level-2 ((t (:inherit default :foreground "#859900" :height 1.0))))
 '(org-level-3 ((t (:inherit default :foreground "#268bd2" :height 1.0))))
 '(org-level-4 ((t (:inherit default :foreground "#b58900" :height 1.0))))
 '(org-level-5 ((t (:inherit default :foreground "#2aa198" :height 1.0))))
 '(org-level-6 ((t (:inherit default :foreground "#859900" :height 1.0))))
 '(org-level-7 ((t (:inherit default :foreground "#dc322f" :height 1.0))))
 '(org-level-8 ((t (:inherit deafult :foreground "#268bd2" :height 1.0)))))
