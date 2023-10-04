# charger les libraries necessaires, dans ce cas nous utilisons qcc
library(qcc)
library(tidyverse)
library(ggplot2)

# charger les données
data(pistonrings) #données example de pistons
#Piston rings for an automotive engine are produced by a forging process.
#The inside diameter of the rings manufactured by the process is measured on 25 samples, each of size 5,
# for the control phase I, when preliminary samples from a process being considered 'in control'
# are used to construct control charts. Then, further 15 samples, again each of size 5,
#are obtained for phase II.



attach(pistonrings) # permet de dire à qcc que nous nous referons aux données lors de l'appel de la fonction
diameter <- qcc.groups(diameter, sample) #on va creer les données diametre avec les diametre et les sous groups seront les "sample"
head(diameter) #afficher les données

# Creer un diagrmme X-bar et R
q1 <- qcc(diameter, type = "xbar")

#on a créee un object qcc et affiché le diagramme correspondant

summary(q1) #avec cette fonction il est possible de regarder les statistiques calculés pour le digramme

#pour un affichage en français il est possible de personaliser les titres et labels
# version en français
q1 <- qcc(diameter, type = "xbar", label.limits = c("LCI", "LCS"), title = "Carte de controle", xlab	= "Groupe", ylab	= "Diammetre", lang = "FR")

qcc(diameter, type = "R") #création du digramme R


#-----------------
# creer une CC sur un processus "sous contrôle" et ajouter des nouvelles données

q1 <- qcc(diameter[1:25,], type = "xbar") #grafiquer uniquement les 25
q1 <- qcc(diameter[1:25,], type = "xbar", newdata=diameter[26:40,]) #integrer les nouvelles données


# creer le diagramme operationel characteristique de la carte de controle
(beta <- oc.curves(q1)) # probabilité de détection de l'erreur Beta selon la taille du sous-groupe

# calcules de capabilité
pc = process.capability(q1, spec.limits = c(73.95,74.05))

pc = process.capability(q1, spec.limits = c(73.95,74.05), target = 74.02) # changer la cible

pc = process.capability(q1, spec.limits = c(73.99,74.01)) #reduire les limites pour tester, voir l'effet sur la capabilité

# les données de la distribution sont calculés par défaut mais si connus il est possiblé de les spécifier


# Diagramme de pareto example

defect <- c(80, 27, 66, 94, 33)
names(defect) <- c("code de prix", "mauvais date", "code fournisseur", "num. contact", "num. part")
(pc = pareto.chart(defect, ylab = "Fréquence d'erreurs"))


# exemple Diagramme Ishikawa
cause.and.effect(cause = list(Measurements = c("Micrometers",
                                                 "Microscopes",
                                                 "Inspectors"),
                                Materials = c("Alloys",
                                              "Lubricants",
                                              "Suppliers"),
                                Personnel = c("Shifts",
                                              "Supervisors",
                                              "Training",
                                              "Operators"),
                                Environment = c("Condensation",
                                                "Moisture"),
                                Methods = c("Brake",
                                            "Engager",
                                            "Angle"),
                                Machines = c("Speed",
                                             "Lathes",
                                             "Bits",
                                             "Sockets")),
                   effect = "Surface Flaws")
