##################################################################################
## Exercices de pr�paration pr�alable des donn�es avanc� avec Dplyr et r�ponses
## Intro � R/RStudio Mai 2020
##################################################################################

library(tidyr)

?data
data()
counties

#  Explorons les donn�es de la Banque mondiale sur la population qui vient avec R
?world_bank_pop

world_pop = world_bank_pop #  C'est pr�f�rable de manipuler une copie des donn�es et de ne jamais modifi� les donn�es initiales

#  Q1. Quelles sont les dimensions (lignes et colonnes) des donn�es et les noms des colonnes ?
#  R1:
dim(world_pop)

colnames(world_pop) #la fonction names peut aussi �tre utilis�

#  Q2. D�terminez la classe de chaque variable. Pour les variables num�riques, d�terminez le minimum et le maximum
#  R2:
summary(world_pop)

#  Q3. Est-ce qu'il y a des lignes en doublons dans les donn�es ?
#  R3:
world_pop %>% filter(duplicated(.)) %>% nrow()

#  Q4. Chaque pays a combien d'observations ?
#  R4:
world_pop %>% group_by(country) %>% count() %>% arrange()

#  Q5. Quelle est la 30�me valeur de la variable country ?
#  R5:
world_pop %>% select(country) %>% slice(30)
world_pop %>% select(country) %>% summarise(nth(country,30))
world_pop$country[30]

#  Q6. Cr�ez une base de donn�es r�duites nomm�e world_pop_2017. Cette base de donn�es doit contenir les variables country et indicator
# ainsi que les donn�es de population pour 2017 seulement
#  R6:
world_pop_2017 = world_pop %>% select(country, indicator, "2017")

#  Q7. Calculez la population totale du monde en 2017.
#  Indice, vous devez pr�cis� que vous d�sir� ignorer les NA (valeurs manquantes) dans certaines fonctions tel que sum et mean
#  Sinon, R retournera une valeur manquante 
#  Par example, sum(`2017`, na.rm = T)
#  R7:
world_pop_2017t = world_pop_2017%>% filter(indicator == "SP.POP.TOTL")
world_pop_2017t %>% summarise(Tot = sum(`2017`, na.rm =T))


#  Q8. Avec la base de donn�e compl�te, calculez la population mondiale � chaque ann�e
#  Indice, consultez les notes dans la section dplyr avanc�. Trouvez une fa�on de s�lectionner les colonnes num�riques d�sir�es
#  et recherchez pour une function qui r�sume les donn�es et qui peut s'appliquer sur les donn�es au complet
#  R8:
world_pop %>% select_if(is.numeric) %>% 
  summarise_all(list(total = sum, 
                     mean =mean), na.rm=T)