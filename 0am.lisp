;;;; 0am.lisp

(in-package #:0am)

(defvar *tests* nil)

(defun clear-tests ()
  "Delete all existing tests from the collection."
  (setf *tests* nil))

(defun run (&optional (tests (reverse *tests*)))
  "Run all given tests (defaults to *tests*."
  (let ((total (length tests))
	(run 0)
	(failed 0))
    (format T "Running ~A tests~%" total)
    (dolist (test tests)
      (incf run)
      (let ((result (funcall test)))
	(when result
	  (incf failed)
	  (report test result run total))))
    (format T "Result: ~A ran, ~A passed, ~A failed" total (- total failed) failed)))

(defun report (test result run total)
  (format T "FAILED: ~A (~A/~A); ~A~%" test run total result)
  (finish-output))

(defmacro test (name &body body)
  "Define a test with the given name and add it to *tests*."
  `(progn (defun ,name () ,@body)
	  (pushnew ',name *tests*)))

(defmacro is (&whole whole form)
  "Test passes if FORM evaluates to T."
  `(fis ',whole ,form))

(defun fis (whole val)
  (if val nil (format nil "~A returned NIL" whole)))
