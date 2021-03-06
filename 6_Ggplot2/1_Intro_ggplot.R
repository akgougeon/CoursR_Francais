#############################################################
## Introduction � ggplot2
## Intro � R/RStudio Avril 2020
#############################################################
# Ressources:
# https://ggplot2-book.org/

# Rappel: il est de bon usage de mettre au d�but de votre script les librairies que vous allez utiliser.
# Ici, nous avons besoin de ggplot2 et dplyr
library(ggplot2) # ggplot2 est la librairie qui comporte les fonctions pour faire les graphiques
library(dplyr) # nous appelons dplyr puisqu'elle contient la base de donn�es int�gr�e que nous allons utiliser.

# D�butons par une exploration sommaire de la base de donn�es mpg (miles per gallon)

head(mpg) # rappel: les 6 premi�res observations de la base de donn�es
unique(mpg$class) # rappel: quelles sont les valeurs uniques de la variable class de la base mpg

# Descriptif des variables: 
# cty: milles au gallon en conduite de ville
# hwy: milles au gallon en conduite sur autoroute
# displ: d�placement du moteur, en litres
# drv: groupe motopropulseur
        # avec 3 valeurs possibles: f -roues avant (front wheel), r -roues arri�re (rear wheel),ou 4 -4 roues motrices
# model: mod�le de l'automobile 
        # 38 valeurs possibles
#class: "type" de voiture (par ex.: deux places, VUS, compact, etc.)
        # 7 valeurs possibles


# Tout graphique ggplot doit �tre vu comme une superposition d'�l�ments:
        ## 1. donn�es: d�finir la base de donn�es source (�l�ment 1) 
        ## 2. esth�tique: m�langeant, parce qu'on ne parle pas ici de l'esth�tique (style, couleurs, etc.)
                # mais bien de quelles variables seront utilis�es pour faire le graphique!(�l�ment 2)
        ## 3. couches: c'est ici que l'on d�finit de quoi aura l'air le graphique. G�om�trie (point, ligne, etc.),
                # �tiquettes, couleurs, l�gende, annotation, etc. etc. etc. (�l�ment 3)


# D�butons par le tout d�but: d�finir le premier �l�ment (base de donn�es source) ---> �l�ment 1
ggplot(data =mpg) # il ne semble pas se passer grand chose... mais oui! regarder l'onglet "plots" � droite.
                  # Un "graphique" vide. C'est normal, tout ce que nous avons fait c'est d'indiquer � R que
                  # nous voulons �ventuellement faire un graphique avec les donn�es de mpg. Mais on n'a rien
                  # indiqu� de plus, alors on a un r�sultat "vide".

# Rajoutons le 2�me �l�ment: l'esth�tique (aesthetic, en anglais), ou, si vous pr�f�rez, les variables du graphique
ggplot(data = mpg, aes(x = displ, y =hwy))
        # Vous voyez? nous avons maintenant la base de notre graphique : la base de donn�es, et ce qui sera mis
        # sur l'axe des x et l'axe des y. Bien s�r il n'y a rien d'autre, nous n'avons pas sp�cifi� les couches encore!)


# Continuons! Rajoutons une premi�re couche, la g�om�trie. Faisons ici un nuage de point (scatter plot)
ggplot(data = mpg, aes(x = displ, y = hwy)) +  
        geom_point()       
        # Notez l'utilisation du signe +. On peut lire ceci comme �tant "rajoute cette couche � mes �l�ments de base"


# Si vous filez plus fatigu�/efficace/paresseux, vous pouvez omettre de coder data =, x = , et y =. �a fonctionnera quand m�me!
ggplot(mpg, aes(displ, hwy)) +
        geom_point() 


# Encore plus de geoms!
# Il y a plusieurs fonctions geom_. Vous en trouverez certaines ci-bas.

# Nous nous concentrerons uniquement sur certaines d'entre elles pendant notre exploration de ggplot.

# geom_point() : nuage de points
# geom_smooth() : inserera une ligne de tendance � travers les donn�es, ainsi que son erreur-type)
# geom_jitter() : pour un nuage de points. rajoutera un petit �cart de taille al�atoire afin de 
                 # limiter la superposition des points 
# geom_boxplot() : diagramme en bo�tes et moustaches (boxplot) avec quartiles 
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


# Et maintenant illustrons la relation entre le d�placement (displacement) et la consommation sur autoroute.
# Sur ce graphique, nous rajouterons la droite de r�gression lin�aire.
# Il est possible de rajouter des droites de r�gression avec un "fit" plus robuste bas� sur des algorithmes et mod�les
# additifs g�n�ralis�s (generalized additive models), mais vous aurez besoin d'avoir install� les packages qui peuvent
# effectuer ces proc�dures statistiques tels que MASS et mgcv. � vous d'explorer!

ggplot(mpg, aes(displ, hwy)) + 
        geom_point() + 
        geom_smooth(method  = "lm")
        # Remarquez encore ici : un premier + pour indiquer que nous voulons des points, un 2�me pour ajouter une 
        # 2�me couche d'information (la droite)


