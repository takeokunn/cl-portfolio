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
        :thanks
        :post-slack
        :insert-contacts
        :insert-contacts))

(in-package :caveman-study.controller)

;; for slack
(defparameter *slack-url* "https://hooks.slack.com/services/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")

;; (defun post-slack (name email text)
;;     (setq *payload* (format nil "{\"username\":\"bot\",\"icon_emoji\":\":hatching_chick:\",\"text\":\"<@U7RM4J8MR> 名前: ~A \n メールアドレス: ~A \n 内容: ~A \",\"as_user\":true}" name email text))
;;     (setq drakma:*drakma-default-external-format* :utf-8)
;;     2(drakma:http-request *slack-url*
;;         :method :post
;;         :content-type "application/json"
;;         :parameters '(("payload" . *payload*))))

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
