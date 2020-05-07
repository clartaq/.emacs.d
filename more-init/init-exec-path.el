;;; package -- init-exec-path.el
;;;
;;; Commentary:
;;; This is a macOS specific initialization to deal with the fact that
;;; starting Emacs from the GUI and the command line do slightly different
;;; things on the Mac.

;;; Code:

(require 'init-elpa)

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(provide 'init-exec-path)
;;; init-exec-path.el ends here

