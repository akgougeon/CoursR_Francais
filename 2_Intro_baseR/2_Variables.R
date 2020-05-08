#############################################################
## Types de données et création de variables 
## Intro à R/RStudio avril 2020
#############################################################

# Il y a quatre types de données dans R: 
        # 1) numérique   1 2 3 4 
        # 2) caractère   "1" "2" "3" "4" "A" "B" "J'aime R"
        # 3) logique     TRUE FALSE FALSE FALSE  note: les majuscules sont essentielles 
        # 4) factoriel   Utilisé par R pour créer des catégories - enregistre la variable comme une série de niveaux.

# Enregistrer une variable comme factorielle est essentiel pour l'exécution de certains modèlisations (ex.: ANOVA). 
# Par contre, l'utilisation de variables factorielles peut être plus capricieux et hors champ pour le présent cours.
# Nous allons donc nous concentrer uniquement sur les trois premiers types. 

# En travaillant avec des données, vous trouverez certainement d'autres types de données qui peuvent être pris en charge par R.
# R les implémentara en faisant abstraction des 4 types de base. L'exemple le plus common de ces types "autres" serait certainement
# les dates et les variables de temps (heures/minutes/secondes).

# Pour les meilleures pratiques sur la nomenclature des variables (en anglais seulement): https://www.r-bloggers.com/r-code-best-practices/



## 1. Créer une variable 
# Remarquez, au fur et à mesure que vous exécutez les lignes de code suivantes, que la fenêtre "Global Environment" à droite
# se met automatiquement à jour. 

y =  23  # l'utilisation de = indique une création de variable, et non une demande de validation (==, opérateur logique)
y <- 23  # plusieurs utilisateurs de R préfèrent la notation <- pour définir les variables. 
         # Raccourci clavier pour <- : ALT -  


## 2. Considérations pour les noms de variables et d'objets

# À l'exception de certaines contraintes, vous pouvez nommer votre objet ou variable tel qu'il vous plaît.
# R est très sensible à la casse (majuscules vs minuscules). 
# Par exemple: EXEMPLE, exemple, eXeMpLe seront considérés comme trois variables distinctes. Il est donc important de faire attention à la casse!


# Les noms de variables et d'objets ne peuvent pas: 
        # Débuter avec des chiffres. Notez que les noms peuvent CONTENIR des chiffres. 2019_temp n'est pas valide, tandis que temp_2019 l'est.  
        # Débuter avec un signe de dollar ($), un opérateur mathématique, ou de la ponctuation. 
        # Il est donc plus simple de débuter les noms des variables par une lettre!

# Plusieurs programmeurs recommandent d'utiliser un style particulier à un type d'objet particulier en R. Par exemple, tous les noms des 
# bases de données pourraient être en minuscules avec les mots séparés par un trait de soulignement (ex.: base_de_donnee.csv), et pour 
# les fonctions séparer les mots par un point (ex.: ma.fonction). 
# Plus vous serez constants dans votre nomenclature, plus il sera facile, pour vous et les autres, de recréer votre travail! 

# Quelques exemples: 
rstudiointro <- 40      # entièrement en minuscules
rstudio_intro <- 40     # séparation avec un trait de soulignement 
rstudio.intro <- 40     # séparation avec un point (non acceptable en python ou en SAS... pour cette raison, il serait préférable de ne pas l'utiliser)
RstudioIntro <- 40      # majuscules en début de mot ("upper camel case")

4rstudiointro <-6       # ne fonctionnera pas puisque cela débute par un nombre. Remarquez l'icône dans la marge! 

# Pour supprimer une variable ou un objet de la mémoire, vous pouvez utiliser la fonction rm()
rm(RstudioIntro) # efface un seul objet ou variable

rm(list = ls()) # efface tous les objets/variables listés (list = ). la fonction ls(), elle, renvoie à l'ensemble des objets (vecteurs, bases de données, variables)
                # en mémoire. Ainsi, en combinant les deux éléments (list = et ls()), on met en liste l'ensemble des objets et ceux-ci seront effacés. 


