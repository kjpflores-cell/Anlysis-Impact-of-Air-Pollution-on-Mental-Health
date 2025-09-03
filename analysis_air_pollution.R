# ==============================================================================
# Title: The Impact of Air Pollution on Mental Health
# Author: Karen J. Peralta Flores
# Objective: To identify the impact of NO2 pollution on sleep and stress levels
#            for a professional portfolio.
# Study Location: Barcelona, Spain
# Data Source: CitieS-Health Project (data extracted from Kaggle)
# ==============================================================================

# STEP 1: Install and Load Libraries
# The 'tidyverse' library is a powerful suite of packages for data science in R.
# It includes 'dplyr' for data manipulation and 'ggplot2' for visualization.
# If you don't have it installed, uncomment the next line to install it.
# install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

# ==============================================================================
# STEP 2: Load and Prepare Data
# ==============================================================================

# To load your data from your computer, place the CSV file in your R project
# folder and uncomment the line below. Replace "your_file.csv" with the real
# name of your file.
# data <- read_csv("CitieSHealth_BCN_DATA_PanelStudy_20220414.csv")

# For this project, we will use a sample dataset that resembles yours,
# including the missing values (NA).
data <- tibble(
  id = 1:20,
  stress = c(4.2, 5.1, NA, 3.8, 6.0, 4.5, 3.9, 5.2, NA, 7.0, 4.4, 5.8, NA, 3.1, 6.5, 4.8, 5.5, NA, 3.7, 5.0),
  sleep = c(7.1, 6.8, 5.5, 8.0, 6.2, NA, 7.5, 6.9, 8.1, 5.0, 7.0, NA, 6.3, 7.2, 5.9, 8.0, 6.7, NA, 7.3, 6.5),
  no2bcn_24h_x30 = c(0.8, 1.2, 1.5, NA, 0.9, 1.1, 1.4, 0.7, 1.3, NA, 1.0, 1.6, 1.8, 0.6, 1.2, 1.0, 1.4, 0.9, 1.7, NA)
)

# ==============================================================================
# STEP 3: Data Cleaning and Processing
# ==============================================================================

# We will fill in the missing values in 'stress' and 'sleep' with the mean and
# remove the rows with missing NO2 values to avoid bias.
clean_data <- data %>%
  mutate(stress = replace_na(stress, mean(stress, na.rm = TRUE))) %>%
  mutate(sleep = replace_na(sleep, mean(sleep, na.rm = TRUE))) %>%
  filter(!is.na(no2bcn_24h_x30)) %>%
  mutate(across(c(stress, sleep, no2bcn_24h_x30), ~round(., 2)))

# We calculate the mean of NO2 for classification and create a new column.
avg_no2 <- mean(clean_data$no2bcn_24h_x30)
clean_data <- clean_data %>%
  mutate(pollution_level = if_else(no2bcn_24h_x30 > avg_no2, "High", "Low"))

# ==============================================================================
# STEP 4: Analyze and Visualize
# ==============================================================================

# We summarize the data for visualization. First, we group and calculate the averages.
summary_data <- clean_data %>%
  group_by(pollution_level) %>%
  summarise(
    avg_sleep = mean(sleep),
    avg_stress = mean(stress)
  )

# We convert the data from "wide" to "long" format to plot them together.
long_summary_data <- summary_data %>%
  pivot_longer(
    cols = starts_with("avg"),
    names_to = "metric",
    values_to = "average_value"
  ) %>%
  mutate(metric = recode(metric, "avg_sleep" = "Sleep", "avg_stress" = "Stress"))

# We create a single bar chart that compares sleep and stress.
plot_combined <- ggplot(data = long_summary_data, aes(x = metric, y = average_value, fill = pollution_level)) +
  geom_col(position = "dodge") +
  labs(title = "Average Sleep and Stress by Pollution Level",
       x = "Metric",
       y = "Average (scale of 0 to 10)",
       fill = "Pollution Level") +
  scale_y_continuous(limits = c(0, 10)) + # We ensure the Y-axis goes from 0 to 10
  theme_minimal() + # A cleaner theme for the plot
  theme(plot.title = element_text(hjust = 0.5))

# We save the combined plot as a PNG file
ggsave("combined_pollution_analysis.png", plot = plot_combined, width = 8, height = 6)

# We print the plot to make it appear in the R console
print(plot_combined)
