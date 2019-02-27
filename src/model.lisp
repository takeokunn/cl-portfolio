(in-package :cl-user)
(defpackage caveman-study.model
    (:use :cl
        :caveman-study.db
        :datafly
        :sxql)
    (:export :insert-contacts))

(in-package :caveman-study.model)

(defun insert-contacts (name email text)
    (with-connection (db)
        (retrieve-all
            (insert-into :contacts
                (set= :name name
                    :email email
                    :text text)))))
