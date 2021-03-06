#############################################################
## Enregistrer vos graphiques 
## Intro � R/RStudio Avril 2020
#############################################################
library(ggplot2)
# Ressources:
# https://ggplot2-book.org/


# Voici 2 m�thodes pour enregistrer vos graphiques
# 1. Utiliser le bouton "export" dans la fen�tre Plots
# 2. ggsave


getwd()
ggsave("R en Fran�ais//6_Ggplot2//hwy_ggsave_plot.png", plot = hwy_cty, width = 8, height = 7, units = c("cm"), dpi = 150)
ggsave("R en Fran�ais//6_Ggplot2//hwy_ggsave_plot.pdf", plot = hwy_cty, width = 8, height = 7, units = c("cm"), dpi = 150, device = "pdf")


# Il existe bien s�r d'autres m�thodes! � vous de jouer, maintenant!