
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INITIALISATION DES VARIABLES GLOBALES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *BF* '( (langue francais) (branche GI) (uvValidee LA13) (uvValidee LG62) (continent asie) (continent oceanie) (%_A/B 80) (%_E/F 10)))

(defparameter *BR* '((SI ( ( UVvalidee LA13) ) ALORS ( (langue anglais) ) )
             (SI ( ( UVvalidee LA14) ) ALORS ( (langue anglais) ) )
             (SI ( ( UVvalidee LB14) ) ALORS ( (langue anglais) ) )
             (SI ( ( UVvalidee LC14) ) ALORS ( (langue anglais) ) )
             (SI ( ( UVvalidee LD14) ) ALORS ( (langue anglais) ) )
             (SI ( ( UVvalidee LA03) ) ALORS ( (langue allemand) ) )
             (SI ( ( UVvalidee LA04) ) ALORS ( (langue allemand) ) )
             (SI ( ( UVvalidee LA23) ) ALORS ( (langue espagnol) ) )
             (SI ( ( UVvalidee LA24) ) ALORS ( (langue espagnol) ) ) 
             (SI ( ( UVvalidee LB24) ) ALORS ( (langue espagnol) ) ) 
             (SI ( ( UVvalidee LG31) ) ALORS ( (langue japonais) ) )
             (SI ( ( UVvalidee LG32) ) ALORS ( (langue japonais) ) )
             (SI ( ( UVvalidee LG41) ) ALORS ( (langue portugais) ) )
             (SI ( ( UVvalidee LG42) ) ALORS ( (langue portugais) ) )
             (SI ( ( UVvalidee LG51) ) ALORS ( (langue italien) ) )
             (SI ( ( UVvalidee LG52) ) ALORS ( (langue italien) ) )
             (SI ( ( UVvalidee LG53) ) ALORS ( (langue italien) ) )
             (SI ( ( UVvalidee LG60) ) ALORS ( (langue chinois) ) )
             (SI ( ( UVvalidee LG61) ) ALORS ( (langue chinois) ) )
             (SI ( ( UVvalidee LG62) ) ALORS ( (langue chinois) ) )
             (SI ( ( UVvalidee LG63) ) ALORS ( (langue chinois) ) )
             (SI ( (langue anglais) (continent europe) ) ALORS ( (pays angleterre) (pays bulgarie)(pays suede)(pays pologne)(pays roumanie)(pays slovaquie)(pays turquie) ) )
             (SI ( (langue anglais) (continent amerique) ) ALORS ( (pays usa)(pays canada) ) )
             (SI ( (langue anglais) (continent oceanie) ) ALORS ( (pays australie) ) )
             (SI ( (langue anglais) (continent asie) ) ALORS ( (pays singapour)(pays coree)(pays japon)(pays taiwan) ) )
             (SI ( (langue allemand) (continent europe) ) ALORS ( (pays allemagne) (pays autriche)(pays pays_bas)  ) )
             (SI ( (langue espagnol) (continent amerique) ) ALORS ( (pays argentine)(pays chili)(pays colombie)(pays equateur)(pays mexique) ) )
             (SI ( (langue espagnol) (continent europe) ) ALORS ( (pays espagne) ) )
             (SI ( (langue italien) (continent europe) ) ALORS ( (pays italie) ) )
             (SI ( (langue portugais) (continent amerique) ) ALORS ( (pays bresil) ) )
             (SI ( (langue chinois) (continent asie) ) ALORS ( (pays chine)(pays singapour)(pays taiwan) ) )
             (SI ( (langue francais) (continent europe) ) ALORS ( (pays belgique) ) )
             (SI ( (langue francais) (continent amerique) ) ALORS ( (pays canada) ) )
             (SI ( (langue japonais) (continent asie) ) ALORS ( ( pays japon ) ) )
             (SI ( (pays allemagne) (branche GI) ) ALORS ((univ teschnische_universitat_hamburg)) )
             (SI ( (pays allemagne) (branche GI) ) ALORS ((univ technische_universat_llmenau)))
             (SI ( (pays argentine) (branche GI) ) ALORS ((univ universidad_del_salvador)))
             (SI ( (pays australie) (branche GI) ) ALORS ((univ swinburne_university_of_technology)))
             (SI ( (pays autriche) (branche GI) ) ALORS ((univ technische_universat_graz)))
             (SI ( (pays belgique) (branche GI) ) ALORS ((univ universiteit_gent)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_de_minas_gerais)))
             (SI ( (pays bresil) (branche GI) ) ALORS ( (univ universidade_federal_de_campina_grande)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_estual_de_campinas)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_caxias_do_sul)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ pontificia_universidade_catolica_do_parana)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_do_parana)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_tecnologica_federal_do_parana)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_de_santa_catarina)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_de_itajuba)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_da_paraiba)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_de_lavras)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_estual_de_paraiba)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_de_pernambuco)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_de_rio_de_janeiro)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ instituto_nacional_de_telecommunicoes)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ escola_politecnica_de_sao_paulo)))
             (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_federal_de_uberlandia)))
             (SI ( (pays bulgarie) (branche GI) ) ALORS ((univ technical_university_of_sofia)))
             (SI ( (pays bulgarie) (branche GI) ) ALORS ((univ university_of_chemical_engineering)))
             (SI ( (pays canada) (branche GI) ) ALORS ((univ universite_du_quebec_a_chicoutimie)))
             (SI ( (pays canada) (branche GI) ) ALORS ((univ universite_laval)))
             (SI ( (pays canada) (branche GI) ) ALORS ((univ ecole_de_technologie_superieure_de_montreal)))
             (SI ( (pays canada) (branche GI) ) ALORS ((univ polytechnique_montreal)))
             (SI ( (pays canada) (branche GI) ) ALORS ((univ universite_de_sherbrooke)))
             (SI ( (pays chili) (branche GI) ) ALORS ((univ universidad_arturo_prat)))
             (SI ( (pays espagne) (branche GI) ) ALORS ((univ universidad_de_lleida)))
             (SI ( (pays italie) (branche GI) ) ALORS ((univ universita_della_calabria)))
             (SI ( (pays usa) (branche GI) ) ALORS ((univ georgia_institute_of_technology)))
             (SI ( (pays usa) (branche GI) ) ALORS ((univ university_of_texas_rio_grande_valley)))
             (SI ( (pays usa) (branche GI) ) ALORS ((univ university_of_rhode_island)))
             (SI ( (pays usa) (branche GI) ) ALORS ((univ university_of_illinois_at_urbana_champaign)))
             (SI ( (pays singapour) (branche GI) ) ALORS ((univ nanyang_technological_university)))
             (SI ( (pays suede) (branche GI) ) ALORS ((univ linkoping_university_of_technology)))
             (SI ( (pays chili) (branche GI) ) ALORS ((univ pontificia_universidad_catolica_de_valparaiso)))
             (SI ( (pays chili) (branche GI) ) ALORS ((univ universidad_technica_frederico_santa_maria)))
             (SI ( (pays colombie) (branche GI) ) ALORS ((univ escuela_colombiana_de_ingenieria)))
             (SI ( (pays colombie) (branche GI) ) ALORS ((univ universidad_autonoma_de_bucaramanga)))
             (SI ( (pays colombie) (branche GI) ) ALORS ((univ universidad_eafit)))
             (SI ( (pays coree) (branche GI) ) ALORS ((univ pohang_university_of_science_and_technology)))
             (SI ( (pays coree) (branche GI) ) ALORS ((univ hanyang_university)))
             (SI ( (pays equateur) (branche GI) ) ALORS ((univ escuela_politecnica_nacional_de_quito)))
             (SI ( (pays espagne) (branche GI) ) ALORS ((univ universidad_autonoma_de_barcelona)))
             (SI ( (pays espagne) (branche GI) ) ALORS ((univ universidad_politecnica_de_madrid)))
             (SI ( (pays espagne) (branche GI) ) ALORS ((univ universidad_de_murcia)))
             (SI ( (pays espagne) (branche GI) ) ALORS ((univ universidad_rovira_i_virgili)))
             (SI ( (pays italie) (branche GI) ) ALORS ((univ universita_di_bologna)))
             (SI ( (pays italie) (branche GI) ) ALORS ((univ politecnico_di_milano)))
             (SI ( (pays italie) (branche GI) ) ALORS ((univ universita_degli_studi_modena_e_regio_emilia)))
             (SI ( (pays italie) (branche GI) ) ALORS ((univ universita_degli_studi_di_napoli_frederico_li)))
             (SI ( (pays japon) (branche GI) ) ALORS ((univ chiba_institute_of_technology)))
             (SI ( (pays japon) (branche GI) ) ALORS ((univ chiba_university)))
             (SI ( (pays japon) (branche GI) ) ALORS ((univ ritsumeikan_university)))
             (SI ( (pays japon) (branche GI) ) ALORS ((univ wakayama_university)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ universidad_autonoma_de_aguascalientes)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ universidad_de_guanajuato) ))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ universidad_anahuac_mayab)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ instituto_politecnico_nacional)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ tec_de_monterrey)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ universidad_iberoamericana)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ upaep)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ itesm_san_luis_potosi)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ itesm_toluca)))
             (SI ( (pays mexique) (branche GI) ) ALORS ((univ instituto_technologico_de_zacatepec)))
             (SI ( (pays pays_bas) (branche GI) ) ALORS ((univ university_twente)))
             (SI ( (pays pologne) (branche GI) ) ALORS ((univ lodz_university_technology)))
             (SI ( (pays chine) (branche GI) ) ALORS ((univ tianjin_university_technology)))
             (SI ( (pays roumanie) (branche GI) ) ALORS ((univ universite_de_craiova)))
             (SI ( (pays singapour) (branche GI) ) ALORS ((univ national_university_of_singapore)))
             (SI ( (pays slovaquie) (branche GI) ) ALORS ((univ technical_university_of_kosice)))
             (SI ( (pays taiwan) (branche GI) ) ALORS ((univ national_chiao_tung_university)))
             (SI ( (pays turquie) (branche GI) ) ALORS ((univ atilim_university)))
             (SI (( <= place 6)  (<= %_A/B 30)) ALORS ((accessibilite dure)) )
             (SI (( > place 6) (<= place 12) (<= %_A/B 30)) ALORS ((accessibilite moyenne)) )
             (SI ((> place 12) (<= %_A/B 30)) ALORS ((accessibilite moyen)) )
             (SI ((<= place 6) (> %_A/B 30) (<= %_A/B  60)) ALORS ((accessibilite moyenne)) )
             (SI ((> place 6) (<= place 12) (> %_A/B 30) (<= %_A/B  60)) ALORS ((accessibilite moyenne)) )
             (SI ((> place 12) (> %_A/B 30) (<= %_A/B  60))  ALORS ((accessibilite facile)) )
             (SI ((<= place 6) (> %_A/B 60)) ALORS ((accessibilite facile)) )
             (SI (( > place 6) (<= place 12) (> %_A/B 60)) ALORS ((accessibilite facile)) )
             (SI ((> place 12) ( >%_A/B 60)) ALORS ((accessibilite facile)) )

                     )
  )

