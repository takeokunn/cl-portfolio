(in-package :cl-user)
(defpackage portfolio.config
    (:use :cl
        :portfolio.lib)
    (:import-from :envy
        :config-env-var
        :defconfig)
    (:export :config
        :*application-root*
        :*static-directory*
        :*template-directory*
        :appenv
        :developmentp
        :productionp))
(in-package :portfolio.config)

(load-env (asdf:system-relative-pathname "portfolio" ".env"))

(setf (config-env-var) "APP_ENV")

(defparameter *application-root*   (asdf:system-source-directory :portfolio))
(defparameter *static-directory*   (merge-pathnames #P"static/" *application-root*))
(defparameter *template-directory* (merge-pathnames #P"templates/" *application-root*))

(defconfig :common
    `(:databases ((:maindb :mysql
                      :database-name ,(uiop:getenv "DATABASE_NAME")
                      :host ,(uiop:getenv "DATABASE_HOST")
                      :username ,(uiop:getenv "DATABASE_USERNAME")
                      :password ,(uiop:getenv "DATABASE_PASSWORD")))))

(defconfig |development|
    '())

(defconfig |production|
    '())

(defconfig |test|
    '())

(defun config (&optional key)
    (envy:config #.(package-name *package*) key))

(defun appenv ()
    (uiop:getenv (config-env-var #.(package-name *package*))))

(defun developmentp ()
    (string= (appenv) "development"))

(defun productionp ()
    (string= (appenv) "production"))
