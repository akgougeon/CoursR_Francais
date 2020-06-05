#############################################################
## Introduction à ggplot2
## Intro à R/RStudio Avril 2020
#############################################################
# Ressources:
# https://ggplot2-book.org/

# Rappel: il est de bon usage de mettre au début de votre script les librairies que vous allez utiliser.
# Ici, nous avons besoin de ggplot2 et dplyr
library(ggplot2) # ggplot2 est la librairie qui comporte les fonctions pour faire les graphiques
library(dplyr) # nous appelons dplyr puisqu'elle contient la base de données intégrée que nous allons utiliser.

# Débutons par une exploration sommaire de la base de données mpg (miles per gallon)

head(mpg) # rappel: les 6 premières observations de la base de données
unique(mpg$class) # rappel: quelles sont les valeurs uniques de la variable class de la base mpg

# Descriptif des variables: 
# cty: milles au gallon en conduite de ville
# hwy: milles au gallon en conduite sur autoroute
# displ: déplacement du moteur, en litres
# drv: groupe motopropulseur
        # avec 3 valeurs possibles: f -roues avant (front wheel), r -roues arrière (rear wheel),ou 4 -4 roues motrices
# model: modèle de l'automobile 
        # 38 valeurs possibles
#class: "type" de voiture (par ex.: deux places, VUS, compact, etc.)
        # 7 valeurs possibles


# Tout graphique ggplot doit être vu comme une superposition d'éléments:
        ## 1. données: définir la base de données source (élément 1) 
        ## 2. esthétique: mélangeant, parce qu'on ne parle pas ici de l'esthétique (style, couleurs, etc.)
                # mais bien de quelles variables seront utilisées pour faire le graphique!(élément 2)
        ## 3. couches: c'est ici que l'on définit de quoi aura l'air le graphique. Géométrie (point, ligne, etc.),
                # étiquettes, couleurs, légende, annotation, etc. etc. etc. (élément 3)


# Débutons par le tout début: définir le premier élément (base de données source) ---> élément 1
ggplot(data =mpg) # il ne semble pas se passer grand chose... mais oui! regarder l'onglet "plots" à droite.
                  # Un "graphique" vide. C'est normal, tout ce que nous avons fait c'est d'indiquer à R que
                  # nous voulons éventuellement faire un graphique avec les données de mpg. Mais on n'a rien
                  # indiqué de plus, alors on a un résultat "vide".

# Rajoutons le 2ème élément: l'esthétique (aesthetic, en anglais), ou, si vous préférez, les variables du graphique
ggplot(data = mpg, aes(x = displ, y =hwy))
        # Vous voyez? nous avons maintenant la base de notre graphique : la base de données, et ce qui sera mis
        # sur l'axe des x et l'axe des y. Bien sûr il n'y a rien d'autre, nous n'avons pas spécifié les couches encore!)


# Continuons! Rajoutons une première couche, la géométrie. Faisons ici un nuage de point (scatter plot)
ggplot(data = mpg, aes(x = displ, y = hwy)) +  
        geom_point()       
        # Notez l'utilisation du signe +. On peut lire ceci comme étant "rajoute cette couche à mes éléments de base"


# Si vous filez plus fatigué/efficace/paresseux, vous pouvez omettre de coder data =, x = , et y =. Ça fonctionnera quand même!
ggplot(mpg, aes(displ, hwy)) +
        geom_point() 


# Encore plus de geoms!
# Il y a plusieurs fonctions geom_. Vous en trouverez certaines ci-bas.

# Nous nous concentrerons uniquement sur certaines d'entre elles pendant notre exploration de ggplot.

# geom_point() : nuage de points
# geom_smooth() : inserera une ligne de tendance à travers les données, ainsi que son erreur-type)
# geom_jitter() : pour un nuage de points. rajoutera un petit écart de taille aléatoire afin de 
                 # limiter la superposition des points 
# geom_boxplot() : diagramme en boîtes et moustaches (boxplot) avec quartiles 
# geom_violin :  diagramme en violon
# geom_histogram() : 
# geom_freqpoly() :
# geom_density()
# geom_bar()
# geom_path()
# geom_line()



# Faisons un test avec geom_line: 
ggplot(mpg, aes(displ, hwy)) +
        geom_line() 


# Et maintenant illustrons la relation entre le déplacement (displacement) et la consommation sur autoroute.
# Sur ce graphique, nous rajouterons la droite de régression linéaire.
# Il est possible de rajouter des droites de régression avec un "fit" plus robuste basé sur des algorithmes et modèles
# additifs généralisés (generalized additive models), mais vous aurez besoin d'avoir installé les packages qui peuvent
# effectuer ces procédures statistiques tels que MASS et mgcv. À vous d'explorer!

