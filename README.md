# Systeme-Expert-Depart-Etranger
## TP3 IA01
## Système Expert d’ordre 0+.

## Liepchitz Laura & Berteaux Julie - 

# Où partir en semestre à l’étranger ?


Ce TP d’IA01 nous a permis de construire un système expert d’ordre 0+.
Un système expert est un programme informatique qui « raisonne sur des problèmes dont la résolution repose sur une expertise humaine dans un domaine délimité. » (Edward Feigenbaum)
L'utilisation d'un tel système est justifiée lorsque la résolution du problème ne connaît pas d'algorithme connu ou de modèle mathématique.
Pour raisonner, un SE se compose de trois parties :

  - une base de règles qui indique le raisonnement à suivre
  - une base de faits que donne l’utilisateur
  - un moteur d'inférence qui fait fonctionner les règles à partir de ces faits pour obtenir de nouveaux faits jusqu'à atteindre la réponse à la question posée.

Le SE proposé est d'ordre 0+ : les faits sont représentés comme des couples (attribut valeur).
Nous présenterons tout d'abord notre problématique et l’expertise associée, puis la représentation des connaissances, dans les bases de faits et de règles.
Enfin, nous expliquerons notre moteur d'inférence, en chaînage avant et terminerons sur un exemple d’utilisation.


## Présentation Du Sujet

### Problématique 
Monica est à L’UTC, ayant finie son semestre de GI01 non sans quelques difficultés, elle souhaiterait très fortement partir à l’étranger l’année prochaine. Elle sait qu’à l’UTC c’est tout à fait possible et que de nombreux choix s’offrent à elle. Organisée elle décide de commencer dès à présent à regarder où elle pourrait bien postuler dans un an. Monica se trouve alors confronté à un amas de questions : 
Mais quelles sont les universités partenaires ? 
Qui plus est pour le Génie informatique ? 
Quelles notes faut-il avoir pour postuler pour telle ou telle université ? 
Après de longues heures passer à éplucher les différents onglets de l’ENT, puis les sites de chaque université, Monica, désespérée est sur le point d’abandonner. C’est alors qu’elle repense au cours d’IA01 et plus particulièrement aux chers et tendres systèmes experts qu’elle a étudié dans cette UV. Ni une ni deux elle décide de se replonger dans son poly pour concevoir un Conseiller de départs à l’étranger.


### Expertise
Dans le nom « système expert à base de règles » on se rend tout de suite compte que les règles occupent une place centrale dans ce système. Pour les obtenir, il est nécessaire de procéder à une expertise au préalable. Cette-dernière nous permettra ensuite de construire de véritables règles. L’expertise est donc la partie la plus conséquente de ce TP puisque tout repose dessus.
Dans notre exemple, le SE conseillera une liste d’universités pour lesquelles le départ est possible pour l’étudiant au vue de ses résultats et de ses UVs de langues validées. Il n’existe pas de règles exactes et prédéfinies correspondant à ce problème nous devons donc  concevoir nous-même l'expertise sur laquelle reposera tout le système. 
Pour y parvenir nous avons eu un entretien avec Mme Annick Pourplanche, qui fait partie de la Direction aux Relations Internationales.
Nous nous sommes basées sur la documentation qu’elle nous a fournie, à savoir la liste des universités partenaires pour le semestre en cours ainsi que le nombre de places correspondant pour chacune. 
Nous avons également vu avec elle les conditions nécessaires d’un départ possible, comment définir l’accessibilité aux universités pour un étudiant et enfin qu’il existe quatre pays comprenant des universités « High Level ».
Schéma des niveaux de profondeur

UV Validée -> Langue

Langue + Continent -> Pays

Pays + Branche -> Université


### Limitations du sujet
Au vu de la quantité d’universités partenaires nous avons décidé de nous limiter aux cas de départs à l’étranger pour la branche Génie Informatique. Notons toutefois, qu’il suffirait d’ajouter les universités correspondant aux autres branches dans la base des universités et que le moteur fonctionnerait de la même façon.
De plus, ce système expert ne prend pas en compte tout ce qui est de l’ordre du cas par cas lors du jury de départ à l’étranger (motivation de l’étudiant …) et se limite à une étude plus théorique et stricte du départ possible ou non.



## Représentation des bases


### Base de Règles
Nous avons choisi de structurer nos règles de manière à ce qu’elles soient indépendantes de notre moteur. C’est à dire qu’elles peuvent être utilisables par n’importe quel autre moteur d’inférence . Nous avons décidé de les représenter sous forme de liste de prémisse et de liste des conclusions.
Chaque prémisse et chaque conclusion étant un couple (attribut valeur) afin de respecter le moteur d’inférence d’ordre 0+

-> SI (premisses) ALORS (conclusions)
-> SI ( (attributP1 valeurP1) (attributP2 valeurP2) ) ALORS ((attributC1 valeurC1) (attributC2 valeurC2) (attributC3 valeurC3))

