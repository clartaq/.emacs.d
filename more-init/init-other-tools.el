;;; package --- Summary
;;; Initialize other tools in the setup.
;;;
;;; package -- init-other-tools
;;;
;;; Commentary:
;;; Initialize other tools that don't fit neatly into other categories.

;;; Code:

;; See how things work with LSP servers.

;; Set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
           ;(clojure-mode . lsp)
           ;(rust-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;; Gotta have dired with all of the trimmings.

(use-package dired
  :config
  ;; Always delete and copy subdirectories.
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  ;; Show directories first.
  ;; This really messes things up.
  ;;(setq dired-listing-switches "alh --group-directories-first")
  )

;; One key to get it all started.
(global-set-key (kbd "S-<f1>")
                (lambda ()
                  (interactive)
                  (dired "~/")))

(defun dired-up-directory-in-the-same-buffer ()
  "Go up in the same buffer."
  (interactive)
  (find-alternate-file ".."))


(defun my-dired-mode-hook ()
  "Disable a dumb warning on mac. Handle Return key more intelligently."
  (put 'dired-find-alternate-file 'disabled nil)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "<down-mouse-1>") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "^") 'dired-up-directory-in-the-same-buffer))

(add-hook 'dired-mode-hook #'my-dired-mode-hook)

;; Show git information in dired.
(use-package dired-git-info
  :bind (:map dired-mode-map
              (")" . dired-git-info-mode)))

;; Add some color.
(use-package diredfl
  :init (diredfl-global-mode 1))

;; Have dired show icons.
;(use-package all-the-icons-dired

;;
;; Let Magit help with git.
;;

(use-package magit
  :bind (("C-c g" . #'magit-status))
  :config (add-to-list 'magit-no-confirm 'stage-all-changes))

(use-package libgit
  :after (magit libgit))

(use-package forge
  :after magit)

;;
;; Project management with Projectile.
;;

(use-package projectile
  :bind (("C-c k" . #'projectile-kill-buffers)
         ("C-c M" . #'projectile-compile-project))
  :config (projectile-mode +1))

(provide 'init-other-tools)
;;; init-other-tools.el ends here
