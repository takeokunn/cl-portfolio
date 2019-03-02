(in-package :cl-user)
(defpackage portfolio.web
    (:use :cl
        :caveman2
        :portfolio.config
        :portfolio.view
        :portfolio.db
        :portfolio.controller
        :datafly
        :sxql)
    (:export :*web*))
(in-package :portfolio.web)

;; for @route annotation
;; (syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
    (root))

(defroute "/about" ()
    (about))

(defroute "/contact" ()
    (get-contact))

(defroute ("/contact" :method :POST) (&key |name| |email| |content|)
    (post-contact |name| |email| |content|))

(defroute "/thanks" ()
    (thanks))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
    (declare (ignore app))
    (merge-pathnames #P"_errors/404.html"
        *template-directory*))
