# charger les libraries necessaires, dans ce cas nous utilisons qcc
library(qcc)
library(tidyverse)
library(ggplot2)
library(readr)

data(orangejuice)
(q = with(orangejuice, qcc(D[trial], sizes = size[trial], type = "p")))
