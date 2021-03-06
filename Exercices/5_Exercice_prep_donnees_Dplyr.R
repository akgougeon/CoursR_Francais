######################################################################
## Exercices de pr�paration pr�alable des donn�es avanc� avec Dplyr
## Intro � R/RStudio Mai 2020
######################################################################

library(tidyr)

?data
data()
counties

#  Explorons les donn�es de la Banque mondiale sur la population qui vient avec R
?world_bank_pop

world_pop = world_bank_pop #  C'est pr�f�rable de manipuler une copie des donn�es et de ne jamais modifi� les donn�es initiales

#  Q1. Quelles sont les dimensions (lignes et colonnes) des donn�es et les noms des colonnes ?

#  Q2. D�terminez la classe de chaque variable. Pour les variables num�riques, d�terminez le minimum et le maximum

#  Q3. Est-ce qu'il y a des lignes en doublons dans les donn�es ?

#  Q4. Chaque pays a combien d'observations ?


#  Q5. Quelle est la 30�me valeur de la variable country ?


#  Q6. Cr�ez une base de donn�es r�duites nomm�e world_pop_2017. Cette base de donn�es doit contenir les variables country et indicator
# ainsi que les donn�es de population pour 2017 seulement


#  Q7. Calculez la population totale du monde en 2017.
#  Indice, vous devez pr�cis� que vous d�sir� ignorer les NA (valeurs manquantes) dans certaines fonctions tel que sum et mean
#  Sinon, R retournera une valeur manquante 
#  Par example, sum(`2017`, na.rm = T)


#  Q8. Avec la base de donn�e compl�te, calculez la population mondiale � chaque ann�e
#  Indice, consultez les notes dans la section dplyr avanc�. Trouvez une fa�on de s�lectionner les colonnes num�riques d�sir�es
#  et recherchez pour une function qui r�sume les donn�es et qui peut s'appliquer � tous
