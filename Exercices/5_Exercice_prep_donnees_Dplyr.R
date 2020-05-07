######################################################################
## Exercices de préparation préalable des données avancé avec Dplyr
## Intro à R/RStudio Mai 2020
######################################################################

library(tidyr)

?data
data()
counties

#  Explorons les données de la Banque mondiale sur la population qui vient avec R
?world_bank_pop

world_pop = world_bank_pop #  C'est préférable de manipuler une copie des données et de ne jamais modifié les données initiales

#  Q1. Quelles sont les dimensions (lignes et colonnes) des données et les noms des colonnes ?

#  Q2. Déterminez la classe de chaque variable. Pour les variables numériques, déterminez le minimum et le maximum

#  Q3. Est-ce qu'il y a des lignes en doublons dans les données ?

#  Q4. Chaque pays a combien d'observations ?


#  Q5. Quelle est la 30ème valeur de la variable country ?


#  Q6. Créez une base de données réduites nommée world_pop_2017. Cette base de données doit contenir les variables country et indicator
# ainsi que les données de population pour 2017 seulement


#  Q7. Calculez la population totale du monde en 2017.
#  Indice, vous devez précisé que vous désiré ignorer les NA (valeurs manquantes) dans certaines fonctions tel que sum et mean
#  Sinon, R retournera une valeur manquante 
#  Par example, sum(`2017`, na.rm = T)


#  Q8. Avec la base de donnée complète, calculez la population mondiale à chaque année
#  Indice, consultez les notes dans la section dplyr avancé. Trouvez une façon de sélectionner les colonnes numériques désirées
#  et recherchez pour une function qui résume les données et qui peut s'appliquer à tous
