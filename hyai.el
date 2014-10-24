(require 'cl-lib)

(defconst hyai-indent-offset 4)

(defun hyai-indent-line ()
  (let* ((oh (hyai-current-offset-head))
         (offset (car oh))
         (head (cdr oh))
         (indents (hyai-indent-candidates head))
         (nexts (member offset indents)))
    (when (and indents
               (or (eq this-command 'indent-for-tab-command)
                   (null nexts)
                   (not (= 0 (car nexts) offset))))
      (indent-line-to (car (or (cdr nexts) indents)))
      (unless (string-empty-p head)
        (end-of-line)))))

(defun hyai-indent-candidates (head)
  (save-excursion
    (or (hyai-indent-candidates-from-current head)
        (hyai-indent-candidates-from-previous))))

(defun hyai-indent-candidates-from-current (head)
  (pcase head
    (`"where" '(2))
    (_ nil)))

(defun hyai-indent-candidates-from-previous ()
  (skip-syntax-backward " >")
  (if (bobp)
      '(0)
    (cl-case (char-syntax (char-before))
      (?w (pcase (hyai-grab-word)
            (`"do" (list (+ 4 (car (hyai-current-offset-head)))))
            (`"where"
             (pcase (hyai-current-offset-head)
               (`(,offset . "module") (list offset))
               (_ '(4))))
            (_ '(0 4))))
      (t '(4 0)))))

(defun hyai-current-offset-head ()
  (beginning-of-line-text)
  (if (eobp)
     '(0 . "")
    (let ((head (cl-case (char-syntax (char-after))
                  (?w (looking-at "\\sw*")
                      (match-string-no-properties 0))
                  (?_ (looking-at "\\s_*")
                      (match-string-no-properties 0))
                  (t ""))))
      (cons (current-column) head))))

(defun hyai-grab-word ()
  (when (looking-back "\\<[[:word:]]+")
    (match-string-no-properties 0)))

;;;###autoload
(define-minor-mode hyai-mode
  "Haskell yet another indentation minor mode."
  :lighter " HYAI"
  (kill-local-variable 'indent-line-function)
  (when hyai-mode
    (set (make-local-variable 'indent-line-function) 'hyai-indent-line)))

(defun turn-on-hyai ()
  (interactive)
  (hyai-mode 1))

(defun turn-off-hyai ()
  (interactive)
  (hyai-mode 0))

(provide 'hyai)
