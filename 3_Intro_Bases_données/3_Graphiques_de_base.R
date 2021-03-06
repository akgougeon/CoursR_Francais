#############################################################
## Graphiques de base
## Intro � R/RStudio Avril 2020
#############################################################
# https://r4ds.had.co.nz/transform.html#select


# "The simple graph has brought more information to the data analyst's mind than any other device." John Tukey


# Dans cette section, nous allons explorer les graphiques disponibles directement dans R.
# Ces graphiques sont tr�s pratiques pour explorer rapidement les donn�es.
# La cr�ation de graphiques, complets, personnalis�s, complexes, et de haute qualit� par l'entremise de ggplot2 sera vue plus tard

# Quelques exemples de graphiques de disponibles. N'ex�cutez pas ces lignes, 
# il manque de l'information!
boxplot() # diagramme en barres et moustaches ("boxplots") 
hist() # histogramme
plot() # nuage de points ("scatterplot")
barplot() # diagramme � barres
pie() # graphique circulaire ("pie chart")


# Utilisons la base de donn�es airquality pour explorer ces graphiques
head(airquality) # Que contient cette base de donn�es? Rappellez-vous: la fonction head() imprimera les 10 premi�res rang�es de la base de donn�es


# Partie 1. Diagramme en bo�tes et moustaches ("boxplots")
# Utilisons le diagramme en bo�tes et moustaches pour voir la distribution de 4 variables: Ozone, Solar.R, Wind, Temp
# Voyez comment nous utilisons l'extraction de ces variables comme premier argument de la fonction boxplot().

boxplot(x =  airquality[,1:4],
        main='Plusieurs diagrammes en b&m')
# Remarquez que le r�sultat ne s'imprime pas dans la console, mais bien dans l'onglets Plots de la fen�tre � droite!


# Nous pouvons �tre plus sp�cifique et demander la distribution des variables d'une seule variable (axe des y)
# regroup�es selon les valeurs d'une autre variable (axe des x).
# Nous pouvons aussi d�finir les �tiquettes et les couleurs pour notre graphique.
boxplot(Temp~Month,
        data=airquality,
        main="B&M de temp�rature pour chaque mois",
        xlab="Mois (nombre)",
        ylab="Farhenheit",
        col="orange",
        border="brown"
)

?boxplot # On peut utiliser la fonction d'aide pour explorer la documentation reli�e � cette fonction.
# Quelle serait l'option � utiliser afin d'avoir des bo�tes horizontales?


# Partie 2. Histogramme
# Modifier le nombre de cat�gories ('bins') est probablement la modification la plus fr�quente pour ce type de graphique.
# L'argument breaks permet de modifier le nombre de cat�gories.
hist(airquality$Temp) # Pour cr�er l'histogramme avec toutes les valeurs par d�faut, il suffit d'indiquer
                      # dans la parenth�se, la base de donn�es et la variable � visualiser (s�par�s d'un $)
hist(airquality$Temp, breaks=4, main="avec breaks=4") 
        # Ici nous avons chang� le nombre de cat�gories. Attention: breaks ("cassures") ne ref�re pas au nombre de cat�gories,
        # mais bien au nombre de "cassures". Ainsi, on doit mettre le nombre de cat�gories d�sir� moins un.
hist(airquality$Temp, breaks=20, main="avec breaks=20") # Ici, nous allons obtenir 21 barres.

# Remarquez que les graphiques apparaissent toujours au m�me endroit. Heureusement, un nouveau graphique ne supprime pas les anciens.
# On peut naviguer entre les graphiques simplement en cliquant sur les fl�ches bleues en haut � gauche des graphiques.


# Partie 3. Diagramme � barres
# Les diagrammes � barres sont g�n�ralement utilis�s pour illustrer les comptes par groupe, ou encore des estim�s de mod�les
# avec des barres d'�cart-type ou d'erreur-type.
# Identifions le nombre de journ�es dans chaque mois ou la temp�rature quotidienne a �t� sup�rieure 
# � 30 degr�s Celsius.

# Tout d'abord, puisque les temp�ratures sont en Fahrenheit, convertissons en Celsius.

airquality$TempC = (airquality$Temp - 32) * 5/9 

summary(airquality) # Regardons le sommaire de la base de donn�es

# Ici, � titre d'exemple, nous cr�eons avec la fonction table() l'objet jour, qui est un tableau 
# comportant le nombre de fois que chaque mois appara�t dans la base de donn�es
jours = table(airquality$Month)
jours

# On peut rajouter des conditions � la fonction. Nous voulons uniquement les jours o� 
# la temp�rature est sup�rieure � 30C. On obtient ceci gr�ce � l'extraction!
faitchaud_compte = table(airquality$Month[airquality$TempC> 30])
faitchaud_compte
# faitchaud_compte sera l'objet que nous utiliserons pour cr�er notre diagramme � barres!

barplot(faitchaud_compte,
        main="Nombre de jours par mois � temp�rature sup�rieure � 30C",
        xlab="Mois (nombre)",
        ylab="Degr�s Celsius")


# Partie 4. Graphiques circulaires ("pie charts") 
# Bien que g�n�ralement ce type de graphique n'est pas recommand� pour l'analyse, il est facile � cr�er.
# Faisons-en un de la distribution des jours chauds par mois.
pie(faitchaud_compte)

?pie


# Partie 5. Le nuage de point est certes la visualisation la plus utile et efficace lorsque l'on veut
# comparer deux variables quantitatives. 
# Cr�eons un nuage de point pour �valuer sommairement s'il y a une association entre la concentration
# en ozone et la temp�rature.

plot(x = airquality$TempC, 
        y= airquality$Ozone,
        xlab="Temperature Celsius",
        ylab="Concentration ozone")


# Puisque nous sommes des analystes, nous voulons aller un peu plus loin et effectuer une r�gression lin�aire
# pour tester l'hypoth�se qu'il y a une relation entre la concentration de l'ozone et la temp�rature quotidienne.
# Nous pouvons utiliser la fonction lm() pour ceci ("linear model").
# Prenons quelques instant pour explorer les r�sultats du mod�le.
ozone_temp = lm(airquality$Ozone~airquality$TempC)
summary(ozone_temp)


plot(x = airquality$TempC, 
        y= airquality$Ozone,
        xlab="Temperature Celsius",
        ylab="Ozone Concentration")

title("Relation entre temp�rature et ozone")
abline(reg = ozone_temp) #ajoute la droite de r�gression telle que mod�lis�e
abline( h = mean(airquality$Ozone, na.rm  = T),col="red") 
                # ajoute la moyenne des concentrations. 
                # Remarquez l'utilisation de h =. Ceci indique que vous d�sirez une ligne Horizontale
                # L'option na.rm = T enl�ve les valeurs manquantes
abline( v = mean(airquality$TempC, na.rm  = T),col="blue")
                # ajoute la moyenne des temp�ratures. 
                # Remarquez l'utilisation de v =. Ceci indique que vous d�sirez une ligne Verticale
                # L'option na.rm = T enl�ve les valeurs manquantes