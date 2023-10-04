# charger les libraries necessaires, dans ce cas nous utilisons qcc
library(qcc)
library(tidyverse)
library(ggplot2)

data(boiler) #données example de pistons


#save as images

jpeg(file="q1.jpeg")
q1 <- qcc(boiler$t1, type = "xbar.one")
dev.off()

jpeg(file="q2.jpeg")
q2 <- qcc(boiler$t4, type = "xbar.one")
dev.off()

#read and combine images

q1 <- image_read("q1.jpeg")
q2 <- image_read("q2.jpeg")

img <- c(q1, q2)

image_append(img)
