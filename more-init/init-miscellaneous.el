;;; package --- init-miscellaneous.el
;;;
;;; Commentary:
;;; A few little miscellaneous items for initialization.

;;; Code:

(message "Enter init-miscelaneous.el")

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(provide 'init-miscellaneous)
;;; init-miscellaneous ends here
