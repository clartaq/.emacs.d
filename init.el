;;; package -- init.el
;;;
;;; Commentary:
;;; Get the whole ball rolling. Mostly just includes additional package files
;;; related to individual tasks.

;;; Code:

(message "Enter init.el")

;; Stop custom from writing stuff into my init file.
(setq custom-file "~/.config/emacs-custom.el")
(load custom-file)

;; Point to the rest of the initialization files.
(add-to-list 'load-path (expand-file-name "more-init" user-emacs-directory))

;; For some reason, this shows as a flycheck error.
(require '~/.emacs.d/more-init/init-elpa)

;; macOS specific
(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

;; Back to generic.
(require 'init-ui)
(require 'init-editing)
(require 'init-company-mode)
(require 'init-navigation)
(require 'init-other-tools)
(require 'init-miscellaneous)
(require 'init-languages)

(provide 'init)
;;; init.el ends here
