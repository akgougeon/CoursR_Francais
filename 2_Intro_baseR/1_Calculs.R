#############################################################
## Calculs de base en R 
## Intro � R/RStudio Avril 2020
#############################################################


# Ce script passe en revue les concepts suivants:
# Partie 1. Op�rateurs arithm�tiques
# Partie 2. Op�rateurs logiques
# Partie 3. Constantes courantes incluses dans R

# Mat�riel de r�f�rence (en anglais seulement)
# https://www.datacamp.com/courses/free-introduction-to-r
# https://www.statmethods.net/management/operators.html



# Partie 1. Op�rateurs arithm�tiques. 
# R peut effectuer toutes sortes de calculs math�matiques.

+ # addition
- # soustraction
* # multiplication
/ # division
^ or ** #exposants
x %/% y # division enti�re ("integer division")
x %% y # reste de la division

# Ex�cuter les lignes de codes suivantes pour des exemples. 
# Pour ex�cuter ces lignes, placez le curseur sur la ligne et tapez cntl+retour ("enter")
# Le r�sultat s'affichera dans la console. 
# Vous pouvez aussi retaper (ou copier-coller) les lignes dans la console. En tapant retour ("enter"),
#   le r�sultat s'affichera aussi dans la console

4/5

2 + 5 

2-5

5/2 # division normale

5%/%2 # division enti�re ("integer division")

5%%2 # reste de la division

200^0.5 # racine carr�e

3+9*2000 # ex�cutez cette ligne - vous verrez que R respecte l'ordre des op�rations�
         # et ce m�me sans parenth�ses

log(1) # fonctions logarithmiques

exp(0.5) # fonctions exponentielles 


# Partie 2. Op�rateurs logiques 

# Comme tout autre langage de programmation, R peut effectuer des comparaisons logiques
 ==   # est �gal � (attention, il s'agit bien de == et non pas de = uniquement)
<     # plus petit que
<=    # plus petit ou �gal �
>     # plus grand que
>=    # plus grand ou �gal �
!=    # n'est pas �gal �
!x    # pas x
x | y # x ou y
X & y # x et y

isTRUE(x) # teste si x est vrai
        
# Ex�cutez les lignes de code suivantes pour des exemples.      
1 == 4 

"y" == "y"

"y" == "g"

x = c(1:10)
# Note: la notation c() indique une fonction. Les fonctions seront vues plus tard.
# Plus pr�cis�ment, c() est une fonction de concat�nation. Dans ce cas-ci, la fonction c(1:10)
# cr�era un objet nomm� x, qui contiendra toutes les valeurs de 1 � 10. 
# Ex�cutez la ligne, vous verrez appara�tre dans la fen�tre "Global Environment"
# x (� gauche) et ses valeurs (� droite).


x>8
# En ex�cutant la ligne ci-dessus, vous verrez dans la console une s�rie de TRUE (vrai)
# et de FALSE (faux). L'ordre est important, il fait r�f�rence � l'ordre des valeurs
# dans l'objet nomm� x (cr�� dans la ligne plus haut). Ainsi, dans cet exemple, toutes les valeurs de l'objet x
# plus grands que 8 (donc 9 et 10) seront associ�es � un VRAI, les autres � FAUX.


# Partie 3. Constantes communes incluses dans R
# Ex�cutez les lignes de codes suivantes, le r�sultat sera affich� dans la console
pi          # le bon vieux pi. R affichera uniquement les 6 premi�res d�cimales
LETTERS     # toutes les lettres de l'alphabet, en MAJUSCULES
letters     # toutes les lettres de l'alphabet, en minuscules
month.abb   # les trois premi�res lettres des douze mois de l'ann�e (en anglais)
month.name  # les douze mois de l'ann�e (en anglais)



