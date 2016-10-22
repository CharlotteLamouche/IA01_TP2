;;; This is the IDE's built-in-editor, where you create and edit
;;; lisp source code.  You could use some other editor instead,
;;; though the IDE's menu-bar commands would not be applicable there.
;;; 
;;; This editor has a tab for each file that it's editing.  You can
;;; create a new editor buffer at any time with the File | New command.
;;; Other commands such as Search | Find Definitions will create
;;; editor buffers automatically for existing code.
;;; 
;;; You can use the File | Compile and Load command to compile and
;;; load an entire file, or compile an individual definition by
;;; placing the text cursor inside it and using Tools | Incremental
;;; Compile.  You can similarly evaluate test expressions in the
;;; editor by using Tools | Incremental Evaluation; the returned
;;; values and any printed output will appear in a lisp listener
;;; in the Debug Window.
;;; 
;;; For a brief introduction to other IDE tools, try the
;;; Help | Interactive IDE Intro command.  And be sure to explore
;;; the other facilities on the Help menu.

(defun actions (etat)
  (progn
    (setq x (car etat))
    (setq y (cdr etat))
    (cond
     ((< x 4) (setq etat '(4 y)))
     ((> y 0) (setq etat '(x 0)))
     ((> x 0) (setq etat '(0 y)))
     ((< y 3) (setq etat '(x 3)))
     ((< (+ x y) 4) (setq etat '((+ x y) 0)))
     ((< (+ y x) 3) (setq etat '(0 (+ y x))))
     ((> (+ x y) 4) (setq etat '(4 (- y (- 4 x)))))
     ((> (+ y x) 3) (setq etat '((- y (- 4 x)) 3)))
     )
    )
  )

     
(defun successeurs(etat etatsVisites)
  (
   )
  )
