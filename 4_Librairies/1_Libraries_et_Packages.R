#############################################################
## Librairies et "packages" 
## Intro à R/RStudio Avril 2020
#############################################################

# Un des avantages majeurs de R c'est que plusieurs fonctions et algorithmes courants ont été regroupés en "packages"
# Un "package" (paquet?), c'est une collection de fonctions, données, et compilation de code tous bien organisés dans un format bien défini.
# Le répertoire dans lequel sont regroupés les packages est appelé une librarie ("library").
# R nous est livré avec un ensemble standard de packages.
# Jusqu'à maintenant, nous avons utilisé et parlé uniquement de la version de base de R.
# Nous n'avons pas eu à charger/télécharger les fonctions que nous avons utilisé, puisqu'elles sont intégrées dans la version de base de R.
# Par contre, il y a une pléthore de packages de disponibles à télécharger et installer!
# L'installation ne se fait qu'une seule fois sur un ordinateur donnée, et ensuite le package est prêt à être utilisé.
# Pour l'utiliser, vous devez simplement l'indiquer dans votre code - c'est-à-dire appeler le package.
# À l'extérieur de STATSCAN il est très simple de télécharger un package, tant que vous avez une
# connection internet. 
# À STATSCAN, pour des raisons de sécurité, IT a mis en place un répertoire dans lequel se trouve une série
# de packages testés, vérifiés, et considérés sécures. Quelques étapes sont nécessaires pour y accéder. Vous trouverezà
# dans les ressources du cours la marche à suivre.

# Dans la dernière décennie, le nombre de packages de disponible a explosé...
# Il peut donc sembler difficile, voire impossible, de trouver package à son pied.
# Par contre, les packages largement utilisés pour l'analyse de données sont tous trouvés dans ce qui est appelé 
# le "tidyverse" (contraction de tidy (propre) et universe (univers)).
# Le "tidyverse" est une série de packages qui travaillent bien ensemble puisqu'ils ont plusieurs paramètres et configurations en commun.
# Ainsi, ces packages facilite et "accélère" les tâches typiques d'analyse de données.


# Installons et appelons trois des packages du tidyverse, que nous utiliserons pour la suite du cours.
# dplyr, tidyr, and ggplot2

install.packages("dplyr") # la fonction install.packages n'a qu'à être utilisée une seule fois par package.
                          # Elle fait le lien avec le CRAN ("mirroir") de R en ligne, et télécharge et installe le package sur l'ordinateur
install.packages("tidyr")
install.packages("ggplot2")

# Une fois que les packages sont installés, nous devons les appeler afin de les utiliser. Ceci doit être 
# fait à chaque fois que nous ouvrons une session sur R.
library(dplyr)
library(tidyr)
library(ggplot2)

