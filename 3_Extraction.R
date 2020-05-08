#############################################################
## Extraction de vecteurs
## Intro à R/RStudio Avril 2020
#############################################################


# Deux des tâches les plus courantes pour tout scientifique des données/analyste sont 
# l'interrogation et l'extraction des données.
# Dans la version de base de R, tout ce que vous devez savoir est l'index (le positionnement) de(s) l'élément(s)
# que vous désirez extraire.
# Les deux options principales pour obtenir cette information sont: 
# 1) Utiliser l'index numérique de(s) l'élément(s). À noter que vous pouvez utiliser un ou plusieurs index.
# 2) Utiliser la fonction which(), qui convertit un vecteur logique à une liste numérique.


# Partie 1: Explorer l'extraction d'éléments avec des index numériques

# Créeons un nouveau vecteur dont les 5 premiers éléments sont des 0 et les 5 derniers des 1
# Pour R, contrairement à Python, l'index (position) du premier élément est 1 (et non 0!). Une distinction importante!
x <- c(0,0,0,0,0, 1,1,1,1,1)


# Comment pouvons-nous changer le 6ème élément de x à 99?
# Comment pouvons-nous extraire le 4ème élément de x et l'assigner à y?

x[4]  # L'utilisation de [] indique une extraction. Ainsi, ici, nous extractons le 4ème élément de x

x[6] = 99 # Ici, l'utilisation de = implique que nous voulons faire une modification. Donc, on "extrait" le 6ème élément de x
          # et lui assignons la valeur de 99.
x         # Visualisez x après la modification. Et oui, le 6ème élément est maintenant 99 (et n'est plus 1)

y <- x[4] # Ici, nous prenons le 4ème élément de x et l'assignons à un nouvel objet, y. 

y         # Visualisez y!


# D'autres exemples et fonctions d'extractions
mon_vecteur <- LETTERS    # créera un vecteur avec les 26 lettres de l'alphabet
length(mon_vecteur)       # donnera la longueur ("length") du vecteur, ou, en d'autres mots, le nombre d'éléments dans le vecteur


mon_vecteur[6]         # extraire la 6ème lettre
mon_vecteur[10:19]     # extraire de la 10ème à la 19ème lettre (inclusivement)
mon_vecteur[c(10:19)]  # donnera le même résultat que la ligne précédente. Tout comme en SAS, il peut y avoir plusieurs méthodes qui amènent au même résultat!
mon_vecteur[-c(10:19)] # l'utilisation du moins (-) indique de RETIRER du vecteur ce qui suit
mon_vecteur            # observez bien le résultat: les extractions plus haut ne MODIFIENT PAS le vecteur d'origine!
                       # Pour modifier le vecteur d'origine nous devons assigner de nouveau mon_vecteur: 
                       # mon_vecteur <- mon_vecteur[10:19]
 

# Encore plus d'extractions!
# Nous allons utiliser l'objet x, tel que défini plus haut.
x[c(1,2,3)] # vous pouvez utiliser un vecteur pour indiquer quelles positions (index) vous désirez extraire

x[seq(3:8)] # vous pouvez aussi utiliser une fonction

x[x>1] # sans oublier les opérateurs logiques! Ici nous extrayons tous les éléments dont la valeur est supérieure à 1



# Avant de se lancer dans les trames de données, pratiquons un peu plus les extractions

x <- c(0,0,0,0,0,1,1,0,0,1)

# Comment assigneriez-vous le 4ème élément de x à l'objet y?
# Comment changeriez-vous le 6ème élément de x pour 0?



# Partie 2: Extraire des éléments à utiliser pour identifier les index (positions)
x <- c(0,0,0,0,0,1,1,0,0,1)

trouver_position = which(x >0)  # ici, nous crééons un nouvel objet (trouver_position) qui indiquera les positions 
                                # des éléments de x ayant une valeur supérieure à 0.
                                # la fonction which() (qui, si on veut) permet d'indiquer une condition.

extraire_ceux_qui = x[which(x >0)] # voyez la différence avec la ligne de code précédente: l'utilisation de [].
                                   # rappelez-vous, [] indique une extraction. donc, ici, nous créeons un nouvel objet (extraire_ceux_qui)
                                   # dans lequel seront mis non pas les positions (tel que c'est le cas plus haut), mais bien 
                                   # les VALEURS de x, qui sont supérieurs à 0. Résultat: extraire_ceux_qui aura trois éléments, tous de valeur 1


