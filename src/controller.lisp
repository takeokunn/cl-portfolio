(in-package :cl-user)
(defpackage caveman-study.controller
    (:use :cl
        :caveman-study.view)
    (:import-from :alexandria
        :map-iota)
    (:export :root
        :about
        :contact))

(in-package :caveman-study.controller)

(defun root ()
    (render #P"index.html"))

(defun about ()
    (render #P"about.html"))

(defun contact ()
    (render #P"contact.html"))
