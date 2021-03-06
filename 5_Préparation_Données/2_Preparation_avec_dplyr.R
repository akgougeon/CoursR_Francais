#############################################################
## Premiers pas avec dplyr 
## Intro � R/RStudio avril 2020
#############################################################
# Ressources (en anglais seulement):
# https://github.com/rstudio/EDAWR


# Un haut pourcentage des t�ches de la majorit� des analystes et scientifiques de donn�es est attribuable 
# � la pr�paration pr�liminaire des donn�es ("data wrangling").

# Il y a deux composantes � la pr�paration des donn�es:
# 1. Manipulation:
    # Changer les variables, valeurs, unit�s, identifier les valeurs extr�mes et les erreurs

# 2. Nettoyage:
    # Modifier la "mise en page" pour rendre possible l'analyse et les visualisations
    # Par exemple, vous pourriez vouloir transformer des donn�es �tendues ("wide data") en donn�es 
    # allong�es ("long data") pour pouvoir cr�er un mod�le mixte avec des estim�s d'erreur

# Il y deux packages qui facilitent la pr�paration de donn�es, qui proviennent du tidyverse (voir le cours pr�c�dant sur les libraries): 
        # 1. dplyr
        # 2. tidyr


# Nous allons nous concentrer sur dplyr. Comme nous l'avons d�j� install� dans une session pr�c�dente, 
# nous n'avons qu'� l'appeler : 
library(dplyr)



# Intro � dplyr
# dplyr contient 5 fonctions qui rendent la manipulation de donn�es tr�s facile. Notez que dplyr 
# comporte beaucoup plus que ces 5 fonctions, mais nous ne pr�senterons que celles-ci.
## 1) filter : s�lectionne des rang�es 
## 2) select : s�lectionne des colonnes (variables)
## 3) arrange : trie, en ordre descendant ou ascendant, les donn�es
## 4) mutate : cr�� de nouvelles variables
## 5) summarise : r�sume l'information


# Pour la suite de l'exercice, nous allons utiliser des donn�es sur la tuberculose de l'OMS.
# Elles proviennent de microdonn�es sur chaque cas de tuberculose confirm�, incluant l'ann�e, le pays, et le sexe.

tb_data <- read.csv("5_Pr�paration_Donn�es\\donnees\\tb.csv", stringsAsFactors = F, header = T)



# d�butez toujours par apprendre � conna�tre les donn�es:
summary(tb_data)  # quelques statistiques descriptives
str(tb_data)      # la structre des donn�es (type, et quelques valeurs)
colnames(tb_data) # le nom des variables

counts <- table(tb_data$sexe) # variable cr��e pour faire un diagramme � barre (nb de cas par pays)

hist(tb_data$enfants, breaks = 50, xlab = "Enfants") #Nombre de nouveaux cas pour les personnes �g�es de 0 � 14 ans
hist(tb_data$adultes) #Nombre de nouveaux cas pour les personnes �g�es de 15 � 64 ans
hist(tb_data$pers_agees) #Nombre de nouveaux cas pour les personnes �g�es de plus de 64 ans

hist(tb_data$pers_agees[tb_data$pers_agees<20000]) 
   


# Explorer la base de donn�es avec ces 5 fonctions.

# Filter (filtre): 
  # S�lectionons les taux de tuberculose aux �tats-Unis
US_data = filter(tb_data, pays == "United States of America" )
  # S�lectionons les taux de tuberculose aux �tats-Unis, o� des adultes ont �t� contamin�s
US_data = filter(tb_data, pays == "United States of America" & adultes >0 ) # on peut combiner des crit�res!
  # S�lectionons les taux de tuberculose aux �tats-Unis et au Y�men (en utilisant... OU)
US_data = filter(tb_data, pays == "United States of America" | pays == "Yemen" ) # combiner avec OU
  # S�lectionons les observations o� les pays contiennent le mot "United"
  # grepl() est une fonction permettant de trouver une expression dans des valeurs de variables caract�res
  # grepl() est tr�s pratique, mais on doit faire attention... les r�sultats peuvent contenir de mauvaises surprises
US_data = filter(tb_data, grepl("United", pays))


# Select:  cette fonction s�lectionne les colonnes (et non pas les rang�es)
# S�lectionons la colonne nomm�e "adult" (n'oubliez pas que R est sensible � la casse!)
mes_colonnes =  c("adultes", "enfants", "pers_agees") # voyez comme ceci ne fait que cr�er un objet vecteur... �a n'extraie pas les colonnes de la base de donn�es
cas_adultes = select(US_data, adultes, enfants, pers_agees) # mais ceci, oui!




# La fonction arrange() trie en ordre ascendant
cas_adultes = arrange(cas_adultes, adultes)
# On peut sp�cifier si l'on veut trier en ordre descendant, et aussi trier sur plus d'une variable
cas_adultes = arrange(cas_adultes, desc(adultes), enfants)



# La fonction mutate() cr�� une nouvelle variable. Revenons � la base de donn�es compl�te des cas 
# de tuberculose et ajoutons une variable qui est le total des cas

tb_data = mutate(tb_data, total = adultes + enfants + pers_agees)
# simple, non?

# on peut cr�er plusieurs variables d'un seul coup, il suffit de les s�parer par une virgule
tb_data = mutate(tb_data, 
                 adultes_2 = adultes/5*9, 
                 moyenne = mean(adultes, na.rm = T)) # rappel: l'option na.rm indique si l'on veut retirer les valeurs
                                        # manquantes d'un calcul. Par d�faut, elles sont conserv�es... mais �a
                                        # va retourner une erreur puisque R ne peut calculer une moyenne, par exemple,
                                        # avec des valeurs manquantes. 
                                        # na.rm ---> NA REMOVE


tb_data = mutate(tb_data, somme = sum(adultes, enfants, pers_agees, na.rm = T))
  # une autre mani�re d'obtenir le total, en utilisant la fonction sum() (remarquez par contre l'option na.rm!)


# La fonction summarise() permet d'obtenir les statistiques descriptives de notre choix.
# Les r�sultats seront affich�s dans la console.
# Exemple 1:Quel est le nombre moyen de cas pour les adultes?
summarise(tb_data, moyenne_adultes = mean(adultes, na.rm = T))
# Exemple 2: Quel est le nombre moyen de cas pour les adultes, ainsi que l'�cart-type ("standard deviation")?
summarise(tb_data, 
  moyenne_adultes = mean(adultes, na.rm =T), 
  ecart_type = sd(adultes, na.rm =T))
# Exemple 3: nombre de pays, moyenne des adultes, nombre total d'observations, nombre de valeurs manquantes
  # pour les audltes, nombres de valeurs non-manquantes pour les adultes.
summarise(tb_data, 
  compte_pays = n_distinct(pays), 
  moyenne = mean(adultes, na.rm = T), 
  n = n(), 
  manquant = sum(is.na(adultes) ), 
  non_manquant = sum(!is.na(adultes)) )




