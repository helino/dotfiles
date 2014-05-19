(add-to-list 'load-path "~/.emacs.d/lisp")

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

(require 'evil)
(evil-mode 1)

(require 'key-chord)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

(load-theme 'solarized-dark t)
(setq-default show-trailing-whitespace t)

(column-number-mode)

(defun sh (cmd) (shell-command-to-string cmd))

(defun leader (s)
  (kbd (concat "M-" s)))

(setq grep-command "grep  -H -R -n -I ")

(defun split-open-term()
  (interactive)
  (split-window-sensibly (selected-window))
  (other-window 1)
  (ansi-term (getenv "SHELL")))

(add-hook 'term-mode-hook
  (lambda ()
    (define-key term-raw-map (kbd "C-w") 'evil-window-map)
    (setq show-trailing-whitespace nil)))

(defun ido-find-in-manifest()
  (interactive)
  (find-file
   (expand-file-name
    (ido-completing-read "Filename: " (hg-manifest) nil t)
    (hg-root))))

(defun list-files ()
  (split-string (sh "find -not -path './build*' -not -path '*hg*' -type f")))

(defun no-cd (f)
  (let ((old-default-directory default-directory))
    (funcall f)
    (setq default-directory old-default-directory)))

(defun ido-find()
  (interactive)
  (no-cd (lambda ()
    (find-file
      (expand-file-name
        (ido-completing-read "Filename: " (list-files) nil t))))))

(defun ido-file-file-no-cd ()
  (interactive)
  (no-cd (lambda () (ido-find-file))))

(define-key evil-normal-state-map (leader "g") 'grep)
(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (leader "f") 'ido-find)
(define-key evil-normal-state-map (leader "b") 'ido-switch-buffer)

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
    (local-set-key (kbd "M-<left>") 'org-table-move-cell-left)
    (local-set-key (kbd "RET") 'org-return-indent)))

(defun install-my-packages ()
  (interactive)
  (package-refresh-contents)
  (let ((packages '(solarized-theme magit key-chord evil)))
    (dolist (package packages)
      (package-install package))))

(add-to-list 'auto-mode-alist '("kmail.*" . mail-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit default :foreground "#cb4b16" :height 1.0))) t)
 '(org-level-2 ((t (:inherit default :foreground "#859900" :height 1.0))) t)
 '(org-level-3 ((t (:inherit default :foreground "#268bd2" :height 1.0))) t)
 '(org-level-4 ((t (:inherit default :foreground "#b58900" :height 1.0))) t)
 '(org-level-5 ((t (:inherit default :foreground "#2aa198" :height 1.0))) t)
 '(org-level-6 ((t (:inherit default :foreground "#859900" :height 1.0))) t)
 '(org-level-7 ((t (:inherit default :foreground "#dc322f" :height 1.0))) t)
 '(org-level-8 ((t (:inherit deafult :foreground "#268bd2" :height 1.0))) t))

(add-to-list 'default-frame-alist '(font . "Terminus-12"))
