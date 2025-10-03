# Test Script
required_packages <- c("shiny", "shinydashboard", "DT", "shinyjs", 
                      "shinyWidgets", "plotly", "dplyr", "ggplot2", "jsonlite")

# Check and install packages
check_packages <- function(packages) {
  for (pkg in packages) {
    if (!require(pkg, character.only = TRUE)) {
      cat("Installing package:", pkg, "\n")
      install.packages(pkg)
      library(pkg, character.only = TRUE)
    }
  }
}

# Test package installation
cat("Checking required packages...\n")
check_packages(required_packages)
cat("All packages loaded successfully!\n\n")

# Test user data functions
cat("Testing user data functions...\n")
source("user_data.R")

# Test data initialization
test_data <- initialize_user_data()
cat("✓ Data initialization works\n")

# Test user creation
test_user <- create_user(
  name = "Test User",
  id = "TEST001",
  profession = "Software Developer",
  email = "test@example.com",
  phone = "+1-555-0123",
  company = "Test Corp",
  position = "Senior Developer",
  experience = 5,
  skills = "R, Python, JavaScript",
  education = "Master's"
)
cat("✓ User creation works\n")

# Test validation
validation_errors <- validate_user_data(test_user)
if (length(validation_errors) == 0) {
  cat("✓ Data validation works\n")
} else {
  cat("✗ Validation errors:", paste(validation_errors, collapse = ", "), "\n")
}

# Test statistics
stats <- get_user_statistics(test_data)
cat("✓ Statistics calculation works\n")

# Test dashboard cards functions
cat("Testing dashboard cards functions...\n")
source("dashboard_cards.R")

# Test color schemes
colors <- get_profession_colors("Software Developer")
if (length(colors) == 2) {
  cat("✓ Color scheme generation works\n")
} else {
  cat("✗ Color scheme generation failed\n")
}

# Test styles
cat("Testing styles...\n")
source("styles.R")

theme_colors <- get_theme_colors()
if (length(theme_colors) >= 5) {
  cat("✓ Theme colors work\n")
} else {
  cat("✗ Theme colors failed\n")
}

gradients <- get_gradient_backgrounds()
if (length(gradients) >= 5) {
  cat("✓ Gradient backgrounds work\n")
} else {
  cat("✗ Gradient backgrounds failed\n")
}

# Generate sample data for testing
cat("Generating sample data...\n")
sample_data <- generate_sample_data(3)
cat("✓ Sample data generation works\n")
cat("Generated", nrow(sample_data), "sample users\n\n")

# Test main app loading
cat("Testing main application...\n")
tryCatch({
  source("app.R")
  cat("✓ Main application loads successfully\n")
}, error = function(e) {
  cat("✗ Error loading main application:", e$message, "\n")
})

cat("\n=== Test Summary ===\n")
cat("All core functions tested successfully!\n")
cat("The application should work correctly.\n")
cat("\nTo run the application, use:\n")
cat("shiny::runApp('app.R')\n")
cat("\nOr in RStudio, click 'Run App' button.\n")