# Essayez ce qui suit:

# 1. Attribuer une valeur unique à un objet
mon_nombre = 42  # attribuer une valeur numérique
 
mon_nom = "Rantanplan"    # attribuer une valeur caractère
mon_nom = 'Rantanplan'    # noter que R accepte autant les guillements simples que doubles.  



## 2. Attribuer des vecteurs/matrices/listes 
# Les vecteurs combinent plusieurs éléments en une seule matrice uni-dimensionnelle
# Ce sont les bases des structures plus complexes de données

# # Il y a deux types de vecteurs: atomique et liste
# Il y a 6 types de vecteurs atomiques:
#        -logique 
#        -numérique (entier ("integer"), double)
#        -caractère
#        -complexe (utile pour les fonctions mathématique avancées, permet les opérations sur les nombres imaginaires)
#        -brut (bytes)

# Les listes peuvent être composées de plusieurs types de données. Les listes sont parfois appelées des vecteurs récursifs puisqu'elles peuvent contenir... d'autres listes.
# Nous verrons un exemple de ceci à la fin de ce script. 


# Dans certains langages de programmation il y a des différences très spécifiques dans la structure des données dans les matrices et les vecteurs.
# Ceci étant hors des besoins de ce cours, nous pourrons pour nos besoin utiliser l'un ou l'autre de ces termes. De plus, pour la vaste
# majorité du travail en data science ces distinctions n'ont aucune importance.


# 2a. assigner des vecteurs

# La fonction 'c' est utilisée pour combiner ou concaténer les éléments d'un vecteur.
# Exécutez les lignes de code suivantes pour crées des vecteurs et les visualiser!

a <- c(1, 2, 3, 4, 5) # vecteur de valeurs numériques
a                     # cette ligne de code "appelle" l'objet a. Vous en verrez les valeurs apparaître dans la console
                      # Il n'est pas nécessaire de réécrire sur une nouvelle ligne pour appeler:
                      # vous n'avez qu'à sélectionner (surligner? avec la souris ou shift +flèches) 
                      # l'objet et exécuter.

b <- c("January", "February", "March", "April", "May") # vecteur de valeurs caractères

c <- c("TRUE", "FALSE", "FALSE", "TRUE", "FALSE") # vecteur de valeurs logiques

