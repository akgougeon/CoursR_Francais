#############################################################
## Exercices de l'affectation des variables avec r�ponses.
## Intro � R/RStudio, Mai 2020
#############################################################

#  Q1. Lequel des options suivantes ne sont pas des noms valides dans R?
#  R1: _age et 2ligit2quit. Remarquez que RStudio indique qu'il y a un probl�me sur le num�ro de ligne
#  ?crapaud n'est aussi pas valide car R recherche le mot crapaud dans la section help

min_poids
max_longueur
_age
?crapaud
masse
celsius2kelvin
2ligit2quit

#  Q2. Assignez votre nom � un objet nomm� mon_nom
#  R2:
mon_nom = "Votre nom ici"


#  Q3. Pouvez-vous ajouter votre nom � la liste suivante?
lst_nom  = c("Tristan  Garry", "Rory McGregor", "Francine Adobo")
#  R3:
lst_nom  = c(lst_nom, mon_nom)


#  Q4. Comptez le nombre de noms dans la liste pr�c�dente
#  R4: Il devrait y avoir quatre noms
length(lst_nom)


#  Q5. Calculez la moyenne et l'�tendue de l'ensemble de nombres suivant:
mes_nombres  = c(5,5,6,2,1,6,3,33)
#  R5:
mean(mes_nombres)
range(mes_nombres)


#  Q6. L'�quation d'une droite est y = bx + e
#  Calculez la valeur de y dans l'�quation de r�gression suivante:
b <- 8.4
x <- 24.33
e <- 1.32
#  R6:
y = b*x + e
y