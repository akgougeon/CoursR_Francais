#############################################################
## Importer différents types de données 
## Intro à R/RStudio Avril 2020
#############################################################

# Importer des données en R est habituellement très simple!


# Partie 1. Fichiers textes ("flat text files") 
# Il y a plusieurs fonctions d'intégéres en R pour vous aider à importer des données.
# L'exemple ci-bas en montre deux (read.table(), read.csv()).
# Ces deux autres fonctions peuvent être pratiques si jamais vous avez des données non-standard:
# read.delim()
# readLines()   N'oubliez pas que vous pouvez accéder facilement à l'aide en ajoutant un ? devant la fonction!

mon_csv = read.table("5_Préparation_Données\\test_data\\tb.csv", sep = ",", header = T)
mon_csv = read.csv("5_Préparation_Données\\test_data\\tb.csv", sep = "," , header = T, quote = "\"", na.strings = c("NA", " ", "999"), stringsAsFactors = F)
# n'oubliez pas de soit mettre le chemin d'accès complet, ou de définir votre projet, ou de définir le dossier de travail
# Ceci permettra à R de trouver le fichier.
class(mon_csv$pays)

# Partie 2. Comment importer un fichier excel 
# Pour une importation simple, vous pouvez essayer avec la librarie "readxl".

install.packages("readxl")
library(readxl)

mon_excel = read_excel("5_Préparation_Données\\test_data\\tb.xlsx", sheet = "tb")


# Partie 3. SPSS et SAS 
# Il y a quelques packages qui permettent d'importer directement des fichiers sas.
install.packages("Hmisc")
install.packages("haven")
install.packages("foreign")
install.packages("tidyr")

library(haven)
library(dplyr)

test_sas = read_sas("5_Préparation_Données\\test_data\\fake_census_test_file.sas7bdat")



# Si vous préférez le "point-and-click", n'hésitez pas à explorer le "Import Dataset" qui se trouve dans le haut
# dans la fenêtre Global Envionment (à droite). Suivez les instructions!
# Par contre, notez que ceci ne laisse pas de traces donc la reproductibilité peut être compromise.
