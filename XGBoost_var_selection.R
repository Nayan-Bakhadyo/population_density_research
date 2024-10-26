library(xgboost)
library(readr)
library(dplyr)
library(tidyverse)

# Load the saved model
xgb_model <- xgb.load("Population_xgb_model2.bin")

# Load required libraries
library(xgboost)
library(readr)

# Load the model and data
xgb_model <- xgb.load("Population_xgb_model2.bin")

# Get the feature names used by the model
model_feature_names <- xgb.importance(model = xgb_model)

# Print out the expected feature names
print(model_feature_names)

population_data <- read_csv('final_population_dataset.csv')
# Check the names of the features in the dataset after excluding 'total_pop'
print(names(population_data)[names(population_data) != "total_pop"])


# Exclude the target variable 'total_pop' and keep the names
feature_names <- names(population_data)[names(population_data) != "total_pop"]
population_matrix <- as.matrix(population_data %>% select(-total_pop))

# Calculate feature importance
importance_matrix <- xgb.importance(feature_names = feature_names, model = xgb_model)

# Display feature importance
print(importance_matrix)


# Display feature importance
print(importance_matrix)

