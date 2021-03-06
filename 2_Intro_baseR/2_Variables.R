#############################################################
## Types de donn�es et cr�ation de variables 
## Intro � R/RStudio avril 2020
#############################################################

# Il y a quatre types de donn�es dans R: 
        # 1) num�rique   1 2 3 4 
        # 2) caract�re   "1" "2" "3" "4" "A" "B" "J'aime R"
        # 3) logique     TRUE FALSE FALSE FALSE  note: les majuscules sont essentielles 
        # 4) factoriel   Utilis� par R pour cr�er des cat�gories - enregistre la variable comme une s�rie de niveaux.

# Enregistrer une variable comme factorielle est essentiel pour l'ex�cution de certains mod�lisations (ex.: ANOVA). 
# Par contre, l'utilisation de variables factorielles peut �tre plus capricieux et hors champ pour le pr�sent cours.
# Nous allons donc nous concentrer uniquement sur les trois premiers types. 

# En travaillant avec des donn�es, vous trouverez certainement d'autres types de donn�es qui peuvent �tre pris en charge par R.
# R les impl�mentara en faisant abstraction des 4 types de base. L'exemple le plus common de ces types "autres" serait certainement
# les dates et les variables de temps (heures/minutes/secondes).

# Pour les meilleures pratiques sur la nomenclature des variables (en anglais seulement): https://www.r-bloggers.com/r-code-best-practices/



## 1. Cr�er une variable 
# Remarquez, au fur et � mesure que vous ex�cutez les lignes de code suivantes, que la fen�tre "Global Environment" � droite
# se met automatiquement � jour. 

y =  23  # l'utilisation de = indique une cr�ation de variable, et non une demande de validation (==, op�rateur logique)
y <- 23  # plusieurs utilisateurs de R pr�f�rent la notation <- pour d�finir les variables. 
         # Raccourci clavier pour <- : ALT -  


## 2. Consid�rations pour les noms de variables et d'objets

# � l'exception de certaines contraintes, vous pouvez nommer votre objet ou variable tel qu'il vous pla�t.
# R est tr�s sensible � la casse (majuscules vs minuscules). 
# Par exemple: EXEMPLE, exemple, eXeMpLe seront consid�r�s comme trois variables distinctes. Il est donc important de faire attention � la casse!


# Les noms de variables et d'objets ne peuvent pas: 
        # D�buter avec des chiffres. Notez que les noms peuvent CONTENIR des chiffres. 2019_temp n'est pas valide, tandis que temp_2019 l'est.  
        # D�buter avec un signe de dollar ($), un op�rateur math�matique, ou de la ponctuation. 
        # Il est donc plus simple de d�buter les noms des variables par une lettre!

# Plusieurs programmeurs recommandent d'utiliser un style particulier � un type d'objet particulier en R. Par exemple, tous les noms des 
# bases de donn�es pourraient �tre en minuscules avec les mots s�par�s par un trait de soulignement (ex.: base_de_donnee.csv), et pour 
# les fonctions s�parer les mots par un point (ex.: ma.fonction). 
# Plus vous serez constants dans votre nomenclature, plus il sera facile, pour vous et les autres, de recr�er votre travail! 

# Quelques exemples: 
rstudiointro <- 40      # enti�rement en minuscules
rstudio_intro <- 40     # s�paration avec un trait de soulignement 
rstudio.intro <- 40     # s�paration avec un point (non acceptable en python ou en SAS... pour cette raison, il serait pr�f�rable de ne pas l'utiliser)
RstudioIntro <- 40      # majuscules en d�but de mot ("upper camel case")

4rstudiointro <-6       # ne fonctionnera pas puisque cela d�bute par un nombre. Remarquez l'ic�ne dans la marge! 

# Pour supprimer une variable ou un objet de la m�moire, vous pouvez utiliser la fonction rm()
rm(RstudioIntro) # efface un seul objet ou variable

rm(list = ls()) # efface tous les objets/variables list�s (list = ). la fonction ls(), elle, renvoie � l'ensemble des objets (vecteurs, bases de donn�es, variables)
                # en m�moire. Ainsi, en combinant les deux �l�ments (list = et ls()), on met en liste l'ensemble des objets et ceux-ci seront effac�s. 


# Essayez ce qui suit:

# 1. Attribuer une valeur unique � un objet
mon_nombre = 42  # attribuer une valeur num�rique
 
