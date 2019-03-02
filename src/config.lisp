(in-package :cl-user)
(defpackage portfolio.config
    (:use :cl)
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

(setf (config-env-var) "APP_ENV")

(defparameter *application-root*   (asdf:system-source-directory :portfolio))
(defparameter *static-directory*   (merge-pathnames #P"static/" *application-root*))
(defparameter *template-directory* (merge-pathnames #P"templates/" *application-root*))

(defconfig :common
    `(:databases ((:maindb :mysql
                      :database-name "portfolio"
                      :username "root"
                      :password "P@ssw0rd"))))

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
