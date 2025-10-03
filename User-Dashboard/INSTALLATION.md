# Installation Guide

## Prerequisites

### 1. Install R
- Download R from: https://cran.r-project.org/bin/windows/base/
- Run the installer with default settings
- **Important**: Check "Add R to PATH" during installation

### 2. Install RStudio (Recommended)
- Download RStudio from: https://posit.co/download/rstudio-desktop/
- Install with default settings
- RStudio will automatically detect your R installation

## Project Setup

### 1. Clone or Download Project
```bash
git clone https://github.com/parthesaurabh1616/R-Programming-Projects.git
cd R-Programming-Projects/User-Dashboard
```

### 2. Install Required Packages
Open R or RStudio and run:
```r
install.packages(c("shiny", "shinydashboard", "DT", "shinyjs", 
                   "shinyWidgets", "plotly", "dplyr", "ggplot2", "jsonlite"))
```

### 3. Run the Application

#### Option A: Web Application (Full Features)
```r
shiny::runApp("app.R")
```

#### Option B: Console Application (No Packages Required)
```r
source("console_dashboard.R")
```

#### Option C: Quick Test
```r
source("quick_test.R")
```

## Troubleshooting

### R Not Found Error
- Ensure R is installed and added to PATH
- Restart your terminal/command prompt after installation
- Try running `R --version` to verify installation

### Package Installation Issues
- Update R to the latest version
- Try installing packages one by one
- Use `install.packages("package_name", dependencies = TRUE)`

### RStudio Issues
- Make sure RStudio is pointing to the correct R installation
- Go to Tools > Global Options > R General
- Verify the R installation path

## File Structure
```
User-Dashboard/
├── app.R                 # Main Shiny application
├── console_dashboard.R   # Console version
├── user_data.R          # Data management functions
├── dashboard_cards.R     # Card creation functions
├── styles.R            # Custom styling
├── test_app.R          # Comprehensive testing
├── quick_test.R         # Simple test
└── README.md           # This file
```

## Features
- User registration and management
- Data validation and analytics
- Interactive charts and visualizations
- Export functionality (CSV, JSON)
- Responsive web interface
- Console-based alternative