ma_liste = c("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000) # notez que la fonction c(), R peut changer le type d'une données afin 
                                                                         # qu'il y ait seulement un type de données dans le vecteur 
ma_liste = c(1, 2,4, 5, "t") # par défaut, même si la majorité des éléments sont numériques, tous les éléments seront convertis en caractère puisqu'il y a un élément qui est en caractère

ma_liste = list("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000) # la fonction list(), elle, permet de créer un vecteur avec plusieurs types
                        # Dans la fenêtre "Global Environment", cliquez sur ma_liste, vous verrez les types de chaque élément!

length(ma_liste)        # la fonction length() donne le nombre d'éléments dans le vecteur
class(ma_liste)         # indique le type de données dominant dans le vecteur



## 2b. Créer des séries rapido-presto
# Pour créer des vecteurs contenant une série de nombres, vous pouvez utiliser l'opérateur `:`

d <- 11:15   # la fonction c() n'est pas nécessaire! 
d <- c(11:15) # mais vous pouvez l'utiliser tout de même, ceci donnera le même résultat


# vous pouvez faire le même genre de manipulation sur un vecteur composé de caractères:
vecteur_lettres <- LETTERS    # crée un objet avec toutes les lettres de l'alphabet


### 3. Fonctions et paramètres
# Les fonctions sont des objets qui effectuent des tâches spécifiquesà
        # et les paramèetres contrôlent ce que font les fonctions

# Les fonctions sont TOUJOURS suivies de parenthèses, dans lesquelles sont mis les paramètres.
# Nous pouvons utiliser les fonctions seq() et rep() pour rapidement créer des vecteurs comportant plusieurs éléments.

# seq() est une fonction utiliser pour créer une séquence
ma_série <- seq(1,8)    # La fonction de base permet de définir le début et la fin de la séquence. à
                        # Les paramètres <1, 8> indique à la fonction de faire une séquence de 1 à 8 contenant chaque élément. L'intervalle par défaut entre les éléments est 1
ma_série <- seq(1,8,1)  # Ici, nous rajoutons un paramètre: l'intervalle. Comme l'intervalle est le même que l'intervalle de défaut, 
                        # le résultat sera identique que ce qui a été généré sur la ligne précédente.
ma_série <- seq(1,8,2) # Ici, le dernier paramètre (l'intervalle) indique à la fonction de prendre seulement un élément sur 2.

# rep() est aussi une fonction pour créer une séquence, mais de répétition.
ma_répète <- rep(2, 10) # la fonction rep() nécessite 2 arguments.
                        # Le premier est l'élément à être répété, et le deuxième le nombre de répétitions.

# On peut inclure de telles fonctions à l'intérieur de d'autres fonctions:
my_ech_aleatoire <- sample(seq(1,100), 2, replace = F)  # Ici, la fonction sample() (échantillon!) prend comme premier argument la fonction séquence (de 1 à 100)
                                                        # et choisit, sans remplacement (replace = F), 2 éléments de la séquence                 

# Besoin d'aide? R a d'excellents modules d'aide. Vous pouvez facilement demander de l'aide sur les différentes fonctions et leurs paramètres,
# simplement en mettant un point d'interrogation devant le nom de la séquence.
# Exécutez chaque ligne, et voyez le modèle d'aide apparaître dans la fenêtre en bas à droite.

?seq
?rep
?mean
?sample


# 4. Fonctions et opérations sur des vecteurs: 
# Certaines fonctions peuvent être appliquées sur les vecteurs:

# Combien y a-t-il d'éléments dans ma_liste?
ma_liste = c("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000)

length(ma_liste) # la fonction length (nous l'avons vue plus haut!) indique le nombre d'éléments dans un vecteur


# 4a) Fonctions et opérations sur des vecteurs composés de valeurs numériques
# Lorsque nous effecuons une opération sur un vecteur numérique, elle sera appliquée sur TOUS les éléments du vecteur. 
# R démontre ainsi son caractère "programmatique" vs algébrique. R utilise des opérations vectorielles et effectue les opérations au niveau des éléments individuels.
# Ceci devient un réel avantage lors des opérations sur nos variables.
# Des opérations peuvent aussi être faites sur des vecteurs de caractèremes. Nous verrons des exemples de ceci dans la section 5 (plus bas).

d <- c(11:15)   # création de l'objet (vecteur) d, comprenant les nombres entiers de 11 à 15
a <- c(1:5)     # création de l'objet (vecteur) a, comprenant les nombres entiers de 1 à 5

d-2     # une soustraction sera faite sur chaque élément de d... résultats dans la console
d       # notez par contre, en exécutant cette ligne, que l'opération que l'on vient de faire NE MODIFIE PAS l'objet d puisque nous n'avons
        # pas utilisé = ou <- 
d*3     # chaque élément sera multiplié par 3, et encore une fois ceci ne modifiera pas l'objet d en soit
a*d     # ceci multipliera les éléments de a par les éléments de d (le prmier par le premier, le deuxième par le deuxième, etc.)

e <- c(1:2)
d*e     # et si on essaye de faire une opération sur  2 vecteurs avec un nombre d'éléments différents? d*e ne fonctionnera pas, puisque le nombre d'éléments 
        # dans d n'est pas un multiple du nombre d'élément dans e - et vice-versa.

f <- 2
d*f     # ceci va fonctionner, puisque 5 (nombre d'éléments dans d) est un multiple de 1 (nombre d'éléments dans f)

g <- c(1:10)
d*g     # ceci va également fonctionner. Voyez le résultat! Les éléments de d sont "repris" dès le 6ème élément de g.


# 4b) Opérations sur des vecteurs de type caractère

mes_lettres = c("a", "B", "c", "D", 5)  # on crée un vecteur avec quelques lettres majuscules, quelques lettres minuscules... à
                                        # et un chiffre (qui sera changé en caractère vu l'utilisation de c() pour créer le vecteur)

mes_lettres = tolower(mes_lettres)      # tolower() modifie tous les éléments pour qu'ils deviennent en minuscules

tes_lettres = toupper(mes_lettres)      # toupper() modifie tous les éléments pour qu'ils deviennent en majuscules

mes_lettres = paste("22", mes_lettres, sep = "-") # paste colle (joint) ensemble les objets des vecteurs caractères selon l'ordre dans le vecteur
                                                                                
toutes_lettres = paste(mes_lettres,tes_lettres, sep = "-") # contrairement aux vecteurs numériques, le nombre d'objets n'est pas un facteur limitant
                                        # dans la création du nouvel objet mais il vaut mieux valider les résultats

ma_liste = c("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000)

grep("mal", ma_liste) # grep retourne la position (l'index) de l'objet équivalent

strsplit("Achille Talon"," ") #strsplit divise un objet caractère basé sur un caractère spécifique



# 4c. Opérations sur des vecteurs d'objets logiques
# Règle générale, effectuer des opérations mathématiques avec des TRUE (vrai) et FALSE (false) ne fonctionne pas. 
# Mais R utilise des règles pour que ça devienne possible.
# Ces règles transforment "de force" les TRUEs en 1 et les FALSEs en 0. Attention: les règles ne transforment l'objet d'origine, 
# la transformation est temporaire et uniquement pour les besoins du calcul.
# Ainsi, cette transformation temporaire permet de faire des calculs.

# Si j'additionne vrai + vrai, R fait la conversion et on peut faire le calcul : 1 + 1 = 2.
# Si j'additionne vrai + faux, on obtient 1 puisque vrai (1) + faux (0) = 0. 
# On voit que l'on peut faire une fonction telle que sum() sur des vecteurs logiques. Cette dernière permettrait entre autres de savoir
# il y a combien de TRUE dans un vecteur puisque chaque VRAI sera 1 et seront additionné, tandis que les FALSE seront des 0 et n'affecteront
# pas la somme.
 
vec_logique = c(TRUE, FALSE)

vec_logique2 = c(TRUE, FALSE)

vec_logique3 = c(FALSE, TRUE)

vec_logique + vec_logique2
vec_logique + vec_logique3


# MATÉRIEL EN BONUS #
# Encore plus sur les listes: trempons l'orteil dans le monde de la modélisation :) 
# Crééons une trame de données (dataframe) de deux colonnes ("a" et "b") numériques. De telles trames sont en fait une collection de listes.
# Nous allons utiliser la fonction data.frame()!
d <- data.frame(a=11:13, b=21:23) # création de la trame       
is.list(d) # TRUE                 # vérification que l'objet d est une liste... et oui!
is.data.frame(d)                  # vérification que l'objet d est AUSSI une trame de données... et oui!
str(d)                            # la fonction str() donne la STRucture d'une trame de données : colonnes (variables), type, et les premières valeurs.

m <- lm(a ~ b, data=d) # la fonction lm() créera la ligne de meilleur ajustement (régression linéaire) entre a et b de la trame d

# Dans SAS, le résultat ("output") de la modélisation peut être enregistrée à un objet ou être imprimée immédiatement. C'est la même chose en R.
# Ici, nous avons opté pour enregistrer le résultat dans l'objet m.

is.list(m) # TRUE
m       # appeler m montre les infos de base du modèle. Mais, pour avoir accès à encore plus d'information sur le modèle, 
        # on peut utiliser la fonction str().
str(m)

attributes(m$coefficients)      # Pour obtenir les noms de deux éléments cruciaux (coefficients) de la régression
m$coefficients["(Intercept)"]   # L'utilisation des [] indique que nous voulons EXTRAIRE l'information. Donc, ici, nous voulons
                                # extraire l'information sur le coefficient appelé "(Intercept)" (y à l'origine!)
m$coefficients["b"]             # Ici, nous voulons extraire l'information sur le coefficient nommé "b", c'est à dire la pente de la droite

