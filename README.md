# Salaries Analysis

Exploration and visualization of salaries data using **R** and the **tidyverse** package.  
The goal of this project is to analyze the distribution of salaries and their relationship with currency and experience level.

# Project Structure
- **data/salaries.csv** → Dataset containing salary information for data science roles.
- **R/salaries_analysis.R** → R script that:
  1. Imports and explores the dataset
  2. Analyzes qualitative and quantitative variables
  3. Creates visualizations (bar plots, grouped plots, proportional plots, facets)
- **output/** → Folder for saving generated graphs
- **README.md** → Project documentation

# Dataset Overview
This dataset contains information about salaries of data science professionals.

**Main variables:**
- **salary_currency** → Salary currency  
- **salary** → Salary amount  
- **employment_type** → Type of employment contract  
- **experience_level** → Experience level:
  - EN = Entry-level
  - MI = Mid-level
  - SE = Senior-level
  - EX = Expert-level

# Visualizations
The analysis includes:
- Basic bar plots for salary currency distribution
- Grouped bar plots comparing experience level by currency
- Proportional bar plots showing percentage composition
- Faceted plots for subgroup analysis


# Credits
This analysis was inspired by the work and teaching material of **Luigi Augugliaro, Full Professor at the University of Palermo**.  
The dataset and concepts were used for **educational purposes only**.

# How to Run
 **Clone this repository:**
   ```bash
   git clone https://github.com/sa-codeinfinance/salaries-analysis.git


