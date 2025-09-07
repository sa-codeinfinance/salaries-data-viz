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

# How to Run
1. **Clone this repository:**
   ```bash
   git clone https://github.com/sa-codeinfinance/salaries-analysis.git
