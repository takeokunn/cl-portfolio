(in-package :cl-user)
(defpackage caveman-study.controller
    (:use :cl
        :caveman-study.view
        :caveman-study.db
        :datafly
        :sxql)
    (:export :root
        :about
        :get-contact
        :post-contact
        :thanks))

(in-package :caveman-study.controller)

;; for slack
(defun post-slack ()
    (setq *url* "https://hooks.slack.com/services/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")
    (setq *json-parameter* '((:username "bot")
                                (:icon_emoji ":hatching_chick:")
                                (:as_user true)
                                (:text "post post")))
     (drakma:http-request *url*
          :method :post
          :parameters '(("payload" . *payload*))
          :content-type "application/json"))

;; for db
(defun insert-contacts (name email text)
    (with-connection (db)
        (retrieve-all
            (insert-into :contacts
                (set= :name name
                    :email email
                    :text text)))))

;; for controller
(defun root ()
    (render #P"index.html"))

(defun about ()
    (render #P"about.html"))

(defun get-contact ()
    (render #P"contact.html"))

(defun post-contact (name email text)
    (insert-contacts (name email text))
    ;; (post-slack ())
    (render #P"index.html"))

(defun thanks ()
    (render #P"thanks.html"))
