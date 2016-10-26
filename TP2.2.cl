;;;Question.3

(defun actions(etat)
  (
   let (action_possibles '())
    (if(and (< (car etat) 4))
        (push 1 action_possibles))
    
    (if(> (cadr etat) 0)
        (push 2 action_possibles))
    
    (if(> (car etat) 0)
        (push 3 action_possibles))
    
    (if(< (cadr etat) 3)
        (push 4 action_possibles))
    
    (if(and (< (+ (cadr etat) (car etat)) 4))
        (push 5 action_possibles))
    
    (if(and (< (+ (car etat) (cadr etat)) 3) (> (cadr etat) 0))
        (push 6 action_possibles))
    
    (if(> (+ (car etat) (cadr etat)) 4)
        (push 7 action_possibles))
    
    (if(> (+ (car etat) (cadr etat)) 3)
        (push 8 action_possibles))
    
    (setq act action_possibles)
    )
  )


;;;Question.4

(defun successeurs (etat etatsVisites)
  (
   let ((list_successeurs '()))
    (dolist ( nieme_action (actions etat) list_successeurs)
      (
       let ((action '()))
        (
         cond
         ((eq nieme_action 1)(setq action (list 4 (cadr etat))))
         ((eq nieme_action 2)(setq action (list (car etat) 0)))
         ((eq nieme_action 3)(setq action (list 0 (cadr etat))))
         ((eq nieme_action 4)(setq action (list (car etat) 3)))
         ((eq nieme_action 5)(setq action (list (+ (car etat) (cadr etat)) 0)))
         ((eq nieme_action 6)(setq action (list 0 (+ (car etat) (cadr etat)))))
         ((eq nieme_action 7)(setq action (list 4 (- (cadr etat) (- 4 (car etat))))))
         ((eq nieme_action 8)(setq action (list (- (car etat) (- 3 (cadr etat))) 3))))

        (if(and (not(member action etatsVisites :test #'equal)) (not(member action list_successeurs :test #'equal)) (not (equal etat action)))
            (push action list_successeurs)
          )
        )
      )
    )
  )

;; recherche

(defun rech_largeur (etat chemin)
  (push etat chemin)
  (
   cond
   ((eq (car etat) 2)(format t "~% une solution possible : ~s " (reverse chemin)))
   (t
     (dolist (nieme_etat (successeurs etat chemin))
       (
        cond
        ((eq (car nieme_etat) 2)(push nieme_etat chemin)(format t "~% une solution possible : ~s " (reverse chemin)))
        ((not(member nieme_etat chemin :test #'equal))(rech_largeur nieme_etat chemin))
        (t nil)
        )
       )
    )
   )
  )
