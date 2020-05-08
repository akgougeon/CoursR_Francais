#############################################################
## Calculs de base en R 
## Intro à R/RStudio Avril 2020
#############################################################


# Ce script passe en revue les concepts suivants:
# Partie 1. Opérateurs arithmétiques
# Partie 2. Opérateurs logiques
# Partie 3. Constantes courantes incluses dans R

# Matériel de référence (en anglais seulement)
# https://www.datacamp.com/courses/free-introduction-to-r
# https://www.statmethods.net/management/operators.html



# Partie 1. Opérateurs arithmétiques. 
# R peut effectuer toutes sortes de calculs mathématiques.

+ # addition
- # soustraction
* # multiplication
/ # division
^ or ** #exposants
x %/% y # division entière ("integer division")
x %% y # reste de la division

# Exécuter les lignes de codes suivantes pour des exemples. 
# Pour exécuter ces lignes, placez le curseur sur la ligne et tapez cntl+retour ("enter")
# Le résultat s'affichera dans la console. 
# Vous pouvez aussi retaper (ou copier-coller) les lignes dans la console. En tapant retour ("enter"),
#   le résultat s'affichera aussi dans la console

4/5

2 + 5 

2-5

5/2 # division normale

5%/%2 # division entière ("integer division")

5%%2 # reste de la division

200^0.5 # racine carrée

3+9*2000 # exécutez cette ligne - vous verrez que R respecte l'ordre des opérationsà
         # et ce même sans parenthèses

log(1) # fonctions logarithmiques

exp(0.5) # fonctions exponentielles 


# Partie 2. Opérateurs logiques 

# Comme tout autre langage de programmation, R peut effectuer des comparaisons logiques
 ==   # est égal à (attention, il s'agit bien de == et non pas de = uniquement)
<     # plus petit que
<=    # plus petit ou égal à
>     # plus grand que
>=    # plus grand ou égal à
!=    # n'est pas égal à
!x    # pas x
x | y # x ou y
X & y # x et y

isTRUE(x) # teste si x est vrai
        
# Exécutez les lignes de code suivantes pour des exemples.      
1 == 4 

"y" == "y"

"y" == "g"

x = c(1:10)
# Note: la notation c() indique une fonction. Les fonctions seront vues plus tard.
# Plus précisément, c() est une fonction de concaténation. Dans ce cas-ci, la fonction c(1:10)
# créera un objet nommé x, qui contiendra toutes les valeurs de 1 à 10. 
# Exécutez la ligne, vous verrez apparaître dans la fenêtre "Global Environment"
# x (à gauche) et ses valeurs (à droite).


x>8
# En exécutant la ligne ci-dessus, vous verrez dans la console une série de TRUE (vrai)
# et de FALSE (faux). L'ordre est important, il fait référence à l'ordre des valeurs
# dans l'objet nommé x (créé dans la ligne plus haut). Ainsi, dans cet exemple, toutes les valeurs de l'objet x
# plus grands que 8 (donc 9 et 10) seront associées à un VRAI, les autres à FAUX.


# Partie 3. Constantes communes incluses dans R
# Exécutez les lignes de codes suivantes, le résultat sera affiché dans la console
pi          # le bon vieux pi. R affichera uniquement les 6 premières décimales
LETTERS     # toutes les lettres de l'alphabet, en MAJUSCULES
letters     # toutes les lettres de l'alphabet, en minuscules
month.abb   # les trois premières lettres des douze mois de l'année (en anglais)
month.name  # les douze mois de l'année (en anglais)



