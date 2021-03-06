#############################################################
## Importer diff�rents types de donn�es 
## Intro � R/RStudio Avril 2020
#############################################################

# Importer des donn�es en R est habituellement tr�s simple!


# Partie 1. Fichiers textes ("flat text files") 
# Il y a plusieurs fonctions d'int�g�res en R pour vous aider � importer des donn�es.
# L'exemple ci-bas en montre deux (read.table(), read.csv()).
# Ces deux autres fonctions peuvent �tre pratiques si jamais vous avez des donn�es non-standard:
# read.delim()
# readLines()   N'oubliez pas que vous pouvez acc�der facilement � l'aide en ajoutant un ? devant la fonction!

mon_csv = read.table("5_Pr�paration_Donn�es\\test_data\\tb.csv", sep = ",", header = T)
mon_csv = read.csv("5_Pr�paration_Donn�es\\test_data\\tb.csv", sep = "," , header = T, quote = "\"", na.strings = c("NA", " ", "999"), stringsAsFactors = F)
# n'oubliez pas de soit mettre le chemin d'acc�s complet, ou de d�finir votre projet, ou de d�finir le dossier de travail
# Ceci permettra � R de trouver le fichier.
class(mon_csv$pays)

# Partie 2. Comment importer un fichier excel 
# Pour une importation simple, vous pouvez essayer avec la librarie "readxl".

install.packages("readxl")
library(readxl)

mon_excel = read_excel("5_Pr�paration_Donn�es\\test_data\\tb.xlsx", sheet = "tb")


# Partie 3. SPSS et SAS 
# Il y a quelques packages qui permettent d'importer directement des fichiers sas.
install.packages("Hmisc")
install.packages("haven")
install.packages("foreign")
install.packages("tidyr")

library(haven)
library(dplyr)

test_sas = read_sas("5_Pr�paration_Donn�es\\test_data\\fake_census_test_file.sas7bdat")



# Si vous pr�f�rez le "point-and-click", n'h�sitez pas � explorer le "Import Dataset" qui se trouve dans le haut
# dans la fen�tre Global Envionment (� droite). Suivez les instructions!
# Par contre, notez que ceci ne laisse pas de traces donc la reproductibilit� peut �tre compromise.
