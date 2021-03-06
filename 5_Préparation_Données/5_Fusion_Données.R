#############################################################
## Fusionner (joindre) des bases de donn�es avec dplyr 
## Intro � R/RStudio Avril 2020
#############################################################

library(dplyr)

# Il y a 2 mani�res de combiner des bases de donn�es
# 1. Par "binding" : simplement en collant des colonnes ou des rang�es
# 2. Avec une variable cl�, combinant sur des valeurs communes 

# Il est aussi tr�s pratique (et possible!) de combiner des bases de donn�es et r�duire le nombre total
# d'observations selon s'il y a concordance ou non (pensez left, right, full join!)


# Tout comme en SAS, il y a plusieurs m�thodes qui peuvent �tre utilis�es en R qui donneront le m�me r�sultat.
# (par exemple: data step ou sql pour fusionner les bases de donn�es)
# Dans le cadre du cours nous resterons dans les m�thodes offertes via le tidyverse


#1. Binding 
# D�butons par cr�er 2 bases de donn�es contenant une nouvelle colonne afin d'identifier la source plus tard


airquality1 = airquality %>% mutate(source_df = "airquality1")

airquality2 = airquality %>% mutate(source_df = "airquality2", test = "Eh ben!")


# Attachons airquality2 � airquality1 avec la fonction bind_rows()
# La fonction bind_rows(), c'est l'�quivalent en SAS de mettre 2 bases de donn�es dans le "set" d'un "data step"
airquality_rbind = bind_rows(airquality1, airquality2) #append airquality2 onto airquality1

# Attachons airquality2 � airquality1 avec la fonction bind_cols()
# Vous l'aurez devin�, ceci attache les colonnes une � c�t� de l'autre
airquality_cbind = bind_cols(airquality1, airquality2)  
# Vous remarquerez que le nom des colonnes est chang� automatiquement pour celles provenant d'airquality2. 
colnames(airquality_cbind)
# Pour bind_cols, le nombre d'observation doit �tre identique entre les bases de donn�es.




# 2. Fusionner les bases de donn�es avec une cl� 
# Ici nous rajouterons une cl� nomm�e id que nous allons ensuite utiliser pour "matcher" les bases de donn�es 
# Juste pour s'amuser, id ne sera pas une s�rie s�quentielle, mais plut�t attribu� al�atoirement :)

airquality1 = airquality %>% mutate(source_df = "airquality1", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)
airquality2 = airquality %>% mutate(source_df = "airquality2", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)

# un left join (ici, on attache les valeurs de airquality2 (� droite dans la parenth�se) � airquality1 (� gauche dans la parenth�se)))
left_airqual = left_join(airquality1, airquality2, by= "id")

# un right join (ici, on attache les valeurs de airquality1 � airquality2 (� droite dans la parenth�se))
right_airqual = right_join(airquality1, airquality2, by= "id")


# Dans l'exemple plus haut, la m�thode d'attribution des id a fait en sorte que les id se chevauchaient parfaitement
# Brassons les cartes un peu et voyons les r�sultats si le chevauchement n'est pas parfait!

airquality1 = airquality %>% mutate(source_df = "airquality1", id = sample(50:(nrow(airquality)+49), replace = F)) %>% arrange(id)
airquality2 = airquality %>% mutate(source_df = "airquality2", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)

left_airqual2 = left_join(airquality1, airquality2, by = 'id')
# Ce n'est pas surprenant: l� o� le id n'existait pas dans airquality2, les observations sont � NA (vide)

# Pour conserver uniquement les valeurs communes de id, on utilise inner_join() (joint interne?)
inner_airqual = inner_join(airquality1, airquality2, by= "id")

# Pour conserver l'ensemble des observations des deux bases de donn�es, on utilise full_join() (joint entier?)
full_airqual = full_join(airquality1, airquality2, by= "id")


# 3. Fusions partielles (Filtering Joins, ou joints filtrants?) 
# Le semi_join() est le petit fr�re du left join: il attache airquality2 � airquality1, mais conserve 
# uniquement les observations qui ont une concordance
semi_airqual = semi_join(airquality1, airquality2, by= "id")

# � l'inverse, le anti_join conserve uniquement les observations de airquality1 qui n'ont PAS de concordance! 
anti_airqual = anti_join(airquality1, airquality2, by= "id")  #All rows in a that do not have a match in b
# Il s'en suit que la somme des nombres d'observations de anti_airqual et de semi_airqual sera bien s�r le 
# nombre total d'observations de airquality1!