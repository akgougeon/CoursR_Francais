#############################################################
## Extraction des bases de donn�es
## Intro � R/RStudio Avril 2020
#############################################################


# Tout comme pour les vecteurs, l'extraction de colonnes et de rang�es d'une base de donn�es se fait par les positions (index)
# https://www.statmethods.net/management/subset.html (en anglais seulement)

# D�butons par regarder la structure de la base de donn�es airquality: 
str(airquality)

# Partie 1. Extraire des colonnes et des rang�es
# Tout comme pour les vecteurs, nous devons utiliser les [] pour indiquer que nous voulons extraire ces �l�ments.
# � l'int�rieur des [], le premier index indique quelles RANG�ES extraire et le second quelles COLONNES extraire.
# Notez que lorsqu'aucun index n'est sp�cifi� l'ensemble des colonnes et rang�es sont extraites.

airquality[ , ] # [rang�e, colonne]




# Question de se simplifier la vie, assignons la base de donn�es int�gr�e airquality � un objet.
# Ainsi, nous pourrons la voir dans notre fen�tre Global Environment.
airquality = airquality

# Partie 2, 
# Selectionner (donc conserver) des Variables
airquality[1] # un seul index s�lectionne une COLONNE (ben oui, m�me si le premier index lorsqu'il y en a 2 c'est les rang�es!)
airquality["Wind"] # On peut aussi extraire une colonne en utilisant son nom et non son index
airquality$Ozone # Une deuxi�me m�thode d'extraction par nom: l'utilisation de $. Pratique lorsqu'on ne veut qu'une seule colonne, 
                 # pas mal moins pour extraire plusieurs colonnes!

airquality[1:4] # on peut aussi extraire une s�rie de colonnes
airquality[c("Wind", "Temp")] # Ou, si l'on veut utiliser les noms des colonnes, on peut les extraire en utilisant un vecteur
                              # Notez l'utilisation de la fonction c()

colnames(airquality) # remarquez que l'extraction en elle-m�me (c'est-�-dire sans assignation avec = ou <-) n'affecte pas
                     # la structure de l'objet d'origine


# Assigner � un nouvel objet
mes_vars = c("Wind","Temp") # Ici, nous assignons � un objet (mes_vars) les NOMS des variables (et pas les valeurs elles-m�mes)
                            # Notez qu'il n'y a aucune r�f�rence � airquality!
                            # Nous ne faisons que cr�er un vecteur, qui pourra �tre utilis� pour l'extraction.

test1 <- airquality[mes_vars] # On peut utiliser le vecteur pour extraire
test2 <-  airquality[c("Wind", "Temp")] # � notre que l'on obtient le m�me r�sultat sans cr�er de vecteur.
                                        # Mais le vecteur peut �tre utile plus tard... vous verrez!


airquality[1:3, c("Wind","Temp")] # On peut bien s�r sp�cifier quelles rang�es nous voulons, il suffit de les indiquer au d�but!



# Exclure des Variables
mes_vars2 <- colnames(airquality) %in% mes_vars
        # L'op�rateur %in% est utilis� pour identifier si un �l�ment appartient � un vecteur.
        # Ainsi, la ligne de code plus haut retourner un objet logique (une s�rie de TRUE et FALSE),
        # dont chaque TRUE ou FALSE fait r�f�rence � chaque colonne d'airquality et indiquera, si, 
        # TRUE or FALSE, elles se trouvent dans l'objet mes_vars

test3 <- airquality[1:3,!mes_vars2]
        # L'utilisation du point d'exclamation (!) devant la d�signation des colonnes dans cette ligne de code
        # indique que nous voulons EXCLURE ces colonnes.

# L'exclusion peut aussi �tre indiqu�e avec le signe moins (-). Ici nous excluons la 3�me et la 5�me colonne
test4 <- airquality[c(-3,-5)] # premi�re m�thode
test5 <- airquality[-c(3,5)]  # deuxi�me m�thode


# Effacer les variables
airquality2 <- airquality # cr�ation d'une nouvelle version compl�te d'airquality, question de garder l'original!
airquality2$Temp <- airquality2$Ozone <- NULL # l'utilisation de NULL indique que nous voulons EFFACER une variable


# Partie 3. S�lectionner des rang�es

# Cinq premi�res observations
test6 <- airquality2[1:5,]
    # Ici, nous voulons s�lectionner toutes les colonnes, et seulement sp�cifier des rang�es.
    # Puisque lorsqu'un seul index r�f�re aux colonnes, nous pouvons tout de m�me indiquer les rang�es
    # et rajouter une virgule pour indiquer que nous voulons conserver l'ensemble des colonnes.


# Bas� sur la valeur des variables. La fonction which() retourne la position (index) des �l�ments 
test7 <- airquality[ which(airquality$Month == 5
        & airquality$Temp > 65), ]


