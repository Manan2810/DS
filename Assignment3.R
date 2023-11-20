# 1. Create an array A with elements (12, 13, 14, 15, 16) and display them.
A <- c(12, 13, 14, 15, 16)
cat("Array A:", A, "\n\n")

# 2. Find the sum of all the elements of A.
sum_A <- sum(A)
cat("Sum of A:", sum_A, "\n")

# 3. Find the product of all the element of A.
prod_A <- prod(A)
cat("Product of A:", prod_A, "\n")

# 4. Find the maximum and minimum element of A.
max_A <- max(A)
min_A <- min(A)
cat("Maximum of A:", max_A, "\n")
cat("Minimum of A:", min_A, "\n")

# 5. Find the range of array A.
range_A <- range(A)
cat("Range of A:", range_A, "\n")

# 6. Find the mean, variance, standard deviation, and median of the value of A.
mean_A <- mean(A)
var_A <- var(A)
sd_A <- sd(A)
median_A <- median(A)
cat("Mean of A:", mean_A, "\n")
cat("Variance of A:", var_A, "\n")
cat("Standard Deviation of A:", sd_A, "\n")
cat("Median of A:", median_A, "\n")

# 7. Sort the elements of A both in increasing and decreasing order and store them in B and C.
B <- sort(A)
C <- sort(A, decreasing = TRUE)
cat("Sorted A (Increasing):", B, "\n")
cat("Sorted A (Decreasing):", C, "\n")

# 8. Create a matrix of 3x4 to have the set of natural numbers.
matrix_Natural <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
cat("Matrix of Natural Numbers:\n", matrix_Natural, "\n\n")

# 9. Create MxN matrix by combining A, B, and C row-wise (RW) and column-wise (CW).
matrix_combined_RW <- rbind(A, B, C)
matrix_combined_CW <- cbind(A, B, C)
cat("Combined Matrix (Row-wise):\n", matrix_combined_RW, "\n\n")
cat("Combined Matrix (Column-wise):\n", matrix_combined_CW, "\n\n")

# 10. Find the 2 and 3 row element of RW.
row_2_3 <- matrix_combined_RW[2:3, ]
cat("2nd and 3rd Rows of Combined Matrix (Row-wise):\n", row_2_3, "\n\n")

# 11. Find the 1 and 4 column of CW.
col_1_4 <- matrix_combined_CW[, c(1, 3)]
cat("1st and 4th Columns of Combined Matrix (Column-wise):\n", col_1_4, "\n\n")

# 12. Using both RW and CW, find sub-matrices having elements [2, 3] and [2, 4].
submatrix_2_3 <- matrix_combined_RW[, 2:3]
submatrix_2_4 <- matrix_combined_CW[2, c(2, 3)]
cat("Sub-matrix [2, 3] from Combined Matrix (Row-wise):\n", submatrix_2_3, "\n\n")
cat("Sub-matrix [2, 4] from Combined Matrix (Column-wise):\n", submatrix_2_4, "\n\n")
