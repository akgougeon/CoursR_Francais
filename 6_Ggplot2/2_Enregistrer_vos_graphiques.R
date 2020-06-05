#############################################################
## Enregistrer vos graphiques 
## Intro à R/RStudio Avril 2020
#############################################################
library(ggplot2)
# Ressources:
# https://ggplot2-book.org/


# Voici 2 méthodes pour enregistrer vos graphiques
# 1. Utiliser le bouton "export" dans la fenêtre Plots
# 2. ggsave


getwd()
ggsave("R en Français//6_Ggplot2//hwy_ggsave_plot.png", plot = hwy_cty, width = 8, height = 7, units = c("cm"), dpi = 150)
ggsave("R en Français//6_Ggplot2//hwy_ggsave_plot.pdf", plot = hwy_cty, width = 8, height = 7, units = c("cm"), dpi = 150, device = "pdf")


# Il existe bien sûr d'autres méthodes! à vous de jouer, maintenant!