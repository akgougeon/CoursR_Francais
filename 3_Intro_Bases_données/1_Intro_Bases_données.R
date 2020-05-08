#############################################################
## Bases (tables) de données
## Intro à R/RStudio Avril 2020
#############################################################


# 1. Explorons les bases des... bases de données! 
# Les bases de données peuvent être vues comme un regroupement de vecteurs. Ceci permet aussi de mettre en contexte
# (et en application!) ce qui a été vu dans les portions précédentes du cours.
# Débutons simplement en créant des données en combinant des vecteurs grâce à la fonction data.frame().
# Note importante: les vecteurs doivent ABSOLUMENT avoir le même nombre d'éléments.

ma_bd <- data.frame(
        nom = c("John","Paul","Ringo","Georges"),
        naissance = c(1940, 1954, 2017, 2011),
        instrument = c("voix", "basse", "batterie", "guitare")
)


# Il existe plusieurs fonctions déjà intégrées dans R qui permettent d'évaluer rapidement vos données.
View(ma_bd)     # ouvre la base dans la fenêtre supérieure (attention, le V est en majuscules!). 
                # vous pouvez aussi cliquer sur la base dans l'environment window (à droite).

names(ma_bd)    # donne le nom des colonnes (fonctionne autant sur les bases de données que les matrices)
colnames(ma_bd) # donne le nom des colonnes (fonctionne uniquement sur les bases de données et non les matrices)
                # Cette distinction peut devenir importante, mais dans le cadre du cours les deux fonctions sont interchangeables
head(ma_bd)     # Montre les 10 premières rangées de la base de données
                # Le nombre de rangées s'ajuste facilement, simplement rajouter une virgule et le nombre voulu après le nom de la bd
tail(ma_bd)     # Montre les 10 DERNIÈRES rangées de la bd. Le nombre de rangées s'ajuste, exactement comme pour head()
dim(ma_bd)      # Indique les dimensions (nombre de rangées, nombre de colonnes)
str(ma_bd)      # STRucture de la bd. Indique le nom des variables, leur type, et les premières observations
summary(ma_bd)  # Donne quelques statistiques descriptives sur les variables, telles que: 
                # min, max, médiane et quartiles sur les variables numériques, et des comptes pour les variables caractères


# On remarque, grâce à la fonction str(), que R a considéré les variables caractères comme des facteurs. 
# Considérant que l'utilisation des facteurs est plus délicat (et qu'ils ne sont pas nécessaires ici), reconvertissons-les en caractères.
# Il suffit d'utiliser l'option StringsAsFactors dans la fonction data.frame().

ma_bd <- data.frame(
        nom = c("John","Paul","Ringo","Georges"),
        naissance = c(1940, 1954, 2017, 2011),
        instrument = c("voix", "basse", "batterie", "guitare"), stringsAsFactors = F
)

str(ma_bd) # voyons la différence!



# Partie 2: sauvegarder et lire des bases de données en .csv

write.csv(ma_bd, "ma_bd.csv")   # La fonction write.csv() permet de sauvegarder une base de données
                                # en format .csv sur votre ordinateur. L'endroit ou il sera sauvegardé dépend de votre configuration.
                                # À moins d'avoir mis en place un Project, le fichier sera enregistré dans le dossier "Home" 
                                        # (voir la fenêtre inférieure à droite - il y a de bonnes chances que ce soit le dossier "Mes documents"/"My documents")
                                        # pour changer le dossier par défaut, dans l'onglet Files de la fenêtre inférieure droite
                                        # naviguez jusqu'au dossier de votre choix, ensuite cliquez sur l'icône d'engrenage bleu (More)
                                        # et choisissez Set As Working Directory


data1 <- read.csv(file.choose())  # Pour lire ("importer") un fichier .csv, l'on doit tout d'abord spécifier le nom (dans ce cas-ci, data1)
                                  # et utiliser la fonction read.csv(file.choose()). Ceci fera apparaître une fenêtre (si elle n'apparaît pas directement, regardez 
                                  # au bas de l'écran sur la barre d'icônes! Naviguez jusqu'au fichier que vous voulez lire.

        
# Partie 3 : Retirer et effacer des objets de la fenêtre Global environment
# Pour retirer des objets (vecteurs, bases de données, etc.), il suffit d'utiliser la fonction rm().

rm(x)   # pour retirer l'objet nommé "x" 
rm(tes_lettres, mes_lettres, ma_bd)     # pour retirer plusieurs objets, il suffit de tous les inscrire, séparés par une virgule
rm(list = ls()) # pour retirer l'ENSEMBLE des objets de la fenêtre. 
# ATTENTION : une fois un objet retiré, la seule façon de le retrouver est de ré-exécuter le code.


# Il y a plusieurs bases de données d'intégrées et de disponible via R, très pratiques pour entre autres la pratique,
# ou encore tester notre code et flow. 

airquality
cars
DNase
library(help = "datasets")  # cette ligne de code vous donnera la liste complète!
