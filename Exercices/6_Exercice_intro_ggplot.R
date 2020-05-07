#############################################################
## Excercices ggplot 
## Intro à R/RStudio mai 2020
#############################################################

#  Première partie: pour les exercices suivant, utilisez la base de données mpg retrouvé dans dplyr

#  Q1. Visualisez la relation entre cty (le kilométrage moyen en ville) et hwy (le kilométrage moyen sur les autoroutes)

#  Q2. Colorez les points d'après les différents niveaux de la variable nommée class 

#  Q3. Examinez comment la distribution de hwy (le kilométrage moyen sur les autoroutes) varie selon le drv (système d'ensemble motopropulseur)
#  Commencez en analysant une variable à la fois


#  Q4. Combien d'enregistrement sont disponible pour chaque constructeur automobile de la base de données ?



#  Deuxième partie: Explorez https://ggplot2.tidyverse.org/reference/economics.html 
#  en utilisant la base de données economics 

#  Q1. Se familiariser avec la base de données. Il y a combien do colonnes et de lignes ?
# Quelle est la classe de chaque variable ?

# La base de données economics comprends les variables:
# date - mois de la collection des données
# psavert - le taux d'épargne des particuliers
# pce - dépenses liées à la consommation des ménages en milliards de dollars
# unemploy - nombre de chômeurs en milliers
# unempmed - durée médiane du chômage en semaines
# pop - population totale en milliers



#  Q2. Visuaisez le taux de chômage (nombre de chômeurs / population)



#  Q3. Changez le thème (les éléments visuels) du graphique.
# Ajoutez un titre. Changez l'indication de l'axe vertical à "Taux de chômage" et de l'axe horizontal à "Date"



dev.off()
