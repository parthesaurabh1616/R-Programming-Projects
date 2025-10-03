# Console User Dashboard
if (!require("data.table", quietly = TRUE)) {
  install.packages("data.table")
  library(data.table)
}

# User data storage
users <- data.frame(
  name = character(0),
  id = character(0),
  profession = character(0),
  email = character(0),
  experience = numeric(0),
  stringsAsFactors = FALSE
)

# Function to add user
add_user <- function() {
  cat("\n=== Add New User ===\n")
  name <- readline("Enter name: ")
  id <- readline("Enter ID: ")
  profession <- readline("Enter profession: ")
  email <- readline("Enter email: ")
  experience <- as.numeric(readline("Enter experience (years): "))
  
  new_user <- data.frame(
    name = name,
    id = id,
    profession = profession,
    email = email,
    experience = experience
  )
  
  users <<- rbind(users, new_user)
  cat("✅ User added successfully!\n")
}

# Function to display users
display_users <- function() {
  cat("\n=== User Dashboard ===\n")
  if (nrow(users) == 0) {
    cat("No users found. Add some users first!\n")
  } else {
    print(users)
    cat("\n📊 Statistics:\n")
    cat("Total Users:", nrow(users), "\n")
    cat("Avg Experience:", round(mean(users$experience), 1), "years\n")
    cat("Professions:", length(unique(users$profession)), "\n")
  }
}

# Function to search users
search_users <- function() {
  cat("\n=== Search Users ===\n")
  search_term <- readline("Enter search term: ")
  
  if (nrow(users) == 0) {
    cat("No users to search.\n")
    return()
  }
  
  matches <- users[grepl(search_term, users$name, ignore.case = TRUE) |
                   grepl(search_term, users$profession, ignore.case = TRUE) |
                   grepl(search_term, users$email, ignore.case = TRUE), ]
  
  if (nrow(matches) == 0) {
    cat("No users found matching:", search_term, "\n")
  } else {
    cat("Found", nrow(matches), "user(s):\n")
    print(matches)
  }
}

# Main menu
main_menu <- function() {
  while (TRUE) {
    cat("\n" , rep("=", 50), "\n")
    cat("🎯 USER DASHBOARD - Console Version\n")
    cat(rep("=", 50), "\n")
    cat("1. Add User\n")
    cat("2. View All Users\n")
    cat("3. Search Users\n")
    cat("4. Statistics\n")
    cat("5. Exit\n")
    cat(rep("=", 50), "\n")
    
    choice <- readline("Enter your choice (1-5): ")
    
    switch(choice,
      "1" = add_user(),
      "2" = display_users(),
      "3" = search_users(),
      "4" = {
        cat("\n📊 Dashboard Statistics\n")
        cat("Total Users:", nrow(users), "\n")
        if (nrow(users) > 0) {
          cat("Average Experience:", round(mean(users$experience), 1), "years\n")
          cat("Professions:", paste(unique(users$profession), collapse = ", "), "\n")
          cat("Most Common Profession:", names(sort(table(users$profession), decreasing = TRUE))[1], "\n")
        }
      },
      "5" = {
        cat("👋 Goodbye!\n")
        break
      },
      cat("❌ Invalid choice. Please enter 1-5.\n")
    )
  }
}

# Add some sample data
cat("🚀 Starting User Dashboard...\n")
cat("Adding sample users...\n")

# Add sample users
users <- rbind(users, data.frame(
  name = "John Smith",
  id = "USR001",
  profession = "Developer",
  email = "john@example.com",
  experience = 5
))

users <- rbind(users, data.frame(
  name = "Sarah Johnson",
  id = "USR002",
  profession = "Designer",
  email = "sarah@example.com",
  experience = 3
))

users <- rbind(users, data.frame(
  name = "Mike Brown",
  id = "USR003",
  profession = "Manager",
  email = "mike@example.com",
  experience = 8
))

cat("✅ Sample users added!\n")

# Start the application
main_menu()
