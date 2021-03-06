#############################################################
## Le Passeur ("piping operator")  %>% 
## Intro � R/RStudio avril 2020
#############################################################

# Cette session couvre deux �l�ments:
# Partie 1. Qu'est-ce que le passeur et comment l'utiliser dans une s�rie de fonctions.
# Note: certains traduisent "piping operator" par "op�rateur de tuyaux". Ne soyez pas �tonn�s de voir ces mots
# appara�tre dans les ressources en fran�ais... Nous avons choisi d'utiliser passeur, comme c'est plus descriptif de la fonction.
# Partie 2. Utilisation de la fonction group_by() pour calculer des statistiques descriptives par groupe


# Partie 1. Qu'est-ce que le passeur et comment l'utiliser


# Le passeur est un outil puissant pour exprimer clairement une s�quence d'op�rations.
# C'est largement utilis� dans les syst�mes d'op�ration tels que Unix et d'autres langages de programmation
# pour passer le r�sultat d'une op�ration vers une nouvelle op�ration.

# La syntaxe est assez simple. D�s que l'on voit le passeur (%>%), on peut simplement lire "Je prends
# ce qui est � gauche et le passe vers le processus � droite".
# Ceci rend le passeur fort sympathique, puisqu'il transforme ce qui pourrait �tre un code complexe en
# une s�quence de processus faciles � lire et comprendre - donc facile � reproduire pour votre vous futur
# ou vos coll�gues! 


# raccourci clavier
CTRL + SHIFT + M
%>% 
        
# Continuons avec la base de donn�es sur la tuberculose et demandons les statistiques sommaires pour chaque pays.

tb_data <- read.csv("5_Pr�paration_Donn�es\\donnees\\tb.csv", stringsAsFactors = F, header = T)

# RStudio, � l'instar de SAS EG, a la fonction d'autocompl�tion. Tapez les premi�res lettres et ensuite faites TAB.
# Si vous n'�tes pas en mode commentaire, vous devriez voir appara�tre un menu d'options et de variables d�j� cr��es.
# Naviguez jusqu'� celle qui vous int�resse, et faites TAB de nouveau. Voil�, vous vous �pargnez de quelques �
# plusieurs touches :)

# Revenons � notre passeur. Ici, nous cr�erons une nouvelle base de donn�es nomm�e tb_data2.
# Nous prendrons la base de donn�es tb_data, la passons � la fonction mutate qui elle
# cr�era une variable nomm�e "total" qui sera le nombre total de cas pour l'ann�e. Nous passerons ensuite ce r�sultat
# dans un filtre, qui nous donnera uniquement les cas de tuberculose au Y�men pour l'ann�e 2000. 


library(dplyr)

tb_data2 <- tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        filter(annee == "2000"  &  pays  == "Yemen")  # Vous pouvez utiliser un op�rateur logique (ici: &),
                                                        # ou faire ceci en deux �tapes distinctes (voir ci-bas)



tb_data2 = tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        filter(annee == "2000") %>%  filter(pays  == "Yemen") 



# �tape finale: utiliser la focntion summarise() pour trouver le nombre total de cas au Y�men en 2000.
tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        filter(annee == "2000" & pays  == "Yemen") %>% 
        summarise(enfants = sum(enfants), # il n'est pas obligatoire d'indiquer un nom = devant la fonction, c'est uniquement pour des �tiquettes.
                  adultes = sum(adultes), 
                  pers_agees= sum(pers_agees), 
                  total = sum(total),
                  n_obs = n())
        # Remarquez qu'ici nous n'avons pas cr�� un nouvelle base de donn�es, puisque ce qui nous int�resse au final
        # sont uniquement les statistiques descriptives, qui elles seront affich�es dans la console.




# Partie 2. Utilisation de la fonction group_by() pour calculer des statistiques descriptives par groupe
tb_data3 = tb_data %>% # on veut cr�er tb_data3 � partir de tb_data. On passe tb_data dans...
        mutate(total = enfants + adultes + pers_agees) %>% # la fonction mutate, qui cr�era la variable total. On passe ceci dans...
        group_by(pays) %>%   # la fonction group_by(), ici nous voulons regrouper par pays. On passe ceci dans....
        summarise(pays_total = sum(total, na.rm = T), # la fonction summarise, qui nous donnera le total et la moyenne
                moyenne = mean(total, na.rm=T))    # du total par pays!
        # Vous pouvez voir le r�sultat en cliquant sur tb_data3 dans la fen�tre Global Environment (� droite), ou en ex�cutant:
View(tb_data3)  # N'oubliez pas: la fonction View n�cessite une majuscule!

# un autre exemple:
tb_data4 = tb_data %>% # Cr�eons tb_data4, en passant tb_data dans...
        mutate(total = enfants + adultes + pers_agees) %>% # la fonction mutate. Ceci sera pass� dans....
        group_by(pays) %>%   # la fonction group_by() (encore une fois par pays). Ceci sera pass� dans...
        filter(adultes > 8000)    # la fonction filtre, qui elle contient la fonction any(), donc notre tb_data4 n'aura que les observations  
                                # la valeur de la variable adulte est sup�rieure � 8000.

# Si nous voulons l'ensemble des observations pour les pays ayant eu au moins une fois plus de 8000 cas adultes pour une ann�e:  
tb_data5 = tb_data %>% # identique
        mutate(total = enfants + adultes + pers_agees) %>% # identique
        group_by(pays) %>%   # identique
        filter(any(adultes > 8000))    # on rajoute ici la fonction any() dans la fonction filtre donc notre tb_data5  
                                     # aura TOUTES les observations pour les pays ayant au moins une valeur d'adulte sup�rieure � 8000.




# En utilisant la fonction group_by(), on peut facilement comparer le nombre de cas par pays et par sexe, le nombre total de cas de tuberculose.
# Using this syntax, can you figure out how, for each country, we can compare the total counts of tb cases for males and females 
tb_data6 = tb_data %>% mutate(total = enfants + adultes + pers_agees) %>% 
        group_by(pays, sexe) %>%   
        summarise(annee_total = sum(total, na.rm = T), moyenne = mean(total, na.rm=T))