mon_nom = "Rantanplan"    # attribuer une valeur caract�re
mon_nom = 'Rantanplan'    # noter que R accepte autant les guillements simples que doubles.  



## 2. Attribuer des vecteurs/matrices/listes 
# Les vecteurs combinent plusieurs �l�ments en une seule matrice uni-dimensionnelle
# Ce sont les bases des structures plus complexes de donn�es

# # Il y a deux types de vecteurs: atomique et liste
# Il y a 6 types de vecteurs atomiques:
#        -logique 
#        -num�rique (entier ("integer"), double)
#        -caract�re
#        -complexe (utile pour les fonctions math�matique avanc�es, permet les op�rations sur les nombres imaginaires)
#        -brut (bytes)

# Les listes peuvent �tre compos�es de plusieurs types de donn�es. Les listes sont parfois appel�es des vecteurs r�cursifs puisqu'elles peuvent contenir... d'autres listes.
# Nous verrons un exemple de ceci � la fin de ce script. 


# Dans certains langages de programmation il y a des diff�rences tr�s sp�cifiques dans la structure des donn�es dans les matrices et les vecteurs.
# Ceci �tant hors des besoins de ce cours, nous pourrons pour nos besoin utiliser l'un ou l'autre de ces termes. De plus, pour la vaste
# majorit� du travail en data science ces distinctions n'ont aucune importance.


# 2a. assigner des vecteurs

# La fonction 'c' est utilis�e pour combiner ou concat�ner les �l�ments d'un vecteur.
# Ex�cutez les lignes de code suivantes pour cr�es des vecteurs et les visualiser!

a <- c(1, 2, 3, 4, 5) # vecteur de valeurs num�riques
a                     # cette ligne de code "appelle" l'objet a. Vous en verrez les valeurs appara�tre dans la console
                      # Il n'est pas n�cessaire de r��crire sur une nouvelle ligne pour appeler:
                      # vous n'avez qu'� s�lectionner (surligner? avec la souris ou shift +fl�ches) 
                      # l'objet et ex�cuter.

b <- c("January", "February", "March", "April", "May") # vecteur de valeurs caract�res

c <- c("TRUE", "FALSE", "FALSE", "TRUE", "FALSE") # vecteur de valeurs logiques

