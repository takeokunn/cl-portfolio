(defsystem "caveman-study-test"
  :defsystem-depends-on ("prove-asdf")
  :author "takeokunn"
  :license ""
  :depends-on ("caveman-study"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "caveman-study"))))
  :description "Test system for caveman-study"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
