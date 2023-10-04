#--------------
# Exo.1
#


# charger les libraries necessaires,
library(qcc)
library(tidyverse)
library(ggplot2)


# Importer et verifier le dataset
data(pistonrings) #données example de pistons
dataset <- pistonrings

# Calculer des statistiques descriptives V1
mean_value <- mean(dataset$diameter)
sd_value <- sd(dataset$diameter)
min_value <- min(dataset$diameter)
max_value <- max(dataset$diameter)

## Calculer des statistiques descriptives V2 tydiverse
data_summary <- dataset %>% group_by(trial) %>%
  summarise(
      mean_value = mean(diameter),
      sd_value = sd(diameter),
      min_value = min(diameter),
      max_value = max(diameter)
  )


# Creer un histogram
dataset %>% ggplot(aes(diameter)) +
  geom_histogram() +
  labs(title = "Histogram des diametres", x = "Diametre", y = "Frequence")

# Creer un boxplot - boite à moustaches
ggplot(dataset, aes(x = trial, y =diameter)) +
  geom_boxplot() +
  labs(title = "Box Plot of Variable", x = "", y = "Variable")


