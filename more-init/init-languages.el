;;; package --- init-rust.el
;;;
;;; Commentary:
;;; Initialize auxilliary tools for convenient development with various
;;; languages.
;;;
;;; This file assume that company and flycheck have been loaded before
;;; this file.

;;; Code:

(message "Enter init-languages.el")

;; (require 'init-elpa)

;;;
;;; Configuration for Markdown.
;;;

(use-package markdown-mode
  :ensure t
  :commands (gfm-mode)
  ;; Using MultiMarkdown as the processor.
  ;; It was installed externally with brew.
  :init (setq markdown-command "multimarkdown"))

;;;
;;; Initialization for the Janet language.
;;;

(use-package janet-mode
  :ensure t)

;; (use-package inf-janet
;;   :ensure t
;;   :config
;;   (setq inf-janet-program "usr/local/bin/janet")
;;   (add-hook 'janet-mode-hook #'inf-janet-minor-mode))

;;;
;;; Load config for Clojure/Script.
;;;

(use-package cider)

;;;
;;; Load config for SBCL.
;;;

;; Slime uses the 'cl' package, which has been deprecated.
;; This is just commented out here for debugging to see
;; if the warning disappears.

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
;; (setq inferior-lisp-program "sbcl")

;;;
;;; Load config for Chez Scheme.
;;;

(setq debug-on-error t)

;;(use-package geiser-chez :ensure t)

(add-to-list 'auto-mode-alist
             '("\\.sls\\'" . scheme-mode))
;;             '("\\.sc\\'" . scheme-mode))
;;(use-package geiser)
;;(use-package geiser-chez :ensure t)

;;;
;;; Initialize configuration for rust.
;;;

;; Get the rust major mode.
(use-package rust-mode
  :ensure t)

;; Use code completion for rust.
(use-package racer
  :ensure t)

;; Configure flycheck for rust.
(use-package flycheck-rust
  :ensure t)

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook  #'company-mode)
(add-hook 'rust-mode-hook  #'racer-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook
          '(lambda ()
	     (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
	     (setq racer-rust-src-path (concat (getenv "HOME") "/projects/rust/src"))
             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
	     ;; Insert closing delimiter at the same time the opening delimiter
	     ;; is inserted.
	     (electric-pair-mode 1)))

(provide 'init-languages)
;;; init-languages ends here
