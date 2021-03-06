#############################################################
## Excercices ggplot avec r�ponses
## Intro � R/RStudio mai 2020
#############################################################

#  Premi�re partie: pour les exercices suivant, utilisez la base de donn�es mpg retrouv� dans dplyr

#  Q1. Visualisez la relation entre cty (le kilom�trage moyen en ville) et hwy (le kilom�trage moyen sur les autoroutes)
#  R1:
ggplot(mpg, aes(cty, hwy)) + 
  geom_point()

#  Q2. Colorez les points d'apr�s les diff�rents niveaux de la variable nomm�e class 
#  R2:
ggplot(mpg, aes(cty, hwy, colour = class)) + 
  geom_point()

#  Q3. Examinez comment la distribution de hwy (le kilom�trage moyen sur les autoroutes) varie selon le drv (syst�me d'ensemble motopropulseur)
#  Commencez en analysant une variable � la fois
#  R3:
ggplot(mpg, aes(hwy)) + 
  geom_histogram()

ggplot(mpg, aes(drv, hwy)) + 
  geom_boxplot()

#  Q4. Combien d'enregistrement sont disponible pour chaque constructeur automobile de la base de donn�es ?
#  R4:
ggplot(mpg, aes(manufacturer)) + 
  geom_bar()

#  Deuxi�me partie: Explorez https://ggplot2.tidyverse.org/reference/economics.html 
#  en utilisant la base de donn�es economics 

#  Q1. Se familiariser avec la base de donn�es. Il y a combien do colonnes et de lignes ?
# Quelle est la classe de chaque variable ?

dim(economics) #le nombre de colonnes et lignes
str(economics)
class(economics$date)

# La base de donn�es economics comprends les variables:
# date - mois de la collection des donn�es
# psavert - le taux d'�pargne des particuliers
# pce - d�penses li�es � la consommation des m�nages en milliards de dollars
# unemploy - nombre de ch�meurs en milliers
# unempmed - dur�e m�diane du ch�mage en semaines
# pop - population totale en milliers

head(economics)


#  Q2. Visuaisez le taux de ch�mage (nombre de ch�meurs / population)
ggplot(economics, aes(date, unemploy / pop)) +
  geom_line()

# ou vous pouvez cr�er une nouvelle variable
economics = economics %>% mutate(unemprate = unemploy / pop)

ggplot(economics, aes(date, unemprate)) +
  geom_line()



#  Q3. Changez le th�me (les �l�ments visuels) du graphique.
# Ajoutez un titre. Changez l'indication de l'axe vertical � "Taux de ch�mage" et de l'axe horizontal � "Date"

range(economics$date)
ggplot(economics, aes(date, unemprate)) +
  geom_line() +
  xlab("Date") + 
  ylab("Unemployment Rate") +
  ggtitle("Variability in unemployment rate from 1967 to 2015") +
  theme(panel.background = element_rect(fill = "white",
                                        colour = "black",
                                        size = 0.5, linetype = "solid"))
dev.off()