ggplot(mpg, aes(displ, hwy)) + 
        geom_point() + 
        geom_smooth(method  = "lm")
        # Remarquez encore ici : un premier + pour indiquer que nous voulons des points, un 2ème pour ajouter une 
        # 2ème couche d'information (la droite)


# Les histogrammes
# Faisons un histogram avec les valeurs de consommation d'essence sur autoroute
ggplot(mpg, aes(hwy)) + geom_histogram() # même idée, on indique la base de données, la variable, et on ajoute une couche


ggplot(mpg, aes(hwy)) + geom_histogram() + stat_bin(bins = 45)  
        # Nous pouvons ajouter une couche pour indiquer comment de barres nous voulons dans l'histogramme



# Soyons créatifs! Personnalisons nos graphiques

# Ajoutons un titre et les étiquettes pour les axes 
ggplot(mpg, aes(cty, hwy)) +
        geom_point() +
        ggtitle("Relation entre consommation de ville vs autoroute", subtitle = "Ce que vous voulez!") +
        xlab("conduite de ville (mpg)") + 
        ylab("conduite d'autoroute (mpg)") 
        # On garde EXACTEMENT la même logique... pour chaque élément ajouté, on l'indique avec un +


# Vous pouvez aussi assigner votre graphique à un objet (ici, hwy_cty), et l'utiliser plus tard.
hwy_cty = ggplot(mpg, aes(cty, hwy)) +
        geom_point() +
        ggtitle("Utilisez plus tard!", subtitle = "-mais c'est le même graphique-") +
        xlab("conduite de ville (mpg)") + 
        ylab("conduite d'autoroute (mpg)") 


hwy_cty


# Couleurs, forme, et grosseur des points
ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue") #change la couleur des points
ggplot(mpg, aes(displ, hwy)) + geom_point(shape = 9) #change la forme des points.
ggplot(mpg, aes(displ, hwy)) + geom_point(size = 1.2) #change la taille

ggplot(mpg, aes(displ, hwy)) + geom_point(colour = 'blue', shape = 7, size =2)
        # on peut bien sûr combiner!


# Couleurs, forme, et grosseur selon une variable 
ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point() 
        # changer la couleur selon les valeurs de la variable class
ggplot(mpg, aes(displ, hwy, colour = class, shape = drv)) + geom_point() 
        # changer la forme des points selon les valeurs de la variable drv
        # (et aussi les couleurs selon la variable class)
ggplot(mpg, aes(displ, hwy, size = cyl)) + geom_point()
        # ou encore, la taille des points selon la variable cyl





# Thèmes: Il existe plusieurs thèmes pré-définis, et vous pouvez créer les vôtres. 
# Vous trouverez les thèmes prédéfinis ici : https://ggplot2.tidyverse.org/reference/ggtheme.html 
# Comment les personnaliser : https://ggplot2.tidyverse.org/reference/theme.html

# Voici deux thèmes très utilisés et pratiques: 

hwy_cty + theme_bw() # on vous l'avait dit que ça pouvait être pratique d'assigner 
                     # votre graphique à un objet ;)
hwy_cty + theme_classic()


# Voyons comment personnaliser certains éléments du thème 
hwy_cty +
        theme(panel.background = element_rect(fill = "purple", colour = "grey50"), 
                panel.grid.major.y = element_blank(), 
                plot.background = element_rect(fill = "green"),
                plot.title = element_text(color="red", size=14, face="bold",hjust = 0.5), 
               plot.subtitle = element_text(color="purple", size=14, face="bold.italic",hjust = 0.5),
                axis.title.x = element_text(color="blue", size=14, face="bold"), 
                axis.title.y = element_text(color="#993333", size=14, face="bold"))


# Ouf! Ça fait mal aux yeux... et on n'a plus besoin des graphiques.
# La fonction dev.off() réinitialisera le panel Plots (de manière permanente!)
dev.off()



# "Facettage"
# Le facettage divise les données en sous-groupes et crée le même graphique pour chaque sous-groupe.
# Il y a deux types de facettage : grid (grille) et wrapped (enveloppé?)
# 

# Wrap sera plus utile si vous avez une seule variable de type catégorie. 
        # Vous obtiendrez un "panneau" pour chaque valeur de la variable. 
# Grid sera parfait si vous voulez avoir des graphiques divisés par deux variables de type catégorie.

# To facet a plot you simply add a facetting specification with facet_wrap(), which takes the name of a variable preceded by ~.

ggplot(mpg, aes(displ, hwy)) + # les points représenteront les valeurs de déplacement par consommation sur autoroute
        geom_point() + 
        facet_wrap(~class, nrow = 2) # un graphique pour chaque valeur de class, mis sur 2 rangées

ggplot(mpg, aes(displ, cty)) + # les points représenteront les valeurs de déplacement par consommation en ville
        geom_point() + 
        facet_grid(vars(drv), vars(cyl)) # un graphique pour chaque combinaison de propulsion et nombre de cylindres

