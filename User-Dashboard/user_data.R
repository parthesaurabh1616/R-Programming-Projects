# User Data Management
initialize_user_data <- function() {
  data.frame(
    name = character(0),
    id = character(0),
    profession = character(0),
    email = character(0),
    phone = character(0),
    birth_date = character(0),
    gender = character(0),
    address = character(0),
    company = character(0),
    position = character(0),
    experience = numeric(0),
    skills = character(0),
    education = character(0),
    linkedin = character(0),
    bio = character(0),
    registration_date = character(0),
    stringsAsFactors = FALSE
  )
}

# Create a new user record
create_user <- function(name, id, profession, email = "", phone = "", 
                       birth_date = "", gender = "", address = "", 
                       company = "", position = "", experience = 0, 
                       skills = "", education = "", linkedin = "", bio = "") {
  
  # Validate required fields
  if (name == "" || id == "") {
    stop("Name and ID are required fields")
  }
  
  # Create user record
  user_record <- data.frame(
    name = trimws(name),
    id = trimws(id),
    profession = profession,
    email = trimws(email),
    phone = trimws(phone),
    birth_date = birth_date,
    gender = gender,
    address = trimws(address),
    company = trimws(company),
    position = trimws(position),
    experience = as.numeric(experience),
    skills = trimws(skills),
    education = education,
    linkedin = trimws(linkedin),
    bio = trimws(bio),
    registration_date = as.character(Sys.Date()),
    stringsAsFactors = FALSE
  )
  
  return(user_record)
}

# Validate user data
validate_user_data <- function(user_data) {
  errors <- c()
  
  # Check for required fields
  if (is.null(user_data$name) || user_data$name == "") {
    errors <- c(errors, "Name is required")
  }
  
  if (is.null(user_data$id) || user_data$id == "") {
    errors <- c(errors, "ID is required")
  }
  
  # Check email format if provided
  if (user_data$email != "" && !grepl("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$", user_data$email)) {
    errors <- c(errors, "Invalid email format")
  }
  
  # Check phone format if provided
  if (user_data$phone != "" && !grepl("^[0-9\\+\\-\\s\\(\\)]+$", user_data$phone)) {
    errors <- c(errors, "Invalid phone format")
  }
  
  # Check LinkedIn URL format if provided
  if (user_data$linkedin != "" && !grepl("^https?://", user_data$linkedin)) {
    errors <- c(errors, "LinkedIn URL must start with http:// or https://")
  }
  
  # Check experience is numeric
  if (!is.numeric(user_data$experience) || user_data$experience < 0) {
    errors <- c(errors, "Experience must be a positive number")
  }
  
  return(errors)
}

# Check if user ID already exists
check_user_id_exists <- function(user_data, new_id) {
  if (nrow(user_data) == 0) {
    return(FALSE)
  }
  return(new_id %in% user_data$id)
}

# Get user by ID
get_user_by_id <- function(user_data, user_id) {
  if (nrow(user_data) == 0) {
    return(NULL)
  }
  
  user_index <- which(user_data$id == user_id)
  if (length(user_index) == 0) {
    return(NULL)
  }
  
  return(user_data[user_index, ])
}

# Update user data
update_user <- function(user_data, user_id, updated_data) {
  user_index <- which(user_data$id == user_id)
  if (length(user_index) == 0) {
    stop("User not found")
  }
  
  # Update the user record
  for (field in names(updated_data)) {
    if (field %in% names(user_data)) {
      user_data[user_index, field] <- updated_data[[field]]
    }
  }
  
  return(user_data)
}

# Delete user
delete_user <- function(user_data, user_id) {
  user_index <- which(user_data$id == user_id)
  if (length(user_index) == 0) {
    stop("User not found")
  }
  
  return(user_data[-user_index, ])
}

# Search users
search_users <- function(user_data, search_term) {
  if (nrow(user_data) == 0 || search_term == "") {
    return(user_data)
  }
  
  search_term <- tolower(search_term)
  
  # Search across multiple fields
  matches <- apply(user_data, 1, function(row) {
    any(grepl(search_term, tolower(row), fixed = TRUE))
  })
  
  return(user_data[matches, ])
}

# Get user statistics
get_user_statistics <- function(user_data) {
  if (nrow(user_data) == 0) {
    return(list(
      total_users = 0,
      professions = data.frame(),
      avg_experience = 0,
      education_levels = data.frame(),
      recent_registrations = 0
    ))
  }
  
  stats <- list(
    total_users = nrow(user_data),
    professions = table(user_data$profession),
    avg_experience = round(mean(user_data$experience, na.rm = TRUE), 1),
    education_levels = table(user_data$education),
    recent_registrations = sum(as.Date(user_data$registration_date) >= Sys.Date() - 7)
  )
  
  return(stats)
}

# Export user data
export_user_data <- function(user_data, format = "csv") {
  if (nrow(user_data) == 0) {
    stop("No data to export")
  }
  
  timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
  
  if (format == "csv") {
    filename <- paste0("user_data_", timestamp, ".csv")
    write.csv(user_data, filename, row.names = FALSE)
  } else if (format == "json") {
    filename <- paste0("user_data_", timestamp, ".json")
    jsonlite::toJSON(user_data, pretty = TRUE)
    writeLines(jsonlite::toJSON(user_data, pretty = TRUE), filename)
  }
  
  return(filename)
}

# Generate sample data for testing
generate_sample_data <- function(n = 5) {
  sample_names <- c("John Smith", "Sarah Johnson", "Michael Brown", "Emily Davis", "David Wilson",
                    "Lisa Anderson", "Robert Taylor", "Jennifer Thomas", "Christopher Jackson", "Amanda White")
  
  sample_professions <- c("Software Developer", "Data Scientist", "Designer", "Manager", "Analyst")
  
  sample_companies <- c("Tech Corp", "Data Solutions", "Creative Agency", "Business Inc", "Analytics Pro")
  
  sample_data <- data.frame(
    name = sample(sample_names, n),
    id = paste0("USR", sprintf("%03d", 1:n)),
    profession = sample(sample_professions, n, replace = TRUE),
    email = paste0("user", 1:n, "@example.com"),
    phone = paste0("+1-555-", sprintf("%04d", sample(1000:9999, n))),
    birth_date = as.character(Sys.Date() - sample(365*20:365*50, n)),
    gender = sample(c("Male", "Female"), n, replace = TRUE),
    address = paste(sample(c("123", "456", "789"), n, replace = TRUE), 
                   sample(c("Main St", "Oak Ave", "Pine Rd"), n, replace = TRUE), 
                   sample(c("New York", "Los Angeles", "Chicago"), n, replace = TRUE)),
    company = sample(sample_companies, n, replace = TRUE),
    position = paste(sample(c("Senior", "Junior", "Lead"), n, replace = TRUE),
                    sample(c("Developer", "Analyst", "Manager", "Designer"), n, replace = TRUE)),
    experience = sample(1:15, n, replace = TRUE),
    skills = paste(sample(c("R", "Python", "JavaScript", "SQL", "Machine Learning"), n, replace = TRUE),
                  sample(c("Data Analysis", "Web Development", "Statistics"), n, replace = TRUE), sep = ", "),
    education = sample(c("Bachelor's", "Master's", "PhD"), n, replace = TRUE),
    linkedin = paste0("https://linkedin.com/in/user", 1:n),
    bio = paste("Experienced professional with", sample(3:10, n), "years in the field."),
    registration_date = as.character(Sys.Date() - sample(0:30, n)),
    stringsAsFactors = FALSE
  )
  
  return(sample_data)
}
