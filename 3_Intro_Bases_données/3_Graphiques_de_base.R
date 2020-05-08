#############################################################
## Graphiques de base
## Intro à R/RStudio Avril 2020
#############################################################
# https://r4ds.had.co.nz/transform.html#select


# "The simple graph has brought more information to the data analyst's mind than any other device." John Tukey


# Dans cette section, nous allons explorer les graphiques disponibles directement dans R.
# Ces graphiques sont très pratiques pour explorer rapidement les données.
# La création de graphiques, complets, personnalisés, complexes, et de haute qualité par l'entremise de ggplot2 sera vue plus tard

# Quelques exemples de graphiques de disponibles. N'exécutez pas ces lignes, 
# il manque de l'information!
boxplot() # diagramme en barres et moustaches ("boxplots") 
hist() # histogramme
plot() # nuage de points ("scatterplot")
barplot() # diagramme à barres
pie() # graphique circulaire ("pie chart")


# Utilisons la base de données airquality pour explorer ces graphiques
head(airquality) # Que contient cette base de données? Rappellez-vous: la fonction head() imprimera les 10 premières rangées de la base de données


# Partie 1. Diagramme en boîtes et moustaches ("boxplots")
# Utilisons le diagramme en boîtes et moustaches pour voir la distribution de 4 variables: Ozone, Solar.R, Wind, Temp
# Voyez comment nous utilisons l'extraction de ces variables comme premier argument de la fonction boxplot().

boxplot(x =  airquality[,1:4],
        main='Plusieurs diagrammes en b&m')
# Remarquez que le résultat ne s'imprime pas dans la console, mais bien dans l'onglets Plots de la fenêtre à droite!


# Nous pouvons être plus spécifique et demander la distribution des variables d'une seule variable (axe des y)
# regroupées selon les valeurs d'une autre variable (axe des x).
# Nous pouvons aussi définir les étiquettes et les couleurs pour notre graphique.
boxplot(Temp~Month,
        data=airquality,
        main="B&M de température pour chaque mois",
        xlab="Mois (nombre)",
        ylab="Farhenheit",
        col="orange",
        border="brown"
)

?boxplot # On peut utiliser la fonction d'aide pour explorer la documentation reliée à cette fonction.
# Quelle serait l'option à utiliser afin d'avoir des boîtes horizontales?


# Partie 2. Histogramme
# Modifier le nombre de catégories ('bins') est probablement la modification la plus fréquente pour ce type de graphique.
# L'argument breaks permet de modifier le nombre de catégories.
hist(airquality$Temp) # Pour créer l'histogramme avec toutes les valeurs par défaut, il suffit d'indiquer
                      # dans la parenthèse, la base de données et la variable à visualiser (séparés d'un $)
hist(airquality$Temp, breaks=4, main="avec breaks=4") 
        # Ici nous avons changé le nombre de catégories. Attention: breaks ("cassures") ne refère pas au nombre de catégories,
        # mais bien au nombre de "cassures". Ainsi, on doit mettre le nombre de catégories désiré moins un.
hist(airquality$Temp, breaks=20, main="avec breaks=20") # Ici, nous allons obtenir 21 barres.

# Remarquez que les graphiques apparaissent toujours au même endroit. Heureusement, un nouveau graphique ne supprime pas les anciens.
# On peut naviguer entre les graphiques simplement en cliquant sur les flèches bleues en haut à gauche des graphiques.


# Partie 3. Diagramme à barres
# Les diagrammes à barres sont généralement utilisés pour illustrer les comptes par groupe, ou encore des estimés de modèles
# avec des barres d'écart-type ou d'erreur-type.
# Identifions le nombre de journées dans chaque mois ou la température quotidienne a été supérieure 
# à 30 degrés Celsius.

# Tout d'abord, puisque les températures sont en Fahrenheit, convertissons en Celsius.

airquality$TempC = (airquality$Temp - 32) * 5/9 

summary(airquality) # Regardons le sommaire de la base de données

# Ici, à titre d'exemple, nous créeons avec la fonction table() l'objet jour, qui est un tableau 
# comportant le nombre de fois que chaque mois apparaît dans la base de données
jours = table(airquality$Month)
jours

# On peut rajouter des conditions à la fonction. Nous voulons uniquement les jours où 
# la température est supérieure à 30C. On obtient ceci grâce à l'extraction!
faitchaud_compte = table(airquality$Month[airquality$TempC> 30])
faitchaud_compte
# faitchaud_compte sera l'objet que nous utiliserons pour créer notre diagramme à barres!

barplot(faitchaud_compte,
        main="Nombre de jours par mois à température supérieure à 30C",
        xlab="Mois (nombre)",
        ylab="Degrés Celsius")


# Partie 4. Graphiques circulaires ("pie charts") 
# Bien que généralement ce type de graphique n'est pas recommandé pour l'analyse, il est facile à créer.
# Faisons-en un de la distribution des jours chauds par mois.
pie(faitchaud_compte)

?pie


# Partie 5. Le nuage de point est certes la visualisation la plus utile et efficace lorsque l'on veut
# comparer deux variables quantitatives. 
# Créeons un nuage de point pour évaluer sommairement s'il y a une association entre la concentration
# en ozone et la température.

plot(x = airquality$TempC, 
        y= airquality$Ozone,
        xlab="Temperature Celsius",
        ylab="Concentration ozone")


# Puisque nous sommes des analystes, nous voulons aller un peu plus loin et effectuer une régression linéaire
# pour tester l'hypothèse qu'il y a une relation entre la concentration de l'ozone et la température quotidienne.
# Nous pouvons utiliser la fonction lm() pour ceci ("linear model").
# Prenons quelques instant pour explorer les résultats du modèle.
ozone_temp = lm(airquality$Ozone~airquality$TempC)
summary(ozone_temp)


plot(x = airquality$TempC, 
        y= airquality$Ozone,
        xlab="Temperature Celsius",
        ylab="Ozone Concentration")

title("Relation entre température et ozone")
abline(reg = ozone_temp) #ajoute la droite de régression telle que modélisée
abline( h = mean(airquality$Ozone, na.rm  = T),col="red") 
                # ajoute la moyenne des concentrations. 
                # Remarquez l'utilisation de h =. Ceci indique que vous désirez une ligne Horizontale
                # L'option na.rm = T enlève les valeurs manquantes
abline( v = mean(airquality$TempC, na.rm  = T),col="blue")
                # ajoute la moyenne des températures. 
                # Remarquez l'utilisation de v =. Ceci indique que vous désirez une ligne Verticale
                # L'option na.rm = T enlève les valeurs manquantes