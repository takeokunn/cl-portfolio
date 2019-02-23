(in-package :cl-user)
(defpackage caveman-study.web
    (:use :cl
        :caveman2
        :caveman-study.config
        :caveman-study.view
        :caveman-study.db
        :caveman-study.controller
        :datafly
        :sxql)
    (:export :*web*))
(in-package :caveman-study.web)

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

(defroute ("/contact" :method :POST) (&key |name| |email| |text|)
    (post-contact |name| |email| |text|))

(defroute "/thanks" ()
    (thanks))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
    (declare (ignore app))
    (merge-pathnames #P"_errors/404.html"
        *template-directory*))
