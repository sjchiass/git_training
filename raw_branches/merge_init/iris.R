# Pivot iris dataset
iris_pivot <- lapply(X = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
                     FUN = function(x) {
                       data.frame(Species = iris$Species,
                                  Measure = x,
                                  Value = iris[[x]])
                       })
iris_pivot <- do.call(rbind, iris_pivot)

# Calculate means of each Species and Measure combination
means <- aggregate(x = iris_pivot$Value,
          by = list(Species = iris_pivot$Species,
                    Measure = iris_pivot$Measure),
          FUN = mean)

# Show results
print(means)