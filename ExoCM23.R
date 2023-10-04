
library(qcc)
library(tidyverse)
library(ggplot2)




# Creer un diagrmme X-bar et R
q1 <- qcc(CMdynamometre, type = "xbar")

#on a créee un object qcc et affiché le diagramme correspondant

summary(q1) #avec cette fonction il est possible de regarder les statistiques calculés pour le digramme

# version en français
q1 <- qcc(CMdynamometre, type = "xbar", label.limits = c("LCI", "LCS"), title = "Carte de controle des moyennes", xlab	= "Groupe", ylab	= "Nm", lang = "FR")

q1 <- qcc(CMdynamometre, type = "xbar", center = 70 ,  label.limits = c("LCI", "LCS"), title = "Carte de controle des moyennes", xlab	= "Groupe", ylab	= "Nm", lang = "FR")

q1 <- qcc(CMdynamometre, type = "xbar", center = 70 , limits = c(65, 75) , label.limits = c("LRI", "LRS"), title = "Carte de controle", xlab	= "Groupe", ylab	= "Nm", lang = "FR")


qcc(CMdynamometre, type = "R") #création du digramme R


#-----------------
# creer une CC sur un processus "sous contrôle" et ajouter des nouvelles données

q1 <- qcc(CMdynamometre[1:25,], type = "xbar") #grafiquer uniquement les 25
q1 <- qcc(CMdynamometre[1:25,], type = "xbar", newdata=diameter[26:40,]) #integrer les nouvelles données


# creer le diagramme operationel characteristique de la carte de controle
(beta <- oc.curves(q1)) # probabilité de détection de l'erreur Beta selon la taille du sous-groupe

# calcules de capabilité


pc = process.capability(q1, spec.limits = c(65, 75), target = 70) # changer la cible


