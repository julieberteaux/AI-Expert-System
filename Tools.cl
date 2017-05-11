
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FONCTIONS OUTILS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;renvoie les premisses d'une regle

(defun premisse (regle)
  (cadr regle)
  )



;renvoie les conclusions d'une regle

(defun conclusion (regle)
  (fourth regle)
  )



;renvoie le pays de l'universite

(defun pays (univ)  
  (cadr (assoc 'pays univ))
  )



;renvoie le nombre de place de l'universite

(defun nbplace (univBF)  
  (cadr(assoc 'places univBF))
  )



;renvoie le pourcentage_EF de l'etudiant qui se trouve dans la BF

(defun pourcentage_EF (bf)  
  (cadr(assoc '%_E/F bf))
  )



;renvoie le pourcentage_AB de l'etudiant qui se trouve dans la BF

(defun pourcentage_AB (bf)  
  (cadr(assoc '%_A/B bf))
  )



;renvoie nil si l'etudiant ne peut pas partir a l'etranger au vu de son pourcentage_EF et t sinon

(defun depart_possible? ( %_E/Fx/F )  
  (if  (< %_E/Fx/F 30) t nil)
  )



;renvoie t si l'etudiant peut acceder aux universites "high level" au vu de son pourcentage_AB

(defun high_level (%_A/B)  
	(if  (> %_A/B 70) 
		t
		nil)
  )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FONCTIONS AUXILIAIRES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; REGLE_CANDIDATE renvoie T si une regle est candidate, c'est a dire que ses premisse sont verifies par la BF
; et que ses conclusions ne s'y trouvent pas deja.

(defun regle_candidate (regle)
  (let ((ok))
    (setq conclu_a_ajouter 0)
    (dolist (p (premisse regle) ok)
         ;verification que chacune des premisses est en accord avec la BF
      (setq ok nil)
      (dolist (fait *BF* ok)
        (if (eq (cadr fait)(cadr p))
         (setq ok t)
          )
        )
      (if (not ok)
          ; si une premisse n'est pas verifie on s'arrete tout de suite et on retourne nil
          (return-from regle_candidate nil)
        )
      ) 
    ;verification qu'au moins une des conclusions n'est pas deja dans la BF
     
     (dolist (c (conclusion regle) ok)
           (setq ok nil)
           (dolist (fait *BF* ok)
             (if (eq (cadr fait) (cadr c))
               (setq ok t)  
               )
             )
       ;on incrémente conclu_a_ajouter des que l'on trouve une conclusion qui n'est pas dans la BF
           (if (not ok)
                 (setq conclu_a_ajouter (+ conclu_a_ajouter 1))
             )
       )
       ;si le nb de conclusion a ajouter est >0 la regle est candidate
      (if  (> conclu_a_ajouter 0)
           t
         nil
         )
    )
  )



; ACTION_REGLE applique la regle, c'est a dire push la conclusion dans la BF

(defun action_regle (regle)
  (dolist (c (conclusion regle))  ; on ne push dans la BF que les conclusions qui ne s'y trouvent pas deja
    (pushnew c *BF*)
    )
  )



; ACCESSIBILITE? renvoie le niveau d'accessibilite de l'universite pour l'etudiant

(defun accessibilite? (univBF *bf*)
  (dolist(r *BR*)
       ;;verification que l'on est sur une regle concernant l'accessibilite
    (if (equal (cadr (car(premisse r))) 'place)
        (progn
          (setq resultat t)
          (dolist(p (premisse r))
               ;verification que les premisses sont en accord avec la BF
            (if (equal (cadr p) 'place)
                (if (not(eval `(,(car p) ,(nbplace univBF) ,(caddr p))))
                   (setq resultat nil)
                  )
              )
            (if (equal (cadr p) '%_A/B)
                (if (not(eval `(,(car p) ,(pourcentage_AB *bf*) ,(caddr p))))
                    (setq resultat nil)
                  )
              )
            )
          (if resultat
              (return (car (conclusion r)))
            )
          )
      )
    )
)


; AFFICHAGE permet d'afficher les resultats, de prendre en compte l'accessibilite et les high level

(defun affichage ()
  (let ((univ nil) (resultat nil))
   
   ;; parcours de la BF pour trouver les universites possibles pour l'etudiant et les regrouper dans la variable univ
   (dolist (fait *BF*)
    (if (eq (car fait) 'univ);;si le fait est une universite on met son nom dans univ
         (push (cadr fait) univ)
         )
     )
    ;; parcours de la liste univ des universites que l'on vient de creer ci-dessus
    (dolist (U univ)
     ;;parcours de l'ensemble des universites pour recuperer dans resultat l'ensemble des caracteristiques des universites
      ;; (la ville, le pays...) qui correspondent au nom qui se trouvent dans univ
      (dolist (univBF *BFuniv*)
       (if (eq (cadr (assoc 'univ univBF)) U)
           (progn
             (setq access (accessibilite? univBF *bf*))
             (push access univBF )
             (push univBF  resultat)
             )
         )
        )
      )
    
    (if (not (high_level (pourcentage_AB *BF*)))
        (dolist (U resultat)
      ;; on enleve toutes les universites "high level" si le poucentage AB de l"etu n'est pas suffisant
      
          (if (member (pays U) '(canada singapour usa suede))
              (delete U resultat :test #'equal)
            )
          )
       )
    (return-from affichage resultat)
    )
  )


