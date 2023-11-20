library(dplyr)
#Q1
# a. Vector: 1.3 1.6 1.9 2.2 2.5 2.8 3.1 3.4 3.7 4.0 4.3 4.6 4.9
vector_a <- seq(1.3, 4.9, by = 0.3)

# b. Vector: 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4
vector_b <- rep(1:4, times = 5)

# c. Vector: 14 12 10 8 6 4 2 0
vector_c <- seq(14, 0, by = -2)

# d. Vector: 5 5 12 12 13 13 20 20
vector_d <- rep(c(5, 12, 13, 20), each = 2)

# Print the vectors
cat("Vector a:", vector_a, "\n")
cat("Vector b:", vector_b, "\n")
cat("Vector c:", vector_c, "\n")
cat("Vector d:", vector_d, "\n\n")

#Q2
# Load iris dataset
data(iris)

# A. What sort of data type is iris?
cat("Data type of iris:", class(iris), "\n")

# B. How many rows (observations) and columns (variables) does the iris dataset have?
cat("Number of rows in iris:", nrow(iris), "\n")
cat("Number of columns in iris:", ncol(iris), "\n")

# C. Which variable of the data frame iris is a factor and how many levels does it have?
cat("Variable 'Species' in iris is a factor with", nlevels(iris$Species), "levels.\n\n")

#Q3
# a. Mean and standard deviation of sepal width and sepal length for each type of species
iris_summary <- aggregate(cbind(Sepal.Width, Sepal.Length) ~ Species, data = iris, FUN = function(x) c(mean = mean(x), sd = sd(x)))
print(iris_summary)

iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(
    meanWidth = mean(Sepal.Width),
    sdWidth = sd(Sepal.Width),
    meanLength = mean(Sepal.Length),
    sdLength = sd(Sepal.Length)
  )

# b. Create a new dataset iris.class
iris.class <- iris
iris.class$Calyx.Width <- ifelse(iris.class$Sepal.Length < 5, "short", "long")


# Print the first few rows of iris.class
cat("First few rows of iris.class:\n")
print(head(iris.class))

#Q4
# Load mtcars dataset
data(mtcars)

# A. Select cars whose cyl value is no smaller than 5
selected_cars_a <- mtcars[mtcars$cyl >= 5, ]
print("Selected cars with cyl >= 5:")
print(selected_cars_a)

# B. Show all fields (columns) of the first 10 cars
print("All fields of the first 10 cars:")
print(head(mtcars, 10))

# C. Find all cars matching "Honda"
selected_cars_c <- mtcars[grepl("Honda", rownames(mtcars)), ]
print("Selected cars matching 'Honda':")
print(selected_cars_c)


