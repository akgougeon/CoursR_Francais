#############################################################
## Quelques fonctions et constantes intégrées en R
## Intro à R/RStudio Avril 2020
#############################################################

# Constantes intégrées dans R. 

LETTERS    # toutes les lettres de l'alphabet (en MAJUSCULES)
letters    # toutes les lettres de l'alphabet (en minuscules)
month.abb  # les 12 mois de l'année, version abregée (trois premières lettres, en anglais)
month.name # les 12 mois de l'année, version complète (en anglais)
pi         # s'explique par lui-même :)

# Vous pouvez utiliser ?nom_de_la_fonction afin d'obtenir de la documentation sur la fonction.
# Évidemment ceci implique que vous connaissiez le nom de la fonction recherchée!
# Chaque page de documentation est divisée en sections:
# Description: Une description complète de ce qu'effectue la fonction
# Usage: Les arguments utilisés dans la fonction et leur valeur par défaut
# Arguments: Une explication des données/valeurs attendues pour chaque argument
# Details: Indique des détails importants à connaître
# Value: Indique ce que la fonction retourne
# See Also: D'autres fonctions semblables ou reliées qui pourraient vous intéresser
# Examples: Quelques exemples d'utilisation de la fonction
?mean

# https://www.statmethods.net/management/functions.html



# 1. Manipulations simple de vecteurs/objets de type caractère

# Exécutez les 5 lignes de code suivantes si vous désirez exécuter les exemples
str1 = "one"
str2 = "two"
x = c("a", "b", "v")
y = c("1", "2", "3")
mon_nom = "Marie Antoinette"


# La fonction paste() peut être utilisée pour fusionner / joindre des suites de caractères
paste(str1, str2, sep = '_')  
paste(x, y, sep = '_')   # L'option sep indique le séparateur
paste(x, collapse = ' ') # L'option collapse indique que l'on veut rassembler des éléments


# Les fonctions grep() et grepl() trouvent les expressions correspondantes dans un objet
grep("a", x)  # retourne l'index de positionnement d'un élément de vecteur qui correspond au(x) critère(s).
grepl("a", x) # retourne une série de TRUE et de FALSE indiquant pour chaque élément s'il correspond au(x) critère(s).


# La fonction gsub() remplace tout élément correspondant au(x) critère(s)
gsub("a", "my_change", x)


# Quelques fonctions pour modifier la casse
toupper(x) # Convertit en majuscule (l'équivalent de upcase en SAS)
tolower(x) # Convertit en minuscule


# La fonction nchar() retourne le nombre de caractères pour chaque élément dans un vecteur/objet
nchar(x) 


# La fonction strsplit() divise les éléments d'un objet/vecteur caractère.
strsplit(mon_nom, " ")	



# Création de vecteurs : seq() et rep()
seq(2, 3, by=0.5) # seq() crée une séquence de nombre. Suffit d'indiquer les bornes (inclusif) et l'intervalle. L'intervalle par défaut est 1
rep(1:2, times=3) # rep() crée aussi une séquence, mais basée sur la répétition. Ici, on répète 1 et 2 trois fois (1 2 1 2 1 2)
rep(1:2, each=3)  # même idée ici, mais avec l'option each au lieu d'alterner chaque nombre est répété individuellement (1 1 1 2 2 2)



# Fonctions mathématiques
# Exécutez les trois lignes de code suivantes  si vous désirez exécuter les exemples
x <- c(6,8,8,4,2,8,9,6) # création d'un vecteur d'objet numérique - très pratique pour tester les fonctions!
y <- x*3  # création d'un deuxième vecteur. Chaque valeur de x sera multipliée par 3
n <- 1    # création d'un objet à élément unique. 

sin(x)      # Fonction sinus
log(x)      # Log naturel
sum(x)      # Somme
exp(x)      # Fonction exponentielle 
mean(x)     # Moyenne
median(x)   # Médiane
sqrt(x)     # Racine carrée
max(x)      # Retourne le plus grand élément de l'objet 
min(x)      # Retourne le plus petit élément de l'objet 
range(x)    # Retourne le minimum ET le maximum de l'objet
quantile(x) # Quantiles
quantile(x, 0.15) # Percentile(s) spécifique(s)
round(x, n) # Arrondit à n décimales
rank(x)     # Retourne les rangs des éléments une fois classés en ordre croissant
var(x)      # Variance
cor(x, y)   # Corrélation entre deux objets 
sd(x)       # L'écart-type ("standard deviation")


# Distribution normale
n <- 1    # création d'un objet à élément unique.
rnorm(n, m=0,sd=1)  # Extraction d'un échantillond de taille quelconque (ici n, valeur déterminée plus haut!), 
                    # d'une distribution normale avec moyenne et écart-type pré-déterminés (moyenne ---> m = 0, écart-type ---> sd = 1)
rnorm(50, m=50, sd=10) # Extraction d'un échantillon de 50 éléments d'une distribution normale avec une moyenne de 50 et un écart-type de 10


# Graphiques de base
x <- c(6,8,8,4,2,8,9,6) # création de l'objet x (déjà créé plus haut, mais vous pouvez tout de même exécuter la ligne)
plot(x)   # fera un nuage de points simple: valeurs de x (sur l'axe des y (ordonnées)) et leur index (positionnement, sur l'axe des x (abscisse)) 
plot(x,y) # fera un nuage de points simple: valeurs de x sur l'axe des x (abscisses) et valeurs de y sur l'axe des y (ordonnées)
hist(x)   # histogramme des valeurs de x


# Échantillonnage d'observations
sample(seq(40,400,10),size=10, replace = T) # échantillonner 10 valeurs, avec remplacement, dans l'intervalle 40-400





