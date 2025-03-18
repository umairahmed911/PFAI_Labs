#-----Exploring RStudio-----

# View first few rows
head(mtcars)

# Check structure
str(mtcars)

# View dataset in a spreadsheet-like format
View(mtcars)

# Get summary statistics
summary(mtcars)





#-----Practicing Built-in Functions-----

# Create a numeric vector
num_vec <- c(4, 8, 15, 16, 23, 42, 8, 16, 15, 23)
# Calculate Mean
mean_value <- mean(num_vec)
# Calculate Median
median_value <- median(num_vec)
# Calculate Mode (custom function since R has no built-in mode function)
mode_function <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}
mode_value <- mode_function(num_vec)
# Print results
cat("Mean:", mean_value, "\nMedian:", median_value, "\nMode:", mode_value, "\n")


# Generate a sequence from 1 to 100
num_seq <- 1:100
# Extract even numbers
even_numbers <- num_seq[num_seq %% 2 == 0]
# Find sum of even numbers
sum_even <- sum(even_numbers)
# Print result
cat("Sum of even numbers from 1 to 100:", sum_even, "\n")


# Define strings
str1 <- "R"
str2 <- "is"
str3 <- "awesome"
# Concatenate with a space
sentence <- paste(str1, str2, str3, sep = " ")
# Print result
cat(sentence, "\n")


# Create a 3x3 matrix
mat <- matrix(c(2, 3, 5, 1, 4, 7, 6, 8, 9), nrow = 3, byrow = TRUE)
# Transpose of matrix
mat_transpose <- t(mat)
# Determinant of matrix
mat_determinant <- det(mat)
# Inverse of matrix (if determinant ≠ 0)
if (mat_determinant != 0) {
  mat_inverse <- solve(mat)
} else {
  mat_inverse <- "Matrix is singular, cannot be inverted"
}
# Print results
cat("Original Matrix:\n")
print(mat)
cat("\nTransposed Matrix:\n")
print(mat_transpose)
cat("\nDeterminant of Matrix:", mat_determinant, "\n")
cat("\nInverse of Matrix:\n")
print(mat_inverse)






#-----Working with Library Packages-----

# Install ggplot2 if not already installed
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)

# Load the library
library(ggplot2)

# Create a scatterplot using the built-in mtcars dataset
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue") +
  labs(title = "Scatterplot of MPG vs Weight",
       x = "Car Weight",
       y = "Miles per Gallon") +
  theme_minimal()


# Install dplyr if not already installed
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

# Load dplyr
library(dplyr)

# Filter for species "setosa" and arrange by Sepal.Length
filtered_iris <- iris %>%
  filter(Species == "setosa") %>%
  arrange(Sepal.Length)

# Print result
print(filtered_iris)



# Install tidyr if not already installed
if (!require(tidyr)) install.packages("tidyr", dependencies = TRUE)

# Load tidyr
library(tidyr)

# Create a sample wide dataset
wide_data <- data.frame(
  ID = c(1, 2, 3),
  Math = c(85, 90, 78),
  Science = c(88, 92, 80)
)

# Pivot from wide to long format
long_data <- wide_data %>%
  pivot_longer(cols = c(Math, Science), names_to = "Subject", values_to = "Score")

# Print long format
print(long_data)

# Pivot back to wide format
wide_data_reversed <- long_data %>%
  pivot_wider(names_from = Subject, values_from = Score)

# Print wide format
print(wide_data_reversed)



# Install data.table if not already installed
if (!require(data.table)) install.packages("data.table", dependencies = TRUE)

# Load data.table
library(data.table)

# Create a sample data.table
dt <- data.table(
  ID = c(1, 2, 3, 4, 5),
  Category = c("A", "B", "A", "B", "A"),
  Value = c(10, 20, 30, 40, 50)
)

# Calculate sum of Value by Category
aggregated_dt <- dt[, .(Total_Value = sum(Value)), by = Category]

# Print result
print(aggregated_dt)









#-----Advanced Tasks-----

# Install and load lubridate
if (!require(lubridate)) install.packages("lubridate", dependencies = TRUE)
library(lubridate)

# Parse dates from different formats
date1 <- ymd("2025-03-18")  # YYYY-MM-DD format
date2 <- dmy("18-03-2025")  # DD-MM-YYYY format
date3 <- mdy("March 18, 2025")  # Month Day, Year format

# Format a date into a custom format
formatted_date <- format(date1, "%A, %d %B %Y")  # "Tuesday, 18 March 2025"

# Print results
cat("Parsed Date 1:", date1, "\n")
cat("Parsed Date 2:", date2, "\n")
cat("Parsed Date 3:", date3, "\n")
cat("Formatted Date:", formatted_date, "\n")



# Install and load rvest
if (!require(rvest)) install.packages("rvest", dependencies = TRUE)
library(rvest)

# Define the URL to scrape
url <- "https://www.dawn.com/"  # Replace with a real URL

# Read the webpage
webpage <- read_html(url)

# Extract specific data (e.g., titles of articles)
titles <- webpage %>%
  html_nodes("h2") %>%  # Change "h2" based on actual HTML tags
  html_text()

# Print extracted titles
print(titles)



# Install and load caret
if (!require(caret)) install.packages("caret", dependencies = TRUE)
library(caret)

# Load built-in dataset
data(iris)

# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# Train a simple decision tree model
model <- train(Species ~ ., data = trainData, method = "rpart")

# Make predictions
predictions <- predict(model, testData)

# Evaluate accuracy
confusionMatrix(predictions, testData$Species)



# Install and load xts and zoo
if (!require(xts)) install.packages("xts", dependencies = TRUE)
if (!require(zoo)) install.packages("zoo", dependencies = TRUE)
library(xts)
library(zoo)

# Create a sample time series dataset
dates <- seq(as.Date("2025-01-01"), by = "month", length.out = 12)
values <- c(100, 110, 105, 115, 120, 125, 130, 128, 135, 140, 138, 145)

# Convert to xts object
time_series <- xts(values, order.by = dates)

# Plot time series
plot(time_series, type = "o", col = "blue", main = "Time-Series Data",
     xlab = "Time", ylab = "Value")
