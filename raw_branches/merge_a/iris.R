# Pivot and summarize R dataframe
#
# Requirements: tidyverse
# Tested in R 3.6.2
library(tidyr)
library(dplyr)

# Pivot iris dataset
iris_pivot <- pivot_longer(iris,
                           cols = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
                           names_to = "Measure")

# Calculate means of each Species and Measure combination
means <- group_by(iris_pivot, Species, Measure)
means <- summarise_all(means, mean)
means <- ungroup(means)

# Show results
View(means)