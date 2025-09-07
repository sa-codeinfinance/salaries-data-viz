# Analyze the dataset "salaries.csv"

# Goal: analyze the distribution of salaries 
# and their relationship with currency and experience level.

# This dataset contains information about data scientist salaries.
# Main variables:
# salary_currency: salary currency
# salary: salary amount
# employment_type: type of employment contract
# experience_level: experience level (EN, MI, SE, EX)

#################################################
# Basic import
setwd("~/Desktop/Dataset_R")  # set the working directory
getwd()  # check if the correct working directory is being used

library(tidyverse)

salaries <- read_csv("salaries.csv")   
salaries                             # print the first rows of the dataset

# Check dataset dimensions
dim(salaries)    # returns number of rows and columns
# useful to understand the dataset size (number of observations and variables)

# Check variable names
names(salaries)  # shows the column names

# Dataset structure
head(salaries) # first 6 rows
str(salaries)  # shows variable types and structure

######################################################################
# Distributions for **non-ordered** qualitative variables

salaries |>
  count(salary_currency, name = "freq") |>                
  mutate(rel_freq = freq / sum(freq),                      
         perc     = round(rel_freq * 100, 2),              # percentage with 2 decimals
         cum_freq = cumsum(freq),                          
         cum_rel  = cumsum(rel_freq)) -> salary_currency_tbl

# Print
salary_currency_tbl

# Observe which currency is most used.
# USD is very frequent, EUR less frequent. The dataset is centered around the US market.

######################################################################
# Distributions for **ordered** qualitative variables

# Set a logical order to experience level categories
salaries |>
  mutate(experience_level = factor(experience_level,
                                   levels = c("EN", "MI", "SE", "EX"))) |>
  count(experience_level, name = "freq") |>
  mutate(rel_freq = freq / sum(freq),
         perc     = round(rel_freq * 100, 2),
         cum_freq = cumsum(freq),
         cum_rel  = cumsum(rel_freq),
         cum_perc = round(cumsum(perc), 2)) -> experience_level_tbl

experience_level_tbl

# Bar plot 
ggplot(experience_level, aes(x = experience_level, y = freq)) + geom_col()


######################################################################
# Quantitative continuous variables

# Filter and extract numeric vector
salaries |>
  filter(salary_currency == "EUR", employment_type == "FT") |>
  pull(salary) -> salary_EUR_FT

# Logarithmic transformation
log_salary <- log(salary_EUR_FT)

# Salaries are typically very skewed (some very high),
# the log transformation reduces skewness and stabilizes variance,
# making statistical analysis clearer.

# Descriptive checks
summary(log_salary)      # min, Q1, median, mean, Q3, max
mean(log_salary)         # mean
sd(log_salary)           # standard deviation
range(log_salary)        # range

######################################################################
# Plots

# Bar plot
salaries |>
  ggplot(aes(x = salary_currency)) +
  geom_bar() +
  labs(
    title = "Salary Currency Distribution",
    subtitle = "Basic column chart",
    x = "Currency",
    y = "Absolute frequencies") +
  theme_bw() -> barplot1

barplot1
# This chart immediately shows which currency is predominant.


# Horizontal bar plot
salaries |>
  ggplot(aes(y = salary_currency)) +
  geom_bar() +
  labs(
    title = "Currency Distribution (horizontal)",
    x = "Absolute frequencies",
    y = "Currency") +
  theme_bw() -> barplot2

barplot2

# Customized bar plot
salaries |>
  ggplot(aes(x = salary_currency)) +
  geom_bar() +
  labs(
    title = "Distribution of the 'Salary Currency' Variable",
    subtitle = "Column chart",
    caption = "Data: 'salaries.csv'",
    x = "Currency",
    y = "Absolute frequencies") +
  theme_bw() -> barplot3

barplot3
# The structure is the same as the basic barplot,
# but customized with title, subtitle, and caption
# for a clearer presentation.


# Grouped bar plots
salaries |>
  ggplot(aes(x = salary_currency, fill = experience_level)) +
  geom_bar(position = "dodge") +    # place bars side by side to compare absolute values
  labs(
    title = "Salary currency by experience level",
    subtitle = "Side-by-side column chart",
    fill = "Experience",
    x = "Currency",
    y = "Absolute frequencies") +
  theme_bw() -> barplot4

barplot4
# Comparison between two variables in absolute values.
# Compare experience levels within each currency.

# Proportional bar plot
salaries |>
  ggplot(aes(x = salary_currency, fill = experience_level)) +
  geom_bar(position = "fill") + 
  labs(
    title = "Percentage composition by experience level",
    subtitle = "Normalized column chart",
    fill = "Experience",
    x = "Currency",
    y = "Proportion") +
  theme_bw() -> barplot5

barplot5
# Comparison between two variables in percentages instead of absolute values,
# to understand the composition of each currency.


# Facet by experience level (create multiple plots)
salaries |>
  ggplot(aes(x = salary_currency, fill = experience_level)) +
  geom_bar() +
  facet_wrap(~ experience_level) +
  labs(
    title = "Currency distribution by experience level",
    subtitle = "Facet on experience_level",
    x = "Currency",
    y = "Absolute frequencies") +
  theme_bw() -> barplot6

barplot6
# Detailed analysis for subgroups

######################################################################
# Credits
# This analysis was inspired by the work and teaching material of Luigi Augugliaro, Full Professor at the University of Palermo
# The dataset and concepts were used for educational purposes only.