# Les histogrammes
# Faisons un histogram avec les valeurs de consommation d'essence sur autoroute
ggplot(mpg, aes(hwy)) + geom_histogram() # m�me id�e, on indique la base de donn�es, la variable, et on ajoute une couche


ggplot(mpg, aes(hwy)) + geom_histogram() + stat_bin(bins = 45)  
        # Nous pouvons ajouter une couche pour indiquer comment de barres nous voulons dans l'histogramme



# Soyons cr�atifs! Personnalisons nos graphiques

# Ajoutons un titre et les �tiquettes pour les axes 
ggplot(mpg, aes(cty, hwy)) +
        geom_point() +
        ggtitle("Relation entre consommation de ville vs autoroute", subtitle = "Ce que vous voulez!") +
        xlab("conduite de ville (mpg)") + 
        ylab("conduite d'autoroute (mpg)") 
        # On garde EXACTEMENT la m�me logique... pour chaque �l�ment ajout�, on l'indique avec un +


# Vous pouvez aussi assigner votre graphique � un objet (ici, hwy_cty), et l'utiliser plus tard.
hwy_cty = ggplot(mpg, aes(cty, hwy)) +
        geom_point() +
        ggtitle("Utilisez plus tard!", subtitle = "-mais c'est le m�me graphique-") +
        xlab("conduite de ville (mpg)") + 
        ylab("conduite d'autoroute (mpg)") 


hwy_cty


# Couleurs, forme, et grosseur des points
ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue") #change la couleur des points
ggplot(mpg, aes(displ, hwy)) + geom_point(shape = 9) #change la forme des points.
ggplot(mpg, aes(displ, hwy)) + geom_point(size = 1.2) #change la taille

ggplot(mpg, aes(displ, hwy)) + geom_point(colour = 'blue', shape = 7, size =2)
        # on peut bien s�r combiner!


# Couleurs, forme, et grosseur selon une variable 
ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point() 
        # changer la couleur selon les valeurs de la variable class
ggplot(mpg, aes(displ, hwy, colour = class, shape = drv)) + geom_point() 
        # changer la forme des points selon les valeurs de la variable drv
        # (et aussi les couleurs selon la variable class)
ggplot(mpg, aes(displ, hwy, size = cyl)) + geom_point()
        # ou encore, la taille des points selon la variable cyl





# Th�mes: Il existe plusieurs th�mes pr�-d�finis, et vous pouvez cr�er les v�tres. 
# Vous trouverez les th�mes pr�d�finis ici : https://ggplot2.tidyverse.org/reference/ggtheme.html 
# Comment les personnaliser : https://ggplot2.tidyverse.org/reference/theme.html

# Voici deux th�mes tr�s utilis�s et pratiques: 

hwy_cty + theme_bw() # on vous l'avait dit que �a pouvait �tre pratique d'assigner 
                     # votre graphique � un objet ;)
hwy_cty + theme_classic()


# Voyons comment personnaliser certains �l�ments du th�me 
hwy_cty +
        theme(panel.background = element_rect(fill = "purple", colour = "grey50"), 
                panel.grid.major.y = element_blank(), 
                plot.background = element_rect(fill = "green"),
                plot.title = element_text(color="red", size=14, face="bold",hjust = 0.5), 
               plot.subtitle = element_text(color="purple", size=14, face="bold.italic",hjust = 0.5),
                axis.title.x = element_text(color="blue", size=14, face="bold"), 
                axis.title.y = element_text(color="#993333", size=14, face="bold"))


# Ouf! �a fait mal aux yeux... et on n'a plus besoin des graphiques.
# La fonction dev.off() r�initialisera le panel Plots (de mani�re permanente!)
dev.off()



# "Facettage"
# Le facettage divise les donn�es en sous-groupes et cr�e le m�me graphique pour chaque sous-groupe.
# Il y a deux types de facettage : grid (grille) et wrapped (envelopp�?)
# 

# Wrap sera plus utile si vous avez une seule variable de type cat�gorie. 
        # Vous obtiendrez un "panneau" pour chaque valeur de la variable. 
# Grid sera parfait si vous voulez avoir des graphiques divis�s par deux variables de type cat�gorie.

# To facet a plot you simply add a facetting specification with facet_wrap(), which takes the name of a variable preceded by ~.

ggplot(mpg, aes(displ, hwy)) + # les points repr�senteront les valeurs de d�placement par consommation sur autoroute
        geom_point() + 
        facet_wrap(~class, nrow = 2) # un graphique pour chaque valeur de class, mis sur 2 rang�es

ggplot(mpg, aes(displ, cty)) + # les points repr�senteront les valeurs de d�placement par consommation en ville
        geom_point() + 
        facet_grid(vars(drv), vars(cyl)) # un graphique pour chaque combinaison de propulsion et nombre de cylindres

