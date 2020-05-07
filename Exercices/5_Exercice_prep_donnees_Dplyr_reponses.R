##################################################################################
## Exercices de préparation préalable des données avancé avec Dplyr et réponses
## Intro à R/RStudio Mai 2020
##################################################################################

library(tidyr)

?data
data()
counties

#  Explorons les données de la Banque mondiale sur la population qui vient avec R
?world_bank_pop

world_pop = world_bank_pop #  C'est préférable de manipuler une copie des données et de ne jamais modifié les données initiales

#  Q1. Quelles sont les dimensions (lignes et colonnes) des données et les noms des colonnes ?
#  R1:
dim(world_pop)

colnames(world_pop) #la fonction names peut aussi être utilisé

#  Q2. Déterminez la classe de chaque variable. Pour les variables numériques, déterminez le minimum et le maximum
#  R2:
summary(world_pop)

#  Q3. Est-ce qu'il y a des lignes en doublons dans les données ?
#  R3:
world_pop %>% filter(duplicated(.)) %>% nrow()

#  Q4. Chaque pays a combien d'observations ?
#  R4:
world_pop %>% group_by(country) %>% count() %>% arrange()

#  Q5. Quelle est la 30ème valeur de la variable country ?
#  R5:
world_pop %>% select(country) %>% slice(30)
world_pop %>% select(country) %>% summarise(nth(country,30))
world_pop$country[30]

#  Q6. Créez une base de données réduites nommée world_pop_2017. Cette base de données doit contenir les variables country et indicator
# ainsi que les données de population pour 2017 seulement
#  R6:
world_pop_2017 = world_pop %>% select(country, indicator, "2017")

#  Q7. Calculez la population totale du monde en 2017.
#  Indice, vous devez précisé que vous désiré ignorer les NA (valeurs manquantes) dans certaines fonctions tel que sum et mean
#  Sinon, R retournera une valeur manquante 
#  Par example, sum(`2017`, na.rm = T)
#  R7:
world_pop_2017t = world_pop_2017%>% filter(indicator == "SP.POP.TOTL")
world_pop_2017t %>% summarise(Tot = sum(`2017`, na.rm =T))


#  Q8. Avec la base de donnée complète, calculez la population mondiale à chaque année
#  Indice, consultez les notes dans la section dplyr avancé. Trouvez une façon de sélectionner les colonnes numériques désirées
#  et recherchez pour une function qui résume les données et qui peut s'appliquer sur les données au complet
#  R8:
world_pop %>% select_if(is.numeric) %>% 
  summarise_all(list(total = sum, 
                     mean =mean), na.rm=T)