ma_liste = c("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000) # notez que la fonction c(), R peut changer le type d'une donn�es afin 
                                                                         # qu'il y ait seulement un type de donn�es dans le vecteur 
ma_liste = c(1, 2,4, 5, "t") # par d�faut, m�me si la majorit� des �l�ments sont num�riques, tous les �l�ments seront convertis en caract�re puisqu'il y a un �l�ment qui est en caract�re

ma_liste = list("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000) # la fonction list(), elle, permet de cr�er un vecteur avec plusieurs types
                        # Dans la fen�tre "Global Environment", cliquez sur ma_liste, vous verrez les types de chaque �l�ment!

length(ma_liste)        # la fonction length() donne le nombre d'�l�ments dans le vecteur
class(ma_liste)         # indique le type de donn�es dominant dans le vecteur



## 2b. Cr�er des s�ries rapido-presto
# Pour cr�er des vecteurs contenant une s�rie de nombres, vous pouvez utiliser l'op�rateur `:`

d <- 11:15   # la fonction c() n'est pas n�cessaire! 
d <- c(11:15) # mais vous pouvez l'utiliser tout de m�me, ceci donnera le m�me r�sultat


# vous pouvez faire le m�me genre de manipulation sur un vecteur compos� de caract�res:
vecteur_lettres <- LETTERS    # cr�e un objet avec toutes les lettres de l'alphabet


### 3. Fonctions et param�tres
# Les fonctions sont des objets qui effectuent des t�ches sp�cifiques�
        # et les param�etres contr�lent ce que font les fonctions

# Les fonctions sont TOUJOURS suivies de parenth�ses, dans lesquelles sont mis les param�tres.
# Nous pouvons utiliser les fonctions seq() et rep() pour rapidement cr�er des vecteurs comportant plusieurs �l�ments.

# seq() est une fonction utiliser pour cr�er une s�quence
ma_s�rie <- seq(1,8)    # La fonction de base permet de d�finir le d�but et la fin de la s�quence. �
                        # Les param�tres <1, 8> indique � la fonction de faire une s�quence de 1 � 8 contenant chaque �l�ment. L'intervalle par d�faut entre les �l�ments est 1
ma_s�rie <- seq(1,8,1)  # Ici, nous rajoutons un param�tre: l'intervalle. Comme l'intervalle est le m�me que l'intervalle de d�faut, 
                        # le r�sultat sera identique que ce qui a �t� g�n�r� sur la ligne pr�c�dente.
ma_s�rie <- seq(1,8,2) # Ici, le dernier param�tre (l'intervalle) indique � la fonction de prendre seulement un �l�ment sur 2.

# rep() est aussi une fonction pour cr�er une s�quence, mais de r�p�tition.
ma_r�p�te <- rep(2, 10) # la fonction rep() n�cessite 2 arguments.
                        # Le premier est l'�l�ment � �tre r�p�t�, et le deuxi�me le nombre de r�p�titions.

# On peut inclure de telles fonctions � l'int�rieur de d'autres fonctions:
my_ech_aleatoire <- sample(seq(1,100), 2, replace = F)  # Ici, la fonction sample() (�chantillon!) prend comme premier argument la fonction s�quence (de 1 � 100)
                                                        # et choisit, sans remplacement (replace = F), 2 �l�ments de la s�quence                 

# Besoin d'aide? R a d'excellents modules d'aide. Vous pouvez facilement demander de l'aide sur les diff�rentes fonctions et leurs param�tres,
# simplement en mettant un point d'interrogation devant le nom de la s�quence.
# Ex�cutez chaque ligne, et voyez le mod�le d'aide appara�tre dans la fen�tre en bas � droite.

?seq
?rep
?mean
?sample


# 4. Fonctions et op�rations sur des vecteurs: 
# Certaines fonctions peuvent �tre appliqu�es sur les vecteurs:

# Combien y a-t-il d'�l�ments dans ma_liste?
ma_liste = c("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000)

length(ma_liste) # la fonction length (nous l'avons vue plus haut!) indique le nombre d'�l�ments dans un vecteur


# 4a) Fonctions et op�rations sur des vecteurs compos�s de valeurs num�riques
# Lorsque nous effecuons une op�ration sur un vecteur num�rique, elle sera appliqu�e sur TOUS les �l�ments du vecteur. 
# R d�montre ainsi son caract�re "programmatique" vs alg�brique. R utilise des op�rations vectorielles et effectue les op�rations au niveau des �l�ments individuels.
# Ceci devient un r�el avantage lors des op�rations sur nos variables.
# Des op�rations peuvent aussi �tre faites sur des vecteurs de caract�remes. Nous verrons des exemples de ceci dans la section 5 (plus bas).

d <- c(11:15)   # cr�ation de l'objet (vecteur) d, comprenant les nombres entiers de 11 � 15
a <- c(1:5)     # cr�ation de l'objet (vecteur) a, comprenant les nombres entiers de 1 � 5

d-2     # une soustraction sera faite sur chaque �l�ment de d... r�sultats dans la console
d       # notez par contre, en ex�cutant cette ligne, que l'op�ration que l'on vient de faire NE MODIFIE PAS l'objet d puisque nous n'avons
        # pas utilis� = ou <- 
d*3     # chaque �l�ment sera multipli� par 3, et encore une fois ceci ne modifiera pas l'objet d en soit
a*d     # ceci multipliera les �l�ments de a par les �l�ments de d (le prmier par le premier, le deuxi�me par le deuxi�me, etc.)

e <- c(1:2)
d*e     # et si on essaye de faire une op�ration sur  2 vecteurs avec un nombre d'�l�ments diff�rents? d*e ne fonctionnera pas, puisque le nombre d'�l�ments 
        # dans d n'est pas un multiple du nombre d'�l�ment dans e - et vice-versa.

f <- 2
d*f     # ceci va fonctionner, puisque 5 (nombre d'�l�ments dans d) est un multiple de 1 (nombre d'�l�ments dans f)

g <- c(1:10)
d*g     # ceci va �galement fonctionner. Voyez le r�sultat! Les �l�ments de d sont "repris" d�s le 6�me �l�ment de g.


# 4b) Op�rations sur des vecteurs de type caract�re

mes_lettres = c("a", "B", "c", "D", 5)  # on cr�e un vecteur avec quelques lettres majuscules, quelques lettres minuscules... �
                                        # et un chiffre (qui sera chang� en caract�re vu l'utilisation de c() pour cr�er le vecteur)

mes_lettres = tolower(mes_lettres)      # tolower() modifie tous les �l�ments pour qu'ils deviennent en minuscules

tes_lettres = toupper(mes_lettres)      # toupper() modifie tous les �l�ments pour qu'ils deviennent en majuscules

mes_lettres = paste("22", mes_lettres, sep = "-") # paste colle (joint) ensemble les objets des vecteurs caract�res selon l'ordre dans le vecteur
                                                                                
toutes_lettres = paste(mes_lettres,tes_lettres, sep = "-") # contrairement aux vecteurs num�riques, le nombre d'objets n'est pas un facteur limitant
                                        # dans la cr�ation du nouvel objet mais il vaut mieux valider les r�sultats

ma_liste = c("ma", "petite", "vache", "a", "mal", "aux", "pattes", 1000)

grep("mal", ma_liste) # grep retourne la position (l'index) de l'objet �quivalent

strsplit("Achille Talon"," ") #strsplit divise un objet caract�re bas� sur un caract�re sp�cifique



# 4c. Op�rations sur des vecteurs d'objets logiques
# R�gle g�n�rale, effectuer des op�rations math�matiques avec des TRUE (vrai) et FALSE (false) ne fonctionne pas. 
# Mais R utilise des r�gles pour que �a devienne possible.
# Ces r�gles transforment "de force" les TRUEs en 1 et les FALSEs en 0. Attention: les r�gles ne transforment l'objet d'origine, 
# la transformation est temporaire et uniquement pour les besoins du calcul.
# Ainsi, cette transformation temporaire permet de faire des calculs.

# Si j'additionne vrai + vrai, R fait la conversion et on peut faire le calcul : 1 + 1 = 2.
# Si j'additionne vrai + faux, on obtient 1 puisque vrai (1) + faux (0) = 0. 
# On voit que l'on peut faire une fonction telle que sum() sur des vecteurs logiques. Cette derni�re permettrait entre autres de savoir
# il y a combien de TRUE dans un vecteur puisque chaque VRAI sera 1 et seront additionn�, tandis que les FALSE seront des 0 et n'affecteront
# pas la somme.
 
vec_logique = c(TRUE, FALSE)

vec_logique2 = c(TRUE, FALSE)

vec_logique3 = c(FALSE, TRUE)

vec_logique + vec_logique2
vec_logique + vec_logique3


# MAT�RIEL EN BONUS #
# Encore plus sur les listes: trempons l'orteil dans le monde de la mod�lisation :) 
# Cr��ons une trame de donn�es (dataframe) de deux colonnes ("a" et "b") num�riques. De telles trames sont en fait une collection de listes.
# Nous allons utiliser la fonction data.frame()!
d <- data.frame(a=11:13, b=21:23) # cr�ation de la trame       
is.list(d) # TRUE                 # v�rification que l'objet d est une liste... et oui!
is.data.frame(d)                  # v�rification que l'objet d est AUSSI une trame de donn�es... et oui!
str(d)                            # la fonction str() donne la STRucture d'une trame de donn�es : colonnes (variables), type, et les premi�res valeurs.

m <- lm(a ~ b, data=d) # la fonction lm() cr�era la ligne de meilleur ajustement (r�gression lin�aire) entre a et b de la trame d

# Dans SAS, le r�sultat ("output") de la mod�lisation peut �tre enregistr�e � un objet ou �tre imprim�e imm�diatement. C'est la m�me chose en R.
# Ici, nous avons opt� pour enregistrer le r�sultat dans l'objet m.

is.list(m) # TRUE
m       # appeler m montre les infos de base du mod�le. Mais, pour avoir acc�s � encore plus d'information sur le mod�le, 
        # on peut utiliser la fonction str().
str(m)

attributes(m$coefficients)      # Pour obtenir les noms de deux �l�ments cruciaux (coefficients) de la r�gression
m$coefficients["(Intercept)"]   # L'utilisation des [] indique que nous voulons EXTRAIRE l'information. Donc, ici, nous voulons
                                # extraire l'information sur le coefficient appel� "(Intercept)" (y � l'origine!)
m$coefficients["b"]             # Ici, nous voulons extraire l'information sur le coefficient nomm� "b", c'est � dire la pente de la droite

