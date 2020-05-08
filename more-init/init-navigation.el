;;; package --- init-navigation.el
;;;
;;; Commentary:
;;; Initialize some stuff improve navigation. This includes completions
;;; and custom key bindings.

;;; Code:

(require 'init-elpa)

;; Setup ido completions everywhere they can be used without messing something
;; up.
(use-package ido-completing-read+
  :ensure t
  :config
    (ido-mode t)
    (ido-everywhere 1)
    (ido-ubiquitous-mode 1)
    (setq ido-enable-flex-matching t)
    (setq ido-use-filename-at-point nil)
    (setq ido-auto-merge-work-directories-length -1)
    (setq ido-use-virtual-buffers t))

;; Keep track of recently opened files.
(use-package recentf
  :ensure t
  :config
    (setq recentf-save-file (concat user-emacs-directory ".recentf"))
    (recentf-mode 1)
    (setq recentf-max-menu-items 40)
    ;; Save the file list every 5 minutes.
    (run-at-time nil (* 5 60) 'recentf-save-list))

(use-package smex
  :ensure t
  :init (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  :config
    (smex-initialize)
    (global-set-key (kbd "M-x") 'smex)
    ;; Added after installing ido-completing-read+
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)
    ;; This is your old M-x.
    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package projectile
  :ensure t
  :config (projectile-global-mode))

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Enable move point from window to window using Shift and the arrow keys
(windmove-default-keybindings)

(provide 'init-navigation)
;;; init-navigation.el ends here