(defparameter *BFuniv* '(
                            ((pays allemagne) (ville hamburg) (univ teschnische_universitat_hamburg) (branche GI) (places 3) )
                            ((pays allemagne) (ville llmenau) (univ technische_universat_llmenau) (branche GI) (places 3))
                            ((pays argentine) (ville buenos_aires) (univ universidad_del_salvador) (branche GI) (places 2))
                            ((pays australie) (ville vistoria) (univ swinburne_university_of_technology) (branche GI) (places 2))
                            ((pays autriche) (ville graz) (univ technische_universat_graz) (branche GI) (places 9))
                            ((pays belgique) (ville gent) (univ universiteit_gent) (branche GI) (places 2))
                            ((pays bresil) (villes belo_horizonte) (univ universidade_federal_de_minas_gerais) (branche GI) (places 1))
                            ((pays bresil) (ville campina_grande) (univ universidade_federal_de_campina_grande) (branche GI) (places 1))
                            ((pays bresil) (ville campinas_sao_paulo) (univ universidade_estual_de_campinas) (branche GI) (places 2))
                            ((pays bresil) (ville caxias_do_sul) (univ universidade_caxias_do_sul) (branche GI) (places 5))
                            ((pays bresil) (ville curitiba)  (univ pontificia_universidade_catolica_do_parana) (branche GI) (places 5))
                            ((pays bresil) (ville curitiba)  (univ universidade_federal_do_parana) (branche GI) (places 8))
                            ((pays bresil) (ville curitiba)  (univ universidade_tecnologica_federal_do_parana) (branche GI) (places 4))
                            ((pays bresil) (ville florianopolis)  (univ universidade_federal_de_santa_catarina) (branche GI) (places 5))
                            ((pays bresil) (ville itajuba)  (univ universidade_federal_de_itajuba) (branche GI) (places 7))
                            ((pays bresil) (ville joao_pessoa)  (univ universidade_federal_da_paraiba) (branche GI) (places 5))
                            ((pays bresil) (ville lavras)  (univ universidade_federal_de_lavras) (branche GI) (places 5))
                            ((pays bresil) (ville maringa)  (univ universidade_estual_de_paraiba) (branche GI) (places 5))
                            ((pays bresil) (ville recife)  (univ universidade_federal_de_pernambuco) (branche GI) (places 4))
                            ((pays bresil) (ville rio_de_janeiro)  (univ universidade_federal_de_rio_de_janeiro) (branche GI) (places 6))
                            ((pays bresil) (ville jsanta_rita)  (univ instituto_nacional_de_telecommunicoes) (branche GI) (places 1))
                            ((pays bresil) (ville sao_paulo)  (univ escola_politecnica_de_sao_paulo) (branche GI) (places 4))
                            ((pays bresil) (ville uberlandia)  (univ universidade_federal_de_uberlandia) (branche GI) (places 1))
                            ((pays bulgarie) (ville sofia)  (univ technical_university_of_sofia) (branche GI) (places 2))
                            ((pays bulgarie) (ville sofia)  (univ university_of_chemical_engineering) (branche GI) (places 4))
                            ((pays canada) (ville chicoutimi)  (univ universite_du_quebec_a_chicoutimie) (branche GI) (places 10))
                            ((pays canada) (ville quebec) (univ universite_laval) (branche GI) (places 8))
                            ((pays canada) (ville montreal)  (univ ecole_de_technologie_superieure_de_montreal) (branche GI) (places 15))
                            ((pays canada) (ville montreal)  (univ polytechnique_montreal) (branche GI) (places 15))
                            ((pays canada) (ville sherbrookel)  (univ universite_de_sherbrooke) (branche GI) (places 10))
                            ((pays chili) (ville iquique) (univ universidad_arturo_prat) (branche GI) (places 1))
                            ((pays espagne) (ville lleida) (univ universidad_de_lleida) (branche GI) (places 13))
                            ((pays italie) (ville arcavacata) (univ universita_della_calabria) (branche GI) (places 6))
                            ((pays usa) (ville atlanta)  (univ georgia_institute_of_technology) (branche GI) (places 10))
                            ((pays usa) (ville urbana)  (univ university_of_illinois_at_urbana_champaign) (branche GI) (places 4))
                            ((pays usa) (ville brownsville)  (univ university_of_texas_rio_grande_valley) (branche GI) (places 2))
                            ((pays usa) (ville kingston)  (univ university_of_rhode_island) (branche GI) (places 2))
                            ((pays singapour) (ville nanyang)  (univ nanyang_technological_university) (branche GI) (places 2))
                            ((pays suede) (ville linkoping)  (univ linkoping_university_of_technology) (branche GI) (places 6))
                            ((pays chili) (ville valparaiso) (univ pontificia_universidad_catolica_de_valparaiso) (branche GI) (places 2))
                            ((pays chili) (ville valparaiso) (univ universidad_technica_frederico_santa_maria) (branche GI) (places 2))
                            ((pays colombie) (ville bogota) (univ escuela_colombiana_de_ingenieria) (branche GI) (places 4))
                            ((pays colombie) (ville bucaramanga) (univ universidad_autonoma_de_bucaramanga) (branche GI) (places 2))
                            ((pays colombie) (ville medellin) (univ universidad_eafit) (branche GI) (places 4))
                            ((pays coree) (ville pohang) (univ pohang_university_of_science_and_technology) (branche GI) (places 5))
                            ((pays coree) (ville seoul) (univ hanyang_university) (branche GI) (places 2))
                            ((pays equateur) (ville quito) (univ escuela_politecnica_nacional_de_quito) (branche GI) (places 2))
                            ((pays espagne) (ville bellatera) (univ universidad_autonoma_de_barcelona) (branche GI) (places 2))
                            ((pays espagne) (ville madrid) (univ universidad_politecnica_de_madrid) (branche GI) (places 4))
                            ((pays espagne) (ville murcia) (univ universidad_de_murcia) (branche GI) (places 3))
                            ((pays espagne) (ville tarragone) (univ universidad_rovira_i_virgili) (branche GI) (places 26))
                            ((pays italie) (ville bologna) (univ universita_di_bologna) (branche GI) (places 2))
                            ((pays italie) (ville milan) (univ politecnico_di_milano) (branche GI) (places 9))
                            ((pays italie) (ville modena) (univ universita_degli_studi_di_modena_e_regio_emilia) (branche GI) (places 3))
                            ((pays italie) (ville napoli) (univ universita_degli_studi_di_napoli_frederico_li) (branche GI) (places 1))
                            ((pays japon) (ville chiba) (univ chiba_institute_of_technology) (branche GI) (places 5))
                            ((pays japon) (ville chiba) (univ chiba_university) (branche GI) (places 2))
                            ((pays japon) (ville shiga) (univ ritsumeikan_university) (branche GI) (places 1))
                            ((pays japon) (ville wakayama) (univ wakayama_university) (branche GI) (places 1))
                            ((pays mexique) (ville aguascalientes) (univ universidad_autonoma_de_aguascalientes) (branche GI) (places 5))
                            ((pays mexique) (ville guanajuato) (univ universidad_de_guanajuato) (branche GI) (places 5))
                            ((pays mexique) (ville merida_yucatan) (univ universidad_anahuac_mayab) (branche GI) (places 3))
                            ((pays mexique) (ville mexico) (univ instituto_politecnico_nacional) (branche GI) (places 5))
                            ((pays mexique) (ville mexico) (univ tec_de_monterrey) (branche GI) (places 8))
                            ((pays mexique) (ville mexico) (univ universidad_iberoamericana) (branche GI) (places 3))
                            ((pays mexique) (ville pueblar) (univ upaep) (branche GI) (places 6))
                            ((pays mexique) (ville san_luis_potosi) (univ itesm_san_luis_potosi) (branche GI) (places 5))
                            ((pays mexique) (ville toluca) (univ itesm_toluca) (branche GI) (places 4))
                            ((pays mexique) (ville zacatepec_de_hidalgo) (univ instituto_technologico_de_zacatepec) (branche GI) (places 5))
                            ((pays pays_bas) (ville enschede) (univ university_twente) (branche GI) (places 2))
                            ((pays pologne) (ville lodz) (univ lodz_university_technology) (branche GI) (places 7))
                            ((pays chine) (ville tianjin) (univ tianjin_university_technology) (branche GI) (places 3))
                            ((pays roumanie) (ville craiova) (univ universite_de_craiova) (branche GI) (places 2))
                            ((pays singapour) (ville singapore) (univ national_university_of_singapore) (branche GI) (places 1))
                            ((pays slovaquie) (ville kosice) (univ technical_university_of_kosice) (branche GI) (places 8))
                            ((pays taiwan) (ville hsinchu) (univ national_chiao_tung_university) (branche GI) (places 3))
                          ((pays turquie) (ville ankara) (univ atilim_university) (branche GI) (places 2))
                          )
   )

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
