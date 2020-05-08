#############################################################
## Fusionner (joindre) des bases de données avec dplyr 
## Intro à R/RStudio Avril 2020
#############################################################

library(dplyr)

# Il y a 2 manières de combiner des bases de données
# 1. Par "binding" : simplement en collant des colonnes ou des rangées
# 2. Avec une variable clé, combinant sur des valeurs communes 

# Il est aussi très pratique (et possible!) de combiner des bases de données et réduire le nombre total
# d'observations selon s'il y a concordance ou non (pensez left, right, full join!)


# Tout comme en SAS, il y a plusieurs méthodes qui peuvent être utilisées en R qui donneront le même résultat.
# (par exemple: data step ou sql pour fusionner les bases de données)
# Dans le cadre du cours nous resterons dans les méthodes offertes via le tidyverse


#1. Binding 
# Débutons par créer 2 bases de données contenant une nouvelle colonne afin d'identifier la source plus tard


airquality1 = airquality %>% mutate(source_df = "airquality1")

airquality2 = airquality %>% mutate(source_df = "airquality2", test = "Eh ben!")


# Attachons airquality2 à airquality1 avec la fonction bind_rows()
# La fonction bind_rows(), c'est l'équivalent en SAS de mettre 2 bases de données dans le "set" d'un "data step"
airquality_rbind = bind_rows(airquality1, airquality2) #append airquality2 onto airquality1

# Attachons airquality2 à airquality1 avec la fonction bind_cols()
# Vous l'aurez deviné, ceci attache les colonnes une à côté de l'autre
airquality_cbind = bind_cols(airquality1, airquality2)  
# Vous remarquerez que le nom des colonnes est changé automatiquement pour celles provenant d'airquality2. 
colnames(airquality_cbind)
# Pour bind_cols, le nombre d'observation doit être identique entre les bases de données.




# 2. Fusionner les bases de données avec une clé 
# Ici nous rajouterons une clé nommée id que nous allons ensuite utiliser pour "matcher" les bases de données 
# Juste pour s'amuser, id ne sera pas une série séquentielle, mais plutôt attribué aléatoirement :)

airquality1 = airquality %>% mutate(source_df = "airquality1", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)
airquality2 = airquality %>% mutate(source_df = "airquality2", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)

# un left join (ici, on attache les valeurs de airquality2 (à droite dans la parenthèse) à airquality1 (à gauche dans la parenthèse)))
left_airqual = left_join(airquality1, airquality2, by= "id")

# un right join (ici, on attache les valeurs de airquality1 à airquality2 (à droite dans la parenthèse))
right_airqual = right_join(airquality1, airquality2, by= "id")


# Dans l'exemple plus haut, la méthode d'attribution des id a fait en sorte que les id se chevauchaient parfaitement
# Brassons les cartes un peu et voyons les résultats si le chevauchement n'est pas parfait!

airquality1 = airquality %>% mutate(source_df = "airquality1", id = sample(50:(nrow(airquality)+49), replace = F)) %>% arrange(id)
airquality2 = airquality %>% mutate(source_df = "airquality2", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)

left_airqual2 = left_join(airquality1, airquality2, by = 'id')
# Ce n'est pas surprenant: là oû le id n'existait pas dans airquality2, les observations sont à NA (vide)

# Pour conserver uniquement les valeurs communes de id, on utilise inner_join() (joint interne?)
inner_airqual = inner_join(airquality1, airquality2, by= "id")

# Pour conserver l'ensemble des observations des deux bases de données, on utilise full_join() (joint entier?)
full_airqual = full_join(airquality1, airquality2, by= "id")


# 3. Fusions partielles (Filtering Joins, ou joints filtrants?) 
# Le semi_join() est le petit frère du left join: il attache airquality2 à airquality1, mais conserve 
# uniquement les observations qui ont une concordance
semi_airqual = semi_join(airquality1, airquality2, by= "id")

# À l'inverse, le anti_join conserve uniquement les observations de airquality1 qui n'ont PAS de concordance! 
anti_airqual = anti_join(airquality1, airquality2, by= "id")  #All rows in a that do not have a match in b
# Il s'en suit que la somme des nombres d'observations de anti_airqual et de semi_airqual sera bien sûr le 
# nombre total d'observations de airquality1!