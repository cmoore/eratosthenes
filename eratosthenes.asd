;;;; eratosthenes.asd

(asdf:defsystem #:eratosthenes
  :description "Geographic Coordinate System utilities."
  :author "Clint Moore <clint@ivy.io>"
  :license "MIT"
  :serial t
  :components ((:file "package")
               (:file "eratosthenes")))

