#############################################################
## Quelques fonctions et constantes int�gr�es en R
## Intro � R/RStudio Avril 2020
#############################################################

# Constantes int�gr�es dans R. 

LETTERS    # toutes les lettres de l'alphabet (en MAJUSCULES)
letters    # toutes les lettres de l'alphabet (en minuscules)
month.abb  # les 12 mois de l'ann�e, version abreg�e (trois premi�res lettres, en anglais)
month.name # les 12 mois de l'ann�e, version compl�te (en anglais)
pi         # s'explique par lui-m�me :)

# Vous pouvez utiliser ?nom_de_la_fonction afin d'obtenir de la documentation sur la fonction.
# �videmment ceci implique que vous connaissiez le nom de la fonction recherch�e!
# Chaque page de documentation est divis�e en sections:
# Description: Une description compl�te de ce qu'effectue la fonction
# Usage: Les arguments utilis�s dans la fonction et leur valeur par d�faut
# Arguments: Une explication des donn�es/valeurs attendues pour chaque argument
# Details: Indique des d�tails importants � conna�tre
# Value: Indique ce que la fonction retourne
# See Also: D'autres fonctions semblables ou reli�es qui pourraient vous int�resser
# Examples: Quelques exemples d'utilisation de la fonction
?mean

# https://www.statmethods.net/management/functions.html



# 1. Manipulations simple de vecteurs/objets de type caract�re

# Ex�cutez les 5 lignes de code suivantes si vous d�sirez ex�cuter les exemples
str1 = "one"
str2 = "two"
x = c("a", "b", "v")
y = c("1", "2", "3")
mon_nom = "Marie Antoinette"


# La fonction paste() peut �tre utilis�e pour fusionner / joindre des suites de caract�res
paste(str1, str2, sep = '_')  
paste(x, y, sep = '_')   # L'option sep indique le s�parateur
paste(x, collapse = ' ') # L'option collapse indique que l'on veut rassembler des �l�ments


# Les fonctions grep() et grepl() trouvent les expressions correspondantes dans un objet
grep("a", x)  # retourne l'index de positionnement d'un �l�ment de vecteur qui correspond au(x) crit�re(s).
grepl("a", x) # retourne une s�rie de TRUE et de FALSE indiquant pour chaque �l�ment s'il correspond au(x) crit�re(s).


# La fonction gsub() remplace tout �l�ment correspondant au(x) crit�re(s)
gsub("a", "my_change", x)


# Quelques fonctions pour modifier la casse
toupper(x) # Convertit en majuscule (l'�quivalent de upcase en SAS)
tolower(x) # Convertit en minuscule


# La fonction nchar() retourne le nombre de caract�res pour chaque �l�ment dans un vecteur/objet
nchar(x) 


# La fonction strsplit() divise les �l�ments d'un objet/vecteur caract�re.
strsplit(mon_nom, " ")	



# Cr�ation de vecteurs : seq() et rep()
seq(2, 3, by=0.5) # seq() cr�e une s�quence de nombre. Suffit d'indiquer les bornes (inclusif) et l'intervalle. L'intervalle par d�faut est 1
rep(1:2, times=3) # rep() cr�e aussi une s�quence, mais bas�e sur la r�p�tition. Ici, on r�p�te 1 et 2 trois fois (1 2 1 2 1 2)
rep(1:2, each=3)  # m�me id�e ici, mais avec l'option each au lieu d'alterner chaque nombre est r�p�t� individuellement (1 1 1 2 2 2)



# Fonctions math�matiques
# Ex�cutez les trois lignes de code suivantes  si vous d�sirez ex�cuter les exemples
x <- c(6,8,8,4,2,8,9,6) # cr�ation d'un vecteur d'objet num�rique - tr�s pratique pour tester les fonctions!
y <- x*3  # cr�ation d'un deuxi�me vecteur. Chaque valeur de x sera multipli�e par 3
n <- 1    # cr�ation d'un objet � �l�ment unique. 

sin(x)      # Fonction sinus
log(x)      # Log naturel
sum(x)      # Somme
exp(x)      # Fonction exponentielle 
mean(x)     # Moyenne
median(x)   # M�diane
sqrt(x)     # Racine carr�e
max(x)      # Retourne le plus grand �l�ment de l'objet 
min(x)      # Retourne le plus petit �l�ment de l'objet 
range(x)    # Retourne le minimum ET le maximum de l'objet
quantile(x) # Quantiles
quantile(x, 0.15) # Percentile(s) sp�cifique(s)
round(x, n) # Arrondit � n d�cimales
rank(x)     # Retourne les rangs des �l�ments une fois class�s en ordre croissant
var(x)      # Variance
cor(x, y)   # Corr�lation entre deux objets 
sd(x)       # L'�cart-type ("standard deviation")


# Distribution normale
n <- 1    # cr�ation d'un objet � �l�ment unique.
rnorm(n, m=0,sd=1)  # Extraction d'un �chantillond de taille quelconque (ici n, valeur d�termin�e plus haut!), 
                    # d'une distribution normale avec moyenne et �cart-type pr�-d�termin�s (moyenne ---> m = 0, �cart-type ---> sd = 1)
rnorm(50, m=50, sd=10) # Extraction d'un �chantillon de 50 �l�ments d'une distribution normale avec une moyenne de 50 et un �cart-type de 10


# Graphiques de base
x <- c(6,8,8,4,2,8,9,6) # cr�ation de l'objet x (d�j� cr�� plus haut, mais vous pouvez tout de m�me ex�cuter la ligne)
plot(x)   # fera un nuage de points simple: valeurs de x (sur l'axe des y (ordonn�es)) et leur index (positionnement, sur l'axe des x (abscisse)) 
plot(x,y) # fera un nuage de points simple: valeurs de x sur l'axe des x (abscisses) et valeurs de y sur l'axe des y (ordonn�es)
hist(x)   # histogramme des valeurs de x


# �chantillonnage d'observations
sample(seq(40,400,10),size=10, replace = T) # �chantillonner 10 valeurs, avec remplacement, dans l'intervalle 40-400





