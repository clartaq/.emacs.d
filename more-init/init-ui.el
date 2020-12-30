;;; package -- init-ui.el
;;;
;;; Commentary:
;;; Initializes some settings in the user interface.

;;; Code:

(require 'init-elpa)

;; Use utf-8 everywhere.
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Highlight the current line without visual problems for some packages.
(use-package hl-line
  :config
  (add-hook 'prog-mode-hook #'hl-line-mode)
  (add-hook 'text-mode-hook #'hl-line-mode)
  (set-face-attribute 'hl-line nil :background "gray26"))

;; Highlight all instances of the word under the pointer.
(use-package idle-highlight-mode
  :ensure t
  :config (add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t))))

;; Use a pretty theme.

;; Because we confused emacs with the location of the customization file,
;; we have to tell it explicitly that themes are safe.
(setq custom-safe-themes t)

;; (use-package atom-one-dark-theme
;;  :ensure t
;;  :config (load-theme 'atom-one-dark t))

(use-package doom-themes
  :ensure t
  :config
  (let ((chosen-theme 'doom-dracula))
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)
    (setq doom-challenger-deep-brighter-comments t
          doom-challenger-deep-brighter-modeline t)
    (load-theme chosen-theme)))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

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

;; Whoohoo! Tabs!
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)
  :custom
  (centaur-tabs-gray-out-icons 'buffer)
  (centaur-tabs-style "rounded")
  (centaur-tabs-height 36)
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-modified-marker "●")
  (centaur-tabs-buffer-groups-function #'centaur-tabs-projectile-buffer-groups)

  :bind (("s-{" . #'centaur-tabs-backward)
	   ("s-}" . #'centaur-tabs-forward)))

;; Lots of miscellaneous, simple settings.
(setq
 ;; Don't need to see advertising.
 inhibit-startup-message t
 ;; No need to tell me what a scratch buffer is.
 initial-scratch-message nil
 ;; I wanna see line numbers.
 global-linum-mode t
 ;; ... and column numbers.
 column-number-mode t
 ;; Copying between X11 applications. Haven't tried for years.
 select-enable-clipboard t
 save-interprogram-paste-before-kill t
 ;; Copying when a selection is made is nice.
 select-enable-primary t
 apropos-do-all t
 ;; Don't let undo fiddle with the mark.
 mark-even-if-inactive nil
 ;; Paste at point regardless of where you middle-click.
 mouse-yank-at-point t
 ;; Double spaces at the end of sentences went out in the 80s.
 sentence-end-double-space nil
 ;; The dialog boxes just look weird.
 use-dialog-box nil
 ;; Don't like being beeped at. Makes me feel even stupider.
 ring-bell-function 'ignore)

;; Delete selection when you start typing.
(delete-selection-mode t)

(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.5)

;; Nobody likes to use tabs anymore.
(setq-default indent-tabs-mode nil)

;; Make the cursor look like it does everywhere else.
(blink-cursor-mode 1)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")

;; Clean up files when saving.
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq require-final-newline t)

;; I'm too lazy to type extra characters. Accept 'y' in place of 'yes'.
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-ui)
;;; init-ui.el ends here
