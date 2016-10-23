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


(defun actions(etat)
  (
   let (action_possibles '())
    (if(< (car etat) 4)
       (setq action_possibles (append action_possibles (list 1))))
    (if(> (cadr etat) 0)
        (setq action_possibles (append action_possibles (list 2))))
    (if(> (car etat) 0)
        (setq action_possibles (append action_possibles (list 3))))
    (if(< (cadr etat) 3)
        (setq action_possibles (append action_possibles (list 4))))
    (if(and (< (+ (cadr etat) (car etat)) 4) (> (car etat) 0))      ;test si car > 0
        (setq action_possibles (append action_possibles (list 5))))
    (if(and (< (+ (car etat) (cadr etat)) 3) (> (cadr etat) 0))     ;test si cadr > 0
        (setq action_possibles (append action_possibles (list 6))))
    (if(> (+ (car etat) (cadr etat)) 4)
        (setq action_possibles (append action_possibles (list 7))))
   
   (if(> (+ (car etat) (cadr etat)) 3)
       (setq action_possibles (append action_possibles (list 8))))
    
    (print action_possibles)
    )
)
