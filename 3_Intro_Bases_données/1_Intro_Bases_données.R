#############################################################
## Bases (tables) de donn�es
## Intro � R/RStudio Avril 2020
#############################################################


# 1. Explorons les bases des... bases de donn�es! 
# Les bases de donn�es peuvent �tre vues comme un regroupement de vecteurs. Ceci permet aussi de mettre en contexte
# (et en application!) ce qui a �t� vu dans les portions pr�c�dentes du cours.
# D�butons simplement en cr�ant des donn�es en combinant des vecteurs gr�ce � la fonction data.frame().
# Note importante: les vecteurs doivent ABSOLUMENT avoir le m�me nombre d'�l�ments.

ma_bd <- data.frame(
        nom = c("John","Paul","Ringo","Georges"),
        naissance = c(1940, 1954, 2017, 2011),
        instrument = c("voix", "basse", "batterie", "guitare")
)


# Il existe plusieurs fonctions d�j� int�gr�es dans R qui permettent d'�valuer rapidement vos donn�es.
View(ma_bd)     # ouvre la base dans la fen�tre sup�rieure (attention, le V est en majuscules!). 
                # vous pouvez aussi cliquer sur la base dans l'environment window (� droite).

names(ma_bd)    # donne le nom des colonnes (fonctionne autant sur les bases de donn�es que les matrices)
colnames(ma_bd) # donne le nom des colonnes (fonctionne uniquement sur les bases de donn�es et non les matrices)
                # Cette distinction peut devenir importante, mais dans le cadre du cours les deux fonctions sont interchangeables
head(ma_bd)     # Montre les 10 premi�res rang�es de la base de donn�es
                # Le nombre de rang�es s'ajuste facilement, simplement rajouter une virgule et le nombre voulu apr�s le nom de la bd
tail(ma_bd)     # Montre les 10 DERNI�RES rang�es de la bd. Le nombre de rang�es s'ajuste, exactement comme pour head()
dim(ma_bd)      # Indique les dimensions (nombre de rang�es, nombre de colonnes)
str(ma_bd)      # STRucture de la bd. Indique le nom des variables, leur type, et les premi�res observations
summary(ma_bd)  # Donne quelques statistiques descriptives sur les variables, telles que: 
                # min, max, m�diane et quartiles sur les variables num�riques, et des comptes pour les variables caract�res


# On remarque, gr�ce � la fonction str(), que R a consid�r� les variables caract�res comme des facteurs. 
# Consid�rant que l'utilisation des facteurs est plus d�licat (et qu'ils ne sont pas n�cessaires ici), reconvertissons-les en caract�res.
# Il suffit d'utiliser l'option StringsAsFactors dans la fonction data.frame().

ma_bd <- data.frame(
        nom = c("John","Paul","Ringo","Georges"),
        naissance = c(1940, 1954, 2017, 2011),
        instrument = c("voix", "basse", "batterie", "guitare"), stringsAsFactors = F
)

str(ma_bd) # voyons la diff�rence!



# Partie 2: sauvegarder et lire des bases de donn�es en .csv

write.csv(ma_bd, "ma_bd.csv")   # La fonction write.csv() permet de sauvegarder une base de donn�es
                                # en format .csv sur votre ordinateur. L'endroit ou il sera sauvegard� d�pend de votre configuration.
                                # � moins d'avoir mis en place un Project, le fichier sera enregistr� dans le dossier "Home" 
                                        # (voir la fen�tre inf�rieure � droite - il y a de bonnes chances que ce soit le dossier "Mes documents"/"My documents")
                                        # pour changer le dossier par d�faut, dans l'onglet Files de la fen�tre inf�rieure droite
                                        # naviguez jusqu'au dossier de votre choix, ensuite cliquez sur l'ic�ne d'engrenage bleu (More)
                                        # et choisissez Set As Working Directory


data1 <- read.csv(file.choose())  # Pour lire ("importer") un fichier .csv, l'on doit tout d'abord sp�cifier le nom (dans ce cas-ci, data1)
                                  # et utiliser la fonction read.csv(file.choose()). Ceci fera appara�tre une fen�tre (si elle n'appara�t pas directement, regardez 
                                  # au bas de l'�cran sur la barre d'ic�nes! Naviguez jusqu'au fichier que vous voulez lire.

        
# Partie 3 : Retirer et effacer des objets de la fen�tre Global environment
# Pour retirer des objets (vecteurs, bases de donn�es, etc.), il suffit d'utiliser la fonction rm().

rm(x)   # pour retirer l'objet nomm� "x" 
rm(tes_lettres, mes_lettres, ma_bd)     # pour retirer plusieurs objets, il suffit de tous les inscrire, s�par�s par une virgule
rm(list = ls()) # pour retirer l'ENSEMBLE des objets de la fen�tre. 
# ATTENTION : une fois un objet retir�, la seule fa�on de le retrouver est de r�-ex�cuter le code.


# Il y a plusieurs bases de donn�es d'int�gr�es et de disponible via R, tr�s pratiques pour entre autres la pratique,
# ou encore tester notre code et flow. 

airquality
cars
DNase
library(help = "datasets")  # cette ligne de code vous donnera la liste compl�te!
