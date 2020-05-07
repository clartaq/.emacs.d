;;; package -- init.el
;;;
;;; Commentary:
;;; Get the whole ball rolling. Mostly just includes additional package files
;;; related to individual tasks.

;; Added by Package.el. This must come before configurations of
;; installed packages. Don't delete this line. If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;; Code:

(add-to-list 'load-path (expand-file-name "more-init" user-emacs-directory))

(require 'init-elpa)

;; macOS specific
(require 'init-exec-path)

;; Back to generic.
(require 'init-ui)
(require 'init-editing)
(require 'init-company-mode)
(require 'init-navigation)
(require 'init-miscellaneous)
(require 'init-languages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ido-completing-read+ projectile smex flycheck rainbow-delimiters atom-one-dark-theme exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here


