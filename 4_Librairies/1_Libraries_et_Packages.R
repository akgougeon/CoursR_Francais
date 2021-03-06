#############################################################
## Librairies et "packages" 
## Intro � R/RStudio Avril 2020
#############################################################

# Un des avantages majeurs de R c'est que plusieurs fonctions et algorithmes courants ont �t� regroup�s en "packages"
# Un "package" (paquet?), c'est une collection de fonctions, donn�es, et compilation de code tous bien organis�s dans un format bien d�fini.
# Le r�pertoire dans lequel sont regroup�s les packages est appel� une librarie ("library").
# R nous est livr� avec un ensemble standard de packages.
# Jusqu'� maintenant, nous avons utilis� et parl� uniquement de la version de base de R.
# Nous n'avons pas eu � charger/t�l�charger les fonctions que nous avons utilis�, puisqu'elles sont int�gr�es dans la version de base de R.
# Par contre, il y a une pl�thore de packages de disponibles � t�l�charger et installer!
# L'installation ne se fait qu'une seule fois sur un ordinateur donn�e, et ensuite le package est pr�t � �tre utilis�.
# Pour l'utiliser, vous devez simplement l'indiquer dans votre code - c'est-�-dire appeler le package.
# � l'ext�rieur de STATSCAN il est tr�s simple de t�l�charger un package, tant que vous avez une
# connection internet. 
# � STATSCAN, pour des raisons de s�curit�, IT a mis en place un r�pertoire dans lequel se trouve une s�rie
# de packages test�s, v�rifi�s, et consid�r�s s�cures. Quelques �tapes sont n�cessaires pour y acc�der. Vous trouverez�
# dans les ressources du cours la marche � suivre.

# Dans la derni�re d�cennie, le nombre de packages de disponible a explos�...
# Il peut donc sembler difficile, voire impossible, de trouver package � son pied.
# Par contre, les packages largement utilis�s pour l'analyse de donn�es sont tous trouv�s dans ce qui est appel� 
# le "tidyverse" (contraction de tidy (propre) et universe (univers)).
# Le "tidyverse" est une s�rie de packages qui travaillent bien ensemble puisqu'ils ont plusieurs param�tres et configurations en commun.
# Ainsi, ces packages facilite et "acc�l�re" les t�ches typiques d'analyse de donn�es.


# Installons et appelons trois des packages du tidyverse, que nous utiliserons pour la suite du cours.
# dplyr, tidyr, and ggplot2

install.packages("dplyr") # la fonction install.packages n'a qu'� �tre utilis�e une seule fois par package.
                          # Elle fait le lien avec le CRAN ("mirroir") de R en ligne, et t�l�charge et installe le package sur l'ordinateur
install.packages("tidyr")
install.packages("ggplot2")

# Une fois que les packages sont install�s, nous devons les appeler afin de les utiliser. Ceci doit �tre 
# fait � chaque fois que nous ouvrons une session sur R.
library(dplyr)
library(tidyr)
library(ggplot2)

