;;; package -- init-ui.el
;;;
;;; Commentary:
;;; Initializes some settings in the user interface.

;;; Code:

(require 'init-elpa)

;; Highlight all instances of the word under the pointer.
(use-package idle-highlight-mode
  :ensure t
  :config (add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t))))

;; Use a pretty theme.
(use-package atom-one-dark-theme
  :ensure t
  :config (load-theme 'atom-one-dark t))

;; Restore buffers that were being edited last time. From the emacs wiki.
(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  "Save the desktop.
Don't call 'desktop-save-in-desktop-dir', as it prints a message."
  (interactive)
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

;; Lots of miscellaneous, simple settings.
(setq
 inhibit-startup-message t
 global-linum-mode t
 column-number-mode t
 x-select-enable-clipboard t
 x-select-enable-primary t
 save-interprogram-paste-before-kill t
 apropos-do-all t
 mouse-yank-at-point t
 ring-bell-function 'ignore)

(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.5)
(blink-cursor-mode 1)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")

(provide 'init-ui)
;;; init-ui ends here
