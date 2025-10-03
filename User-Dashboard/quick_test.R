# Quick Test

cat("Testing User Dashboard...\n")

users <- data.frame(
  name = c("John Smith", "Sarah Johnson", "Mike Brown"),
  id = c("USR001", "USR002", "USR003"),
  profession = c("Developer", "Designer", "Manager"),
  experience = c(5, 3, 8)
)

cat("\n=== User Cards ===\n")
for (i in 1:nrow(users)) {
  user <- users[i, ]
  cat("┌─────────────────────────┐\n")
  cat("│ Name:", user$name, "\n")
  cat("│ ID:", user$id, "\n")
  cat("│ Profession:", user$profession, "\n")
  cat("│ Experience:", user$experience, "years\n")
  cat("└─────────────────────────┘\n\n")
}

cat("Statistics:\n")
cat("Total Users:", nrow(users), "\n")
cat("Avg Experience:", round(mean(users$experience), 1), "years\n")
cat("Professions:", length(unique(users$profession)), "\n")

cat("Test completed!\n")
