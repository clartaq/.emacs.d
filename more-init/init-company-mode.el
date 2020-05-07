;;; package --- init-company-mode.el
;;;
;;; Commentary:
;;; Initialize buffer text completions with company mode.

;;; Code:

(require 'init-elpa)

(use-package company
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'prog-mode-hook 'company-mode))

(provide 'init-company-mode)
;;; init-company-mode ends here
