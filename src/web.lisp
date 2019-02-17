(in-package :cl-user)
(defpackage caveman-study.web
  (:use :cl
        :caveman2
        :caveman-study.config
        :caveman-study.view
        :caveman-study.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :caveman-study.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
    (render #P"index.html"))

(defroute "/about" ()
    (render #P"about.html"))

(defroute "/contact" ()
    (render #P "contact.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
    (declare (ignore app))
    (merge-pathnames #P"_errors/404.html"
        *template-directory*))
