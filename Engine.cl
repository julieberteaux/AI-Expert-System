
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MOTEUR D'INFERENCE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun moteur ()
  ;on teste si le départ est possible au vu du pourcentage_EF des mauvaises notes de l'étudiant
  (unless (depart_possible? (pourcentage_EF *BF*))
    (error "le depart est impossible au vu de vos resultats")
    )
  (let ((continue t)) ;;variable qui permet de savoir quand on arrete de boucler sur la BR
    (while continue 
      ;;tant qu'une regle a ete appliquee on continue de boucler pour parcourir la base de regle
     (setq continue nil)
      (dolist (R *BR*)       
        ;parcours de la BR, si une regle est applicable on l'applique
        (if (regle_candidate R) 
          (progn
            (action_regle R)
            (setq continue t)
           )
          )
        )
    );; On sort du while quand on a parcourut toute la BR et qu'aucune regle n'est applicable
    
   (if (not (affichage))
      (print "vous ne pouvez postuler a aucune universite")
    ;(affichage)
    (dolist (u (affichage)"Fin de la liste des universites")
      (print u)
      )
    )
  )
  )
