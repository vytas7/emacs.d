;; Disable startup screen and GUI dialogs
(setq inhibit-startup-screen t)
(setq use-dialog-box nil)
(setq use-file-dialog nil)

;; Store customizations in custom.el
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Install use-package
(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
(require 'use-package)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/use-package/"))

;; Configure MELPA
(require 'package)
(package-initialize)
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
(use-package helm :ensure t)
(use-package find-file-in-project
  :ensure t
  :init
  (helm-mode 1))
;; AI assistants
(when (string> emacs-version "28.1")
  (use-package ellama
    :ensure t
    :init
    ;; Set up key bindings -- does not work; conflict with Elpy?
    ;; (setopt ellama-keymap-prefix "C-c e")
    (require 'llm-ollama)
    (setopt ellama-provider
            (make-llm-ollama
             ;; AI assistant model to use; value should be the same as in `ollama pull`.
             ;; :chat-model "llama3.1"
             ;; :chat-model "openthinker:7b"
             ;; :chat-model "phi4"
             :chat-model "qwen3:8b"
             :embedding-model "nomic-embed-text")))
  )
(use-package agent-shell
  :ensure t
  ;; :ensure-system-package
  ;; Add agent installation configs here
  )

;; Development tools
(use-package flycheck :ensure t)
(use-package magit :ensure t)
;; Editor modes
(use-package cython-mode :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
(use-package lua-mode :ensure t)
(use-package markdown-mode :ensure t)
(use-package nginx-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package sphinx-mode :ensure t)
(use-package ssh-config-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package typescript-mode :ensure t)
(use-package yaml-mode :ensure t)
;; Themes
(use-package github-modern-theme :ensure t :disabled)
(use-package material-theme :ensure t :disabled)
(use-package tangotango-theme :ensure t :disabled)
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

;; Don't use menubar/toolbar often
(menu-bar-mode -1)
(tool-bar-mode -1)

;; I prefer scrollbars on the right side
(set-scroll-bar-mode 'right)

;; I want delete to work!
(delete-selection-mode 1)

;; Enable line and column numbering
(global-display-line-numbers-mode 1)
(line-number-mode 1)
(column-number-mode 1)

;; Set the number to the number of columns to use and enable it by default
(setq-default fill-column 79)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'python-mode-hook 'turn-on-auto-fill)
(add-hook 'python-mode-hook '(lambda()
    (setq adaptive-fill-mode ())))

;; Use a theme only on graphical displays
;; (when (display-graphic-p)
;; (load-theme 'gruvbox t))

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
