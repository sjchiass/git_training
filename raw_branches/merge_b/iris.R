library(tidyverse)

# Pivot and summarize
iris_pivot <- iris %>%
  pivot_longer(-Species, "Measure") %>%
  group_by(Species, Measure) %>%
  summarise_all(mean) %>%
  ungroup()

# Show results
print(means)