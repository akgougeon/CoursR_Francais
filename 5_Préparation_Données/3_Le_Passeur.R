#############################################################
## Le Passeur ("piping operator")  %>% 
## Intro à R/RStudio avril 2020
#############################################################

# Cette session couvre deux éléments:
# Partie 1. Qu'est-ce que le passeur et comment l'utiliser dans une série de fonctions.
# Note: certains traduisent "piping operator" par "opérateur de tuyaux". Ne soyez pas étonnés de voir ces mots
# apparaître dans les ressources en français... Nous avons choisi d'utiliser passeur, comme c'est plus descriptif de la fonction.
# Partie 2. Utilisation de la fonction group_by() pour calculer des statistiques descriptives par groupe


# Partie 1. Qu'est-ce que le passeur et comment l'utiliser


# Le passeur est un outil puissant pour exprimer clairement une séquence d'opérations.
# C'est largement utilisé dans les systèmes d'opération tels que Unix et d'autres langages de programmation
# pour passer le résultat d'une opération vers une nouvelle opération.

# La syntaxe est assez simple. Dès que l'on voit le passeur (%>%), on peut simplement lire "Je prends
# ce qui est à gauche et le passe vers le processus à droite".
# Ceci rend le passeur fort sympathique, puisqu'il transforme ce qui pourrait être un code complexe en
# une séquence de processus faciles à lire et comprendre - donc facile à reproduire pour votre vous futur
# ou vos collègues! 


# raccourci clavier
CTRL + SHIFT + M
%>% 
        
# Continuons avec la base de données sur la tuberculose et demandons les statistiques sommaires pour chaque pays.

tb_data <- read.csv("5_Préparation_Données\\donnees\\tb.csv", stringsAsFactors = F, header = T)

# RStudio, à l'instar de SAS EG, a la fonction d'autocomplétion. Tapez les premières lettres et ensuite faites TAB.
# Si vous n'êtes pas en mode commentaire, vous devriez voir apparaître un menu d'options et de variables déjà créées.
# Naviguez jusqu'à celle qui vous intéresse, et faites TAB de nouveau. Voilà, vous vous épargnez de quelques à
# plusieurs touches :)


# Revenons à notre passeur. Ici, nous créerons une nouvelle base de données nommée tb_data2.
# Nous prendrons la base de données tb_data, la passons à la fonction mutate qui elle
# créera une variable nommée "total" qui sera le nombre total de cas pour l'année. Nous passerons ensuite ce résultat
# dans un filtre, qui nous donnera uniquement les cas de tuberculose au Yémen pour l'année 2000. 


library(dplyr)

tb_data2 = tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        filter(total == "2000"  &  pays  == "Yemen")  # Vous pouvez utiliser un opérateur logique (ici: &),
                                                        # ou faire ceci en deux étapes distinctes (voir ci-bas)



tb_data2 = tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        filter(annee == "2000") %>%  filter(pays  == "Yemen") 



# Étape finale: utiliser la focntion summarise() pour trouver le nombre total de cas au Yémen en 2000.
tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        filter(annee == "2000" & pays  == "Yemen") %>% 
        summarise(enfants = sum(enfants), # il n'est pas obligatoire d'indiquer un nom = devant la fonction, c'est uniquement pour des étiquettes.
                  adultes = sum(adultes), 
                  pers_agees= sum(pers_agees), 
                  total = sum(total),
                  n_obs = n())
        # Remarquez qu'ici nous n'avons pas créé un nouvelle base de données, puisque ce qui nous intéresse au final
        # sont uniquement les statistiques descriptives, qui elles seront affichées dans la console.




# Partie 2. Utilisation de la fonction group_by() pour calculer des statistiques descriptives par groupe
tb_data3 = tb_data %>% # on veut créer tb_data3 à partir de tb_data. On passe tb_data dans...
        mutate(total = enfants + adultes + pers_agees) %>% # la fonction mutate, qui créera la variable total. On passe ceci dans...
        group_by(pays) %>%   # la fonction group_by(), ici nous voulons regrouper par pays. On passe ceci dans....
        summarise(pays_total = sum(total, na.rm = T), # la fonction summarise, qui nous donnera le total et la moyenne
                moyenne = mean(total, na.rm=T))    # du total par pays!
        # Vous pouvez voir le résultat en cliquant sur tb_data3 dans la fenêtre Global Environment (à droite), ou en exécutant:
View(tb_data3)  # N'oubliez pas: la fonction View nécessite une majuscule!

# un autre exemple:
tb_data4 = tb_data %>% # Créeons tb_data4, en passant tb_data dans...
        mutate(total = enfants + adultes + pers_agees) %>% # la fonction mutate. Ceci sera passé dans....
        group_by(pays) %>%   # la fonction group_by() (encore une fois par pays). Ceci sera passé dans...
        filter(adultes > 8000)    # la fonction filtre, qui elle contient la fonction any(), donc notre tb_data4 n'aura que les observations  
                                # la valeur de la variable adulte est supérieure à 8000.

# Si nous voulons l'ensemble des observations pour les pays ayant eu au moins une fois plus de 8000 cas adultes pour une année:  
tb_data5 = tb_data %>% # identique
        mutate(total = enfants + adultes + pers_agees) %>% # identique
        group_by(pays) %>%   # identique
        filter(any(adultes > 8000))    # on rajoute ici la fonction any() dans la fonction filtre donc notre tb_data5  
                                     # aura TOUTES les observations pour les pays ayant au moins une valeur d'adulte supérieure à 8000.




# En utilisant la fonction group_by(), on peut facilement comparer le nombre de cas par pays et par sexe, le nombre total de cas de tuberculose.
# Using this syntax, can you figure out how, for each country, we can compare the total counts of tb cases for males and females 
tb_data6 = tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        group_by(pays, sexe) %>%   
        summarise(annee_total = sum(total, na.rm = T), moyenne = mean(total, na.rm=T))

