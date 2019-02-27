(defsystem "caveman-study"
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
                         (:file "controller" :depends-on ("view" "model"))
                         (:file "model" :depends-on ("db"))
                         (:file "view" :depends-on ("config"))
                         (:file "db" :depends-on ("config"))
                         (:file "config"))))
    :description ""
    :in-order-to ((test-op (test-op "caveman-study-test"))))
