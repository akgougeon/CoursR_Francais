#############################################################
## Extraction de vecteurs
## Intro � R/RStudio Avril 2020
#############################################################


# Deux des t�ches les plus courantes pour tout scientifique des donn�es/analyste sont 
# l'interrogation et l'extraction des donn�es.
# Dans la version de base de R, tout ce que vous devez savoir est l'index (le positionnement) de(s) l'�l�ment(s)
# que vous d�sirez extraire.
# Les deux options principales pour obtenir cette information sont: 
# 1) Utiliser l'index num�rique de(s) l'�l�ment(s). � noter que vous pouvez utiliser un ou plusieurs index.
# 2) Utiliser la fonction which(), qui convertit un vecteur logique � une liste num�rique.


# Partie 1: Explorer l'extraction d'�l�ments avec des index num�riques

# Cr�eons un nouveau vecteur dont les 5 premiers �l�ments sont des 0 et les 5 derniers des 1
# Pour R, contrairement � Python, l'index (position) du premier �l�ment est 1 (et non 0!). Une distinction importante!
x <- c(0,0,0,0,0, 1,1,1,1,1)


# Comment pouvons-nous changer le 6�me �l�ment de x � 99?
# Comment pouvons-nous extraire le 4�me �l�ment de x et l'assigner � y?

x[4]  # L'utilisation de [] indique une extraction. Ainsi, ici, nous extractons le 4�me �l�ment de x

x[6] = 99 # Ici, l'utilisation de = implique que nous voulons faire une modification. Donc, on "extrait" le 6�me �l�ment de x
          # et lui assignons la valeur de 99.
x         # Visualisez x apr�s la modification. Et oui, le 6�me �l�ment est maintenant 99 (et n'est plus 1)

y <- x[4] # Ici, nous prenons le 4�me �l�ment de x et l'assignons � un nouvel objet, y. 

y         # Visualisez y!


# D'autres exemples et fonctions d'extractions
mon_vecteur <- LETTERS    # cr�era un vecteur avec les 26 lettres de l'alphabet
length(mon_vecteur)       # donnera la longueur ("length") du vecteur, ou, en d'autres mots, le nombre d'�l�ments dans le vecteur


mon_vecteur[6]         # extraire la 6�me lettre
mon_vecteur[10:19]     # extraire de la 10�me � la 19�me lettre (inclusivement)
mon_vecteur[c(10:19)]  # donnera le m�me r�sultat que la ligne pr�c�dente. Tout comme en SAS, il peut y avoir plusieurs m�thodes qui am�nent au m�me r�sultat!
mon_vecteur[-c(10:19)] # l'utilisation du moins (-) indique de RETIRER du vecteur ce qui suit
mon_vecteur            # observez bien le r�sultat: les extractions plus haut ne MODIFIENT PAS le vecteur d'origine!
                       # Pour modifier le vecteur d'origine nous devons assigner de nouveau mon_vecteur: 
                       # mon_vecteur <- mon_vecteur[10:19]
 

# Encore plus d'extractions!
# Nous allons utiliser l'objet x, tel que d�fini plus haut.
x[c(1,2,3)] # vous pouvez utiliser un vecteur pour indiquer quelles positions (index) vous d�sirez extraire

x[seq(3:8)] # vous pouvez aussi utiliser une fonction

x[x>1] # sans oublier les op�rateurs logiques! Ici nous extrayons tous les �l�ments dont la valeur est sup�rieure � 1



# Avant de se lancer dans les trames de donn�es, pratiquons un peu plus les extractions

x <- c(0,0,0,0,0,1,1,0,0,1)

# Comment assigneriez-vous le 4�me �l�ment de x � l'objet y?
# Comment changeriez-vous le 6�me �l�ment de x pour 0?



# Partie 2: Extraire des �l�ments � utiliser pour identifier les index (positions)
x <- c(0,0,0,0,0,1,1,0,0,1)

trouver_position = which(x >0)  # ici, nous cr��ons un nouvel objet (trouver_position) qui indiquera les positions 
                                # des �l�ments de x ayant une valeur sup�rieure � 0.
                                # la fonction which() (qui, si on veut) permet d'indiquer une condition.

extraire_ceux_qui = x[which(x >0)] # voyez la diff�rence avec la ligne de code pr�c�dente: l'utilisation de [].
                                   # rappelez-vous, [] indique une extraction. donc, ici, nous cr�eons un nouvel objet (extraire_ceux_qui)
                                   # dans lequel seront mis non pas les positions (tel que c'est le cas plus haut), mais bien 
                                   # les VALEURS de x, qui sont sup�rieurs � 0. R�sultat: extraire_ceux_qui aura trois �l�ments, tous de valeur 1


