#############################################################
## Premiers pas avec dplyr 
## Intro à R/RStudio avril 2020
#############################################################
# Ressources (en anglais seulement):
# https://github.com/rstudio/EDAWR


# Un haut pourcentage des tâches de la majorité des analystes et scientifiques de données est attribuable 
# à la préparation préliminaire des données ("data wrangling").

# Il y a deux composantes à la préparation des données:
# 1. Manipulation:
    # Changer les variables, valeurs, unités, identifier les valeurs extrêmes et les erreurs

# 2. Nettoyage:
    # Modifier la "mise en page" pour rendre possible l'analyse et les visualisations
    # Par exemple, vous pourriez vouloir transformer des données étendues ("wide data") en données 
    # allongées ("long data") pour pouvoir créer un modèle mixte avec des estimés d'erreur

# Il y deux packages qui facilitent la préparation de données, qui proviennent du tidyverse (voir le cours précédant sur les libraries): 
        # 1. dplyr
        # 2. tidyr


# Nous allons nous concentrer sur dplyr. Comme nous l'avons déjà installé dans une session précédente, 
# nous n'avons qu'à l'appeler : 
library(dplyr)



# Intro à dplyr
# dplyr contient 5 fonctions qui rendent la manipulation de données très facile. Notez que dplyr 
# comporte beaucoup plus que ces 5 fonctions, mais nous ne présenterons que celles-ci.
## 1) filter : sélectionne des rangées 
## 2) select : sélectionne des colonnes (variables)
## 3) arrange : trie, en ordre descendant ou ascendant, les données
## 4) mutate : créé de nouvelles variables
## 5) summarise : résume l'information


# Pour la suite de l'exercice, nous allons utiliser des données sur la tuberculose de l'OMS.
# Elles proviennent de microdonnées sur chaque cas de tuberculose confirmé, incluant l'année, le pays, et le sexe.

tb_data = read.csv("5_Advanced_Data_Wrangling/data/tb.csv", stringsAsFactors = F, header = T)



# débutez toujours par apprendre à connaître les données:
summary(tb_data)  # quelques statistiques descriptives
str(tb_data)      # la structre des données (type, et quelques valeurs)
colnames(tb_data) # le nom des variables

counts <- table(tb_data$country) # variable créée pour faire un diagramme à barre (nb de cas par pays)
barplot(counts, ylim = c(0,40))  # visualisation des données (nombre de cas par pays, avec limite max de 40 sur l'axe des y)

hist(tb_data$child) #Nombre de nouveaux cas pour les personnes âgées de 0 à 14 ans
hist(tb_data$adult) #Nombre de nouveaux cas pour les personnes âgées de 15 à 64 ans
hist(tb_data$elderly) #Nombre de nouveaux cas pour les personnes âgées de plus de 64 ans
hist(tb_data$elderly[tb_data$elderly<20000]) 
   


# Explorer la base de données avec ces 5 fonctions.

# Filter (filtre): 
  # Sélectionons les taux de tuberculose aux États-Unis
US_data = filter(tb_data, country == "United States of America" )
  # Sélectionons les taux de tuberculose aux États-Unis, où des adultes ont été contaminés
US_data = filter(tb_data, country == "United States of America" & adult >0 ) # on peut combiner des critères!
  # Sélectionons les taux de tuberculose aux États-Unis et au Yémen (en utilisant... OU)
US_data = filter(tb_data, country == "United States of America" | country == "Yemen" ) # combiner avec OU
  # Sélectionons les observations où les pays contiennent le mot "United"
  # grepl() est une fonction permettant de trouver une expression dans des valeurs de variables caractères
  # grepl() est très pratique, mais on doit faire attention... les résultats peuvent contenir de mauvaises surprises
US_data = filter(tb_data, grepl("United", country))


# Select:  cette fonction sélectionne les colonnes (et non pas les rangées)
# Sélectionons la colonne nommée "adult" (n'oubliez pas que R est sensible à la casse!)
mes_colonnes =  c("adult", "child", "elderly") # voyez comme ceci ne fait que créer un objet vecteur... ça n'extraie pas les colonnes de la base de données
cas_adultes = select(US_data, adult, child, elderly) # mais ceci, oui!




# La fonction arrange() trie en ordre ascendant
cas_adultes = arrange(cas_adultes, adult)
# On peut spécifier si l'on veut trier en ordre descendant, et aussi trier sur plus d'une variable
cas_adultes = arrange(cas_adultes, desc(adult), child)



# La fonction mutate() créé une nouvelle variable. Revenons à la base de données complète des cas 
# de tuberculose et ajoutons une variable qui est le total des cas

tb_data = mutate(tb_data, total = adult + child + elderly)
# simple, non?

# on peut créer plusieurs variables d'un seul coup, il suffit de les séparer par une virgule
tb_data = mutate(tb_data, 
  adult_scaled = adult/5*9, 
  means_cases = mean(adult, na.rm = T)) # rappel: l'option na.rm indique si l'on veut retirer les valeurs
                                        # manquantes d'un calcul. Par défaut, elles sont conservées... mais ça
                                        # va retourner une erreur puisque R ne peut calculer une moyenne, par exemple,
                                        # avec des valeurs manquantes. 
                                        # na.rm ---> NA REMOVE


tb_data = mutate(tb_data, all_sum = sum(adult, child, elderly, na.rm = T))
  # une autre manière d'obtenir le total, en utilisant la fonction sum() (remarquez par contre l'option na.rm!)


# La fonction summarise() permet d'obtenir les statistiques descriptives de notre choix.
# Les résultats seront affichés dans la console.
# Exemple 1:Quel est le nombre moyen de cas pour les adultes?
summarise(tb_data, mean_adult = mean(adult, na.rm = T))
# Exemple 2: Quel est le nombre moyen de cas pour les adultes, ainsi que l'écart-type ("standard deviation")?
summarise(tb_data, 
  mean_adult = mean(adult, na.rm =T), 
  sd = sd(adult, na.rm =T))
# Exemple 3: nombre de pays, moyenne des adultes, nombre total d'observations, nombre de valeurs manquantes
  # pour les audltes, nombres de valeurs non-manquantes pour les adultes.
summarise(tb_data, 
  country_count = n_distinct(country), 
  mean = mean(adult, na.rm = T), 
  n = n(), 
  miss = sum(is.na(adult) ), 
  not_missing = sum(!is.na(adult)) )




