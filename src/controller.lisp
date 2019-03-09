(in-package :cl-user)
(defpackage portfolio.controller
    (:use :cl
        :portfolio.view
        :portfolio.db
        :portfolio.model)
    (:export :root
        :about
        :get-contact
        :post-contact
        :thanks
        :post-slack
        :insert-contacts
        :insert-contacts))

(in-package :portfolio.controller)

;; for slack
(defun post-slack (name email text)
    (let ((payload (format nil "{\"username\":\"bot\",\"icon_emoji\":\":hatching_chick:\",\"text\":\"<@U7RM4J8MR> 名前: ~A メールアドレス: ~A 内容: ~A \",\"as_user\":true}" name email text))
             (webhook_url (uiop:getenv "SLACK_WEBHOOK_URL")))
        (setq drakma:*drakma-default-external-format* :utf-8)
        (drakma:http-request webhook_url
            :method :post
            :content-type "application/json"
            :parameters `(("payload" . ,payload)))))

;; for controller
(defun root ()
    (render #P"index.html"))

(defun about ()
    (render #P"about.html"))

(defun get-contact ()
    (render #P"contact.html"))

(defun post-contact (name email text)
    (insert-contacts name email text)
    (post-slack name email text)
    (render #P"thanks.html"))

(defun thanks ()
    (render #P"thanks.html"))
