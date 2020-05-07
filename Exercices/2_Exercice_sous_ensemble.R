#############################################################
## Exercices de création de sous-ensembles.
## Intro à R/RStudio Mai 2020
#############################################################

# Vous pouvez consulter la liste de functions dans le script « BaseR_functions » dans le fichier « Supporting_Info »


#  Q1. Créez un vecteur ayant une séquence de nombres de 0 jusqu'à 10 000 à chaque 20 échelons

#  Q2. Extrayez le 334ème élément du vecteur créé dans Q1

#  Q3. Extrayez 10 éléments de votre choix du vecteur créé dans Q1

#  Q4. Extrayez la dernière entrée du vecteur suivant
set.seed(2)
vector2= sample(seq(40,10000,1.25),size=2992000, replace = T)


#  Q5. Créez un vecteur avec chaque troisième lettre de l'alphabet
#  Réglez le vecteur dans un objet appelé valeurs_vecteurs
#  Indice, commencez avec l'objet LETTERS intégré dans R et utilisez la fonction seq()
