#############################################################
## Exercices de cr�ation de sous-ensembles.
## Intro � R/RStudio Mai 2020
#############################################################

# Vous pouvez consulter la liste de functions dans le script � BaseR_functions � dans le fichier � Supporting_Info �


#  Q1. Cr�ez un vecteur ayant une s�quence de nombres de 0 jusqu'� 10 000 � chaque 20 �chelons

#  Q2. Extrayez le 334�me �l�ment du vecteur cr�� dans Q1

#  Q3. Extrayez 10 �l�ments de votre choix du vecteur cr�� dans Q1

#  Q4. Extrayez la derni�re entr�e du vecteur suivant
set.seed(2)
vector2= sample(seq(40,10000,1.25),size=2992000, replace = T)


#  Q5. Cr�ez un vecteur avec chaque troisi�me lettre de l'alphabet
#  R�glez le vecteur dans un objet appel� valeurs_vecteurs
#  Indice, commencez avec l'objet LETTERS int�gr� dans R et utilisez la fonction seq()
