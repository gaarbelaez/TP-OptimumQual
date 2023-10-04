# Load the necessary libraries
library(dplyr)

# Generate sample data
set.seed(123)

# Date and Time stamps
times <- seq(from = 0, by = 1, length.out = 100)

# Product ID

# Generate random measurements for each attribute
n_samples <- 5
length <- replicate(n_samples, rnorm(5, mean = 50, sd = 2))
width <- replicate(n_samples, rnorm(5, mean = 10, sd = 1))
weight <- replicate(n_samples, rnorm(5, mean = 100, sd = 5))

# Create the dataset
ManufacturingQualityData <- data.frame(
  Time = times,
  Length_cm = unlist(length),
  Width_cm = unlist(width),
  Weight_kg = unlist(weight)
)

# Output the dataset
write.csv(ManufacturingQualityData, "manufacturing_data.csv", row.names = FALSE)
