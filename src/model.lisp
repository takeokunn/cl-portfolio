(in-package :cl-user)
(defpackage portfolio.model
    (:use :cl
        :portfolio.db
        :datafly
        :sxql)
    (:export :insert-contacts))

(in-package :portfolio.model)

(defun insert-contacts (name email text)
    (with-connection (db)
        (retrieve-all
            (insert-into :contacts
                (set= :name name
                    :email email
                    :text text)))))
