(defsystem "portfolio"
    :version "0.1.0"
    :author "takeokunn"
    :license ""
    :depends-on ("clack"
                    "lack"
                    "caveman2"
                    "envy"
                    "cl-ppcre"
                    "uiop"
                    "alexandria"
                    "serapeum"
                    "drakma"
                    "cl-json"
                    "log4cl"

                    ;; for @route annotation
                    "cl-syntax-annot"

                    ;; HTML Template
                    "djula"

                    ;; for DB
                    "datafly"
                    "sxql")
    :components ((:module "src"
                     :components
                     ((:file "main" :depends-on ("config" "view" "db"))
                         (:file "web" :depends-on ("view" "controller"))
                         (:file "controller" :depends-on ("view" "model" "lib"))
                         (:file "model" :depends-on ("db"))
                         (:file "view" :depends-on ("config"))
                         (:file "db" :depends-on ("config"))
                         (:file "config" :depends-on ("lib"))
                         (:file "lib"))))
    :description ""
    :in-order-to ((test-op (test-op "portfolio-test"))))
