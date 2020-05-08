#############################################################
## Extraction des bases de données
## Intro à R/RStudio Avril 2020
#############################################################


# Tout comme pour les vecteurs, l'extraction de colonnes et de rangées d'une base de données se fait par les positions (index)
# https://www.statmethods.net/management/subset.html (en anglais seulement)

# Débutons par regarder la structure de la base de données airquality: 
str(airquality)

# Partie 1. Extraire des colonnes et des rangées
# Tout comme pour les vecteurs, nous devons utiliser les [] pour indiquer que nous voulons extraire ces éléments.
# À l'intérieur des [], le premier index indique quelles RANGÉES extraire et le second quelles COLONNES extraire.
# Notez que lorsqu'aucun index n'est spécifié l'ensemble des colonnes et rangées sont extraites.

airquality[ , ] # [rangée, colonne]




# Question de se simplifier la vie, assignons la base de données intégrée airquality à un objet.
# Ainsi, nous pourrons la voir dans notre fenêtre Global Environment.
airquality = airquality

# Partie 2, 
# Selectionner (donc conserver) des Variables
airquality[1] # un seul index sélectionne une COLONNE (ben oui, même si le premier index lorsqu'il y en a 2 c'est les rangées!)
airquality["Wind"] # On peut aussi extraire une colonne en utilisant son nom et non son index
airquality$Ozone # Une deuxième méthode d'extraction par nom: l'utilisation de $. Pratique lorsqu'on ne veut qu'une seule colonne, 
                 # pas mal moins pour extraire plusieurs colonnes!

airquality[1:4] # on peut aussi extraire une série de colonnes
airquality[c("Wind", "Temp")] # Ou, si l'on veut utiliser les noms des colonnes, on peut les extraire en utilisant un vecteur
                              # Notez l'utilisation de la fonction c()

colnames(airquality) # remarquez que l'extraction en elle-même (c'est-à-dire sans assignation avec = ou <-) n'affecte pas
                     # la structure de l'objet d'origine


# Assigner à un nouvel objet
mes_vars = c("Wind","Temp") # Ici, nous assignons à un objet (mes_vars) les NOMS des variables (et pas les valeurs elles-mêmes)
                            # Notez qu'il n'y a aucune référence à airquality!
                            # Nous ne faisons que créer un vecteur, qui pourra être utilisé pour l'extraction.

test1 <- airquality[mes_vars] # On peut utiliser le vecteur pour extraire
test2 <-  airquality[c("Wind", "Temp")] # À notre que l'on obtient le même résultat sans créer de vecteur.
                                        # Mais le vecteur peut être utile plus tard... vous verrez!


airquality[1:3, c("Wind","Temp")] # On peut bien sûr spécifier quelles rangées nous voulons, il suffit de les indiquer au début!



# Exclure des Variables
mes_vars2 <- colnames(airquality) %in% mes_vars
        # L'opérateur %in% est utilisé pour identifier si un élément appartient à un vecteur.
        # Ainsi, la ligne de code plus haut retourner un objet logique (une série de TRUE et FALSE),
        # dont chaque TRUE ou FALSE fait référence à chaque colonne d'airquality et indiquera, si, 
        # TRUE or FALSE, elles se trouvent dans l'objet mes_vars

test3 <- airquality[1:3,!mes_vars2]
        # L'utilisation du point d'exclamation (!) devant la désignation des colonnes dans cette ligne de code
        # indique que nous voulons EXCLURE ces colonnes.

# L'exclusion peut aussi être indiquée avec le signe moins (-). Ici nous excluons la 3ème et la 5ème colonne
test4 <- airquality[c(-3,-5)] # première méthode
test5 <- airquality[-c(3,5)]  # deuxième méthode


# Effacer les variables
airquality2 <- airquality # création d'une nouvelle version complète d'airquality, question de garder l'original!
airquality2$Temp <- airquality2$Ozone <- NULL # l'utilisation de NULL indique que nous voulons EFFACER une variable


# Partie 3. Sélectionner des rangées

# Cinq premières observations
test6 <- airquality2[1:5,]
    # Ici, nous voulons sélectionner toutes les colonnes, et seulement spécifier des rangées.
    # Puisque lorsqu'un seul index réfère aux colonnes, nous pouvons tout de même indiquer les rangées
    # et rajouter une virgule pour indiquer que nous voulons conserver l'ensemble des colonnes.


# Basé sur la valeur des variables. La fonction which() retourne la position (index) des éléments 
test7 <- airquality[ which(airquality$Month == 5
        & airquality$Temp > 65), ]


