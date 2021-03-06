#############################################################
## Encore plus de dplyr!
## Intro � R/RStudio Avril 2020
#############################################################

# Dans cette section nous explorerons d'autres fonctions du package dplyr
library(dplyr)


# La fonction case_when() permet de vectoriser plusieurs if_else() 
# C'est l'�quivalent, en R, du CASE WHEN en SQL. S'il n'y a aucune correspondance, la valeur de NA est attribu�e

y <- seq(-2, 2, by = .5) # Construisons une s�quence de -2 � 2, en intervalles de 0.5
x <- case_when(y >= 0 ~ sqrt(y),TRUE   ~ y) # On demande ici d'attribuer la racine carr�e de y si y >=0, sinon d'attribuer y.
# N'oubliez pas de visualiser x ;)
x2<-case_when(y >= 0 ~ sqrt(y)) # Enlevons la 2�me partie de la s�quence case_when... quelle est la diff�rence?
# La valeur de NA a �t� attribu�e lorsque la condition n'est pas rencontr�e.



# Continuons avec les duplications 
# D�butons par nous cr�er une base de donn�es enti�rement dupliqu�e.
starwars <- starwars # appelons la base de donn�es int�gr�es starwars
starwars2 = starwars %>% rbind(starwars)  # la fonction rbind(), rappelez-vous, attache les rang�es. Ainsi, nous d�doublons les observations
# Prenez quelques instants pour regarder ce qu'il y a dans cette base de donn�es!!!

# Conserver uniquement les rang�es dupliqu�es et en v�rifier le nombre
starwars2 %>% select(-c("films", "vehicles", "starships" )) %>% filter(duplicated(species)) %>% nrow()
# Nous avons demand� de ne pas prendre en compte 3 variables (films, vehicles, starships)
# utiliser duplicated() � l'int�rieur de filter() indique que nous filtrons en gardant uniquement les observations
# qui ne sont pas une valeur unique!
starwars2 %>% select(-c("films", "vehicles", "starships" )) %>% filter(duplicated(.))%>% nrow()
# m�me id�e ici... mais les duplicats sont pour l'ensemble des valeurs!


# une petite ligne pour conserver dans un objet distinct les duplicats!
# pour les habitu�s de SAS: dans un proc sort, ce serait l'�quivalent de l'option dup = 
copies = starwars2 %>% filter(duplicated(starwars2) | duplicated(starwars2,fromLast=T))



# conserver uniquement les observations uniques
starwars3 = starwars2 %>% select(-c("films", "vehicles", "starships")) %>% distinct()

# Quelle esp�ce ("species") de personnage de Star Wars a les yeux bleus?
blue_eye_species =  starwars %>% group_by(species) %>% filter(any(eye_color == "blue"))
blue_eye_fixed_species =  starwars %>% group_by(species) %>% filter(all(eye_color == "blue"))
blue_eye =starwars %>% filter(eye_color == "blue")
# la diff�rence entre les trois? Dans les deux cas on regroupe par esp�ce, et on regarde chaque observation. 
# Dans la premi�re ligne, d�s qu'une esp�ce a UNE observation dont la couleur d'yeux est bleu, TOUTES les observations ayant
# cet esp�ce est retourn�e (et ce peu importe la couleur des yeux de chaque observation individuelle)
# Dans la deuxi�me, on regarde par groupe, et on retourne les observations uniquement lorsque TOUTES les observations
# du groupe (donc par esp�ce ("species)) ont les yeux bleus. C'est pour �a qu'il y en a beaucoup moins!
# Dans la troisi�me ligne, on retourneles observations dont les yeux sont bleus, et ce peu importe l'esp�ce. 



# Encore plus de s�lection!

# Regardons une autre base de donn�es int�gr�es: iris 
colnames(iris) # le nom des colonnes dans la base
unique(iris$Species)  # les valeurs uniques de la variables Species

# extraire les rang�es (observations) sur des conditions multiples, incluant une liste!
iris %>% filter(Species %in% c("setosa", "versicolor") & Petal.Width > 0.30)


# extraire toutes les rang�es ou le nom de l'esp�ce ("species") comporte la lettre t
iris %>% filter(grepl("t",Species)) # rappelez-vous de grepl()! Il s'agit d'une fonction qui cherche une s�quence



# Variations pour la fonction summarise()
# Faire le sommaire de plusieurs variables en utilisant summarise_at()
iris %>%
  filter(Species == "versicolor") %>%
  summarise_at(c("Sepal.Length", "Sepal.Width"),
               mean, na.rm = T)


# Faire le sommaire conditionnel avec summarise_if()
iris %>%       
  filter(Species == "versicolor") %>%
  summarise_if(is.numeric,
               funs(n(),
                    mean,
                    median))


# Extraire les variables num�riques et utiliser summarise_all() pour obtenir les statistiques descriptives
iris %>%       
  filter(Species == "versicolor") %>% 
  select_if(is.numeric) %>% 
  summarise_all(
    list(mean = mean, 
         median= median, 
         sd= sd, 
         var= var), na.rm = T)

