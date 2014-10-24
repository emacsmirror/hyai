(When "^I call hyai-indent-candidates at the current point"
  (lambda ()
    (let ((oh (hyai-current-offset-head)))
      (setq hyai-test-candidates-output
            (hyai-indent-candidates (cdr oh))))))

(Then "^indent candidates are \"\\(.*\\)\"$"
  (lambda (expected)
    (should (equal hyai-test-candidates-output (read expected)))))
