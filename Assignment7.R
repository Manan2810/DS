#apply() -> apply( x, margin, function )
#x: determines the input array including matrix.
#margin: If the margin is 1 function is applied across row, if the margin is 2 it is applied across the column.
#function: determines the function that is to be applied on input data.

#lapply() -> lapply(x,function)
#x: determines the input vector or an object.
#fun: determines the function that is to be applied to input data.

#sapply() -> sapply(x,function)
#x: determines the input vector or an object.
#fun: determines the function that is to be applied to input data.

#The sapply() function helps us in applying functions on a list, vector, or data frame and returns an array or matrix 
#object of the same length. The sapply() function in the R Language takes a list, vector, or data frame as input 
#and gives output in the form of an array or matrix object. Since the sapply() function applies a certain operation to 
#all the elements of the object it doesn’t need a MARGIN. It is the same as lapply() with the only difference being the
#type of return object.

#tapply( x, index,  fun )
#x: determines the input vector or an object.
#index: determines the factor vector that helps us distinguish the data.
#fun: determines the function that is to be applied to input data.

# 1. Create a data matrix named MARKS
set.seed(123)  # for reproducibility
MARKS <- data.frame(
  STUDENT_ID = 1:20,
  SUB1 = sample(50:100, 20, replace = TRUE),
  SUB2 = sample(50:100, 20, replace = TRUE),
  SUB3 = sample(50:100, 20, replace = TRUE)
)

# a. To find total marks of each student.
total_marks <- apply(MARKS[, 2:4], 1, sum)

# b. Append the total to the given MARKS dataset.
MARKS$TOTAL_MARKS <- total_marks

# c. To create a function called st.err() = sd(x)/sqrt(length(x)) to find the standard error in SUB1, SUB2, and SUB3.
st.err <- function(x) {
  sd(x) / sqrt(length(x))
}

standard_error <- apply(MARKS[, 2:4], 2, st.err)

# d. Add 0.25 bonus marks to each mark in SUB1, SUB2, and SUB3.
bonus_marks <- 0.25
MARKS[, 2:4] <- apply(MARKS[, 2:4], 2, function(x) x + bonus_marks)

# 2. Create three vectors V1, V2, and V3 from the SUB1, SUB2, and SUB3 above, respectively.
V1 <- MARKS$SUB1
V2 <- MARKS$SUB2
V3 <- MARKS$SUB3

# Use lapply() function to find the sum of all the marks in V1, V2, and V3.
sums <- lapply(list(V1, V2, V3), sum)

# 3. Create a vector TOTAL_SUM that holds the value of V1, V2, and V3 using sapply().
TOTAL_SUM <- sapply(list(V1, V2, V3), sum)

# 4. Compute the square of each value of marks in V1, V2, and V3 using sapply().
squared_values <- lapply(list(V1, V2, V3), function(x) sapply(x, function(y) y^2))

# 5. Add an index field I =(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4) to matrix MARKS. Use tapply() function to compute mean() and sd() of SUB1 based on index I.
MARKS$I <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4)
mean_sd_by_index <- tapply(MARKS$SUB1, MARKS$I, function(x) c(mean(x), sd(x)))

# 6. Create a function f(x, y) = x/y where x is V1 and y is V2. Use mapply() to compute this function.
f <- function(x, y) x/y
result <- mapply(f, V1, V2)

# 7. Practice all apply functions on the “Seatbelts” data set given in R.
# Assuming you are referring to the built-in dataset "Seatbelts" in R
data("Seatbelts")



