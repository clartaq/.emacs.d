;;; package --- init-languages.el
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
;;; Configuration for C.
;;;

(use-package clang-format
  :ensure t)

(global-set-key [C-M-tab] 'clang-format-region)
(global-set-key [C-M-l] 'clang-format-buffer)
(setq clang-format-style "google")

;;;
;;; Configuration for Java.
;;

(use-package lsp-java
  :after lsp)

;;;
;;; Configuration for zig.
;;;

(use-package zig-mode
  :ensure t)

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

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;;;
;;; Load config for Chez Scheme.
;;;

;;(setq debug-on-error t)

;;(use-package geiser-chez :ensure t)

(add-to-list 'auto-mode-alist
             '("\\.sls\\'" . scheme-mode))
;;             '("\\.sc\\'" . scheme-mode))
;;(use-package geiser)
;;(use-package geiser-chez :ensure t)

;;;
;;; Initialize configuration for Pascal (Lazarus).
;;;

(add-to-list 'auto-mode-alist
             '("\\.lpr\\'" . pascal-mode))
(use-package lsp-pascal)

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

;; Configure for julia
(use-package julia-mode
  :ensure t)
;; (require 'julia-mode)
;;(push "/path/to/lsp-julia" load-path)
(require 'lsp-julia)
(require 'lsp-mode)
;; ;; Configure lsp + julia
(add-hook 'julia-mode-hook #'lsp-mode)
(add-hook 'julia-mode-hook #'lsp)

;;(setq lsp-julia-package-dir nil)
;;(setq lsp-julia-flags '("-J~/.julia/compiled/v1.7/LanguageServer"))

;;(use-package lsp-julia
;;  :config
;;  (setq lsp-julia-default-environment "~/.julia/environments/v1.7"))
;;(require 'julia-mode)
;;(add-hook 'julia-mode #'lsp-mode)

;;(use-package lsp-mode
;;  :hook ((c-mode java-mode julia-mode rust-mode markdown-mode scheme-mode lisp-mode janet-mode). lsp-deferred)
;;  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

(provide 'init-languages)
;;; init-languages ends here
