(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Install use-package
(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
(require 'use-package)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/use-package/"))

;; Configure MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Install packages
;; Elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(use-package company-quickhelp
  :ensure t
  :init
  (company-quickhelp-mode 1))
(use-package find-file-in-project :ensure t)
;; Development tools
(use-package flycheck :ensure t)
(use-package magit :ensure t)
;; Editor modes
(use-package cython-mode :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package lua-mode :ensure t)
(use-package markdown-mode :ensure t)
(use-package nginx-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package sphinx-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package yaml-mode :ensure t)
;; Themes
(use-package github-modern-theme :ensure t)
(use-package gruvbox-theme :ensure t)
(use-package material-theme :ensure t)
(use-package tangotango-theme :ensure t)

;; Don't use menubar/toolbar often
(menu-bar-mode -1)
(tool-bar-mode -1)

;; I prefer scrollbars on the right side
(set-scroll-bar-mode 'right)

;; I want delete to work!
(delete-selection-mode 1)

;; Enable line and column numbering
(global-linum-mode 1)
(line-number-mode 1)
(column-number-mode 1)

;; Use a theme on graphical displays
(when (display-graphic-p)
  (load-theme 'gruvbox t))

;; No new tabs; show existing ones
;; See also: https://www.emacswiki.org/emacs/NoTabs
(setq-default indent-tabs-mode nil)

;; Backups (do not litter)
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; Use Flycheck instead of Flymake globally
(global-flycheck-mode)
;; Disable certain flycheck checkers
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; Use flycheck instead of flymake
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
