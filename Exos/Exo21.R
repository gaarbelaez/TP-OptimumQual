#--------------
# Exo.1
# données silice


# charger les libraries necessaires, dans ce cas nous utilisons qcc
library(qcc)
library(tidyverse)
library(ggplot2)
library(readr)


# Import and inspect the dataset
dataset <- read_csv("Exos/exo_silice.csv")

# Creer un diagrmme X-bar et R
q <- qcc(dataset, type = "xbar")

#voir le résumé de l'object control chart
summary(q)

qcc(dataset, type = "R") #création du digramme R


# calcules de capabilité
pc = process.capability(q, spec.limits = c(114,175))