La base de règle est donc l’élément essentiel de notre système expert, elle contient 120 règles permettant d’ajouter ou non des faits dans la base de faits.
Nous avons 4 types de règles qui représente nos différentes étapes de profondeurs :

    (SI ( ( UVvalidee LA23) ) ALORS ( (langue espagnol) ) )

    (SI ( (langue espagnol) (continent amerique) ) ALORS ( (pays argentine)(pays chili)(pays colombie)(pays equateur)(pays mexique) ) )

    (SI ( (pays bresil) (branche GI) ) ALORS ((univ universidade_caxias_do_sul)))

    (SI ((> place 6) (<= place 12) (> %_A/B 30) (<= %_A/B  60)) ALORS ((accessibilite moyenne)) )

### Base de faits
La base de faits est la seule base qui va être modifiée au cours du déroulement de notre système expert. Au départ elle contient :
la branche de l’étudiant
les UVs de langues qu’il a validés au cours des différents semestres
le (ou les) continent dans lequel il souhaite partir
son pourcentage de notes A/B
son pourcentage de notes E/FX/F

Voici un exemple de base de faits au début du programme :
    
    (defparameter *BF* '( (langue francais) (branche GI) (uvValidee LA13) (uvValidee LG62) (continent asie) (%_A/B 80) (%_E/F 10)))

Au fur et à mesure les règles viennent ajouter des faits dans cette base comme les langues maitrisées, les pays et les universités où un départ est possible.

### Base de données universités
C’est dans cette base que toutes les informations sur chaque université partenaire sont recensées. On peut y trouver le pays, la ville et le nombre de places disponibles dans chaque université pour les étudiants étranger souhaitant faire un semestre d’échange. Ces informations seront recoupées avec les universités présentes dans la base de faits au cours de l’affichage.

    ( (pays bresil) (ville caxias_do_sul) (univ universidade_caxias_do_sul) (branche GI) (places 5) )


## Implémentation


### Fonctions de services 
    premisse (regle) -> revoie les prémisses d’une règle

    conclusion (regle) -> renvoie les conclusions d’une règle

    pays, nbplace, %AB, %EF ->renvoie les informations recherchées dans la bf ou dans la base d’universités.

    depart_possible? -> determine si le départ à l’étranger est possible ou non au vu du pourcentage de E/FX/F aux UVs

    high_level -> determine si un étudiant a accès aux universités « high-level » (USA, Canada, Suede, Singapour) au vu du pourcentage de A/B aux UVs



### Fonctions règle candidates / action règle
    regle_candidate (regle) -> vérifie si toutes les premisses de la règle sont présentes dans la base de faits.  Cette fonction vérifie également que les conclusions de la règle ne sont pas déjà toutes dans la base de faits (cela voudrait dire que la règle a déjà été appliquée). Si toutes ces conditions sont respectées la règle est alors une règle candidate.

    Action_regle (regle) -> applique la règle en ajoutant chacune de ses conclusions à la base de faits si elle n’y est pas déjà.

    Fonctions accessibilité / affichage
    accessibilité (univBF *bf*) -> parcourt les règles concernant l’accessibilité des universités en fonction du nombre de places disponibles et du pourcentage de notes A/B obtenues par l’étudiant. Cette fonction renvoie un couple attribut-valeur parmi les trois suivants : (accessibilite dure) ; (accessibilite moyenne) ; (accessibilite facile)

    affichage () -> dans un premier temps, la fonction va regrouper tous les noms d’universités où un départ est possible pour l’étudiant et va associer ces noms à leurs informations (ville, pays, nombre de places …) présentes dans la base d’universités. Dans un second temps la fonction va associer un niveau d’accessibilité pour chaque université possible grace à la fonction accessibilité. Enfin nous enlevons les universités dont les pays font partis de la liste des pays « high level » .Pour finir, la fonction renvoie la liste -résultat des universités pour lesquelles le départ est possible.



### Moteur d’inférence
Le moteur va en premier lieu tester si le départ est possible, si ce n’est pas le cas le système affiche un message d’erreur indiquant que le depart est impossible et termine le programme. 

Ensuite le moteur parcours la base de règle en testant si chaque règle est candidate, si c’est le cas on applique la fonction action règle et les conclusions sont ajoutées à la base de faits.

Lorsqu’il n’y a plus aucune règle applicable on sort de la boucle qui parcourt la BR et on appelle la fonction d’affichage.

Enfin on affiche toutes les universités où l’étudiant peut être candidat au vu de son parcours scolaire.

## Mise en Pratique détaillée
Prenons l’exemple d’un étudiant ayant validé les niveaux 2 de chinois (LG62 ) et  3 d’anglais (LA13) souhaitant partir en  Asie ou en Oceanie.

La base de fait est la suivante :

    (defparameter *BF* '( (langue francais) (branche GI) (uvValidee LA13) (uvValidee LG62) (continent asie) (continent oceanie) (%_A/B 40) (%_E/F 10))

Le départ est possible car le pourcentage des notes E et F est inférieur au 25% maximum.

Lors du parcours de la base de règles, à partir des fait, de nouveaux faits les sont ajoutés dans la BF :
    (uvValidee LA13) ==> (langue anglais)
	  (uvValidee LG62) ==> (langue chinois) 

	  (langue anglais) et (continent asie) ==> ((pays taiwan) (pays singapour) (pays coree) (pays japon))
	  (langue anges) et (continent océanie) ==> ((pays australie))
	  (langue chinois) et (continent asie) ==> ((pays chine) (pays singapour) (pays taiwan))
A l’issu de l’application de cette règle, seule la chine est ajoutée car les autres conclusions se trouvent déjà dans la BF 

	  (pays taiwan) et (branche GI) ==> (UNIV NATIONAL_CHIAO_TUNG_UNIVERSITY)
	  (pays chine) et (branche GI) ==> (UNIV TIANJIN_UNIVERSITY_TECHNOLOGY)
On applique le raisonnement pour chaque pays

A partir du pourcentage AB, on en déduit :

que l’étudiant ne peut pas accéder aux universités « High Level »  donc on retire ces universités de la liste des départs possibles.

l’accessibilité de chaque université et on la lui ajoute

Au finale la liste suivante est renvoyée :

    ((ACCESSIBILITE MOYENNE) (PAYS TAIWAN) (VILLE HSINCHU) (UNIV NATIONAL_CHIAO_TUNG_UNIVERSITY) (BRANCHE GI) (PLACES 3)) 
    ((ACCESSIBILITE MOYENNE) (PAYS CHINE) (VILLE TIANJIN) (UNIV TIANJIN_UNIVERSITY_TECHNOLOGY) (BRANCHE GI) (PLACES 3)) 
    ((ACCESSIBILITE MOYENNE) (PAYS JAPON) (VILLE WAKAYAMA) (UNIV WAKAYAMA_UNIVERSITY) (BRANCHE GI) (PLACES 1)) 
    ((ACCESSIBILITE MOYENNE) (PAYS JAPON) (VILLE SHIGA) (UNIV RITSUMEIKAN_UNIVERSITY) (BRANCHE GI) (PLACES 1)) 
    ((ACCESSIBILITE MOYENNE) (PAYS JAPON) (VILLE CHIBA) (UNIV CHIBA_UNIVERSITY) (BRANCHE GI) (PLACES 2)) 
    ((ACCESSIBILITE MOYENNE) (PAYS JAPON) (VILLE CHIBA) (UNIV CHIBA_INSTITUTE_OF_TECHNOLOGY) (BRANCHE GI) (PLACES 5)) 
    ((ACCESSIBILITE MOYENNE) (PAYS COREE) (VILLE SEOUL) (UNIV HANYANG_UNIVERSITY) (BRANCHE GI) (PLACES 2)) 
    ((ACCESSIBILITE MOYENNE) (PAYS COREE) (VILLE POHANG) (UNIV POHANG_UNIVERSITY_OF_SCIENCE_AND_TECHNOLOGY) (BRANCHE GI)
     (PLACES 5)) 
    ((ACCESSIBILITE MOYENNE) (PAYS AUSTRALIE) (VILLE VISTORIA) (UNIV SWINBURNE_UNIVERSITY_OF_TECHNOLOGY) (BRANCHE GI)
     (PLACES 2))
     
## Conclusion

	Au cours de ce TP nous avons voulu concevoir un système expert qui pourrait nous être utile en tant qu’étudiantes à l’UTC. Toutes deux très intéressées par un départ à l’étranger nous avons décidé de concevoir un système d’aide à la décision du choix de destinations pour un semestre à l’étranger. 

Nous avons implémenté notre moteur en chainage avant car cela nous a semblé plus approprié à la réalité. En effet de manière générale, lorsqu’on souhaite partir à l’étranger nous n’avons pas vraiment connaissance de l’ensemble des universités possibles et donc nos envies sont peu précises : « j’aimerais partir sur tel continent » et non pas «  j’aimerais partir dans telle université ». Toutefois, il aurait aussi été possible d’aborder ce problème avec un moteur en chainage arrière. Dans ce cas, la base de faits contiendrait les universités visées et le moteur renverrait si le départ est possible ou non pour chaque université.

En guise d’amélioration, notre système pourrait être étendu à toutes les branches de l’UTC; Il suffirait pour cela d’ajouter les universités de départs possibles pour chacune des branches dans la base des universités et dans la base de règles.

En conclusion ce TP nous a permis d’essayer de traiter du mieux possible un problème réel qui peut se poser à tout étudiant utcéen.
