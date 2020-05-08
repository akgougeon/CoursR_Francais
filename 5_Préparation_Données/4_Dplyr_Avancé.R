#############################################################
## Encore plus de dplyr!
## Intro à R/RStudio Avril 2020
#############################################################

# Dans cette section nous explorerons d'autres fonctions du package dplyr
library(dplyr)


# La fonction case_when() permet de vectoriser plusieurs if_else() 
# C'est l'équivalent, en R, du CASE WHEN en SQL. S'il n'y a aucune correspondance, la valeur de NA est attribuée

y <- seq(-2, 2, by = .5) # Construisons une séquence de -2 à 2, en intervalles de 0.5
x <- case_when(y >= 0 ~ sqrt(y),TRUE   ~ y) # On demande ici d'attribuer la racine carrée de y si y >=0, sinon d'attribuer y.
# N'oubliez pas de visualiser x ;)
x2<-case_when(y >= 0 ~ sqrt(y)) # Enlevons la 2ème partie de la séquence case_when... quelle est la différence?
# La valeur de NA a été attribuée lorsque la condition n'est pas rencontrée.



# Continuons avec les duplications 
# Débutons par nous créer une base de données entièrement dupliquée.
starwars <- starwars # appelons la base de données intégrées starwars
starwars2 = starwars %>% rbind(starwars)  # la fonction rbind(), rappelez-vous, attache les rangées. Ainsi, nous dédoublons les observations
# Prenez quelques instants pour regarder ce qu'il y a dans cette base de données!!!

# Conserver uniquement les rangées dupliquées et en vérifier le nombre
starwars2 %>% select(-c("films", "vehicles", "starships" )) %>% filter(duplicated(species)) %>% nrow()
# Nous avons demandé de ne pas prendre en compte 3 variables (films, vehicles, starships)
# utiliser duplicated() à l'intérieur de filter() indique que nous filtrons en gardant uniquement les observations
# qui ne sont pas une valeur unique!
starwars2 %>% select(-c("films", "vehicles", "starships" )) %>% filter(duplicated(.))%>% nrow()
# même idée ici... mais les duplicats sont pour l'ensemble des valeurs!


# une petite ligne pour conserver dans un objet distinct les duplicats!
# pour les habitués de SAS: dans un proc sort, ce serait l'équivalent de l'option dup = 
copies = starwars2 %>% filter(duplicated(starwars2) | duplicated(starwars2,fromLast=T))



# conserver uniquement les observations uniques
starwars3 = starwars2 %>% select(-c("films", "vehicles", "starships")) %>% distinct()

# Quelle espèce ("species") de personnage de Star Wars a les yeux bleus?
blue_eye_species =  starwars %>% group_by(species) %>% filter(any(eye_color == "blue"))
blue_eye_fixed_species =  starwars %>% group_by(species) %>% filter(all(eye_color == "blue"))
blue_eye =starwars %>% filter(eye_color == "blue")
# la différence entre les trois? Dans les deux cas on regroupe par espèce, et on regarde chaque observation. 
# Dans la première ligne, dès qu'une espèce a UNE observation dont la couleur d'yeux est bleu, TOUTES les observations ayant
# cet espèce est retournée (et ce peu importe la couleur des yeux de chaque observation individuelle)
# Dans la deuxième, on regarde par groupe, et on retourne les observations uniquement lorsque TOUTES les observations
# du groupe (donc par espèce ("species)) ont les yeux bleus. C'est pour ça qu'il y en a beaucoup moins!
# Dans la troisième ligne, on retourneles observations dont les yeux sont bleus, et ce peu importe l'espèce. 



# Encore plus de sélection!

# Regardons une autre base de données intégrées: iris 
colnames(iris) # le nom des colonnes dans la base
unique(iris$Species)  # les valeurs uniques de la variables Species

# extraire les rangées (observations) sur des conditions multiples, incluant une liste!
iris %>% filter(Species %in% c("setosa", "versicolor") & Petal.Width > 0.30)


# extraire toutes les rangées ou le nom de l'espèce ("species") comporte la lettre t
iris %>% filter(grepl("t",Species)) # rappelez-vous de grepl()! Il s'agit d'une fonction qui cherche une séquence



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


# Extraire les variables numériques et utiliser summarise_all() pour obtenir les statistiques descriptives
iris %>%       
  filter(Species == "versicolor") %>% 
  select_if(is.numeric) %>% 
  summarise_all(
    list(mean = mean, 
         median= median, 
         sd= sd, 
         var= var), na.rm = T)

