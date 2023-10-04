#--------------
# Exo.2
# données manufacturing planches en bois


# charger les libraries necessaires, dans ce cas nous utilisons qcc
library(qcc)
library(tidyverse)
library(ggplot2)
library(readr)


# Import and inspect the dataset
dataset <- read_csv("données/manufacturing_data.csv")

dataset_l <- dataset %>% select(Length_cm.1:Length_cm.5)

# Creer un diagrmme X-bar et R
q1 <- qcc(dataset_l, type = "xbar")

#voir le résumé de l'object control chart
summary(q)

qcc(dataset, type = "R") #création du digramme R


# calcules de capabilité
pc = process.capability(q1, spec.limits = c(46,56))


