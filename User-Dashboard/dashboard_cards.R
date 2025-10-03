# Dashboard Cards
create_user_cards <- function(user_data) {
  if (nrow(user_data) == 0) {
    return(NULL)
  }
  
  # Create cards for each user
  cards <- lapply(1:nrow(user_data), function(i) {
    user <- user_data[i, ]
    create_single_user_card(user)
  })
  
  # Wrap cards in a responsive grid
  fluidRow(
    class = "card-grid",
    cards
  )
}

# Create a single user card
create_single_user_card <- function(user) {
  # Generate unique modal ID
  modal_id <- paste0("user_modal_", gsub("[^A-Za-z0-9]", "", user$id))
  
  # Card colors based on profession
  card_colors <- get_profession_colors(user$profession)
  
  # Create the card
  column(
    width = 4,
    div(
      class = "user-card",
      style = paste0("background: linear-gradient(135deg, ", card_colors$primary, " 0%, ", card_colors$secondary, " 100%);"),
      div(
        class = "card-header",
        div(
          class = "user-avatar",
          h2(substr(user$name, 1, 1), style = "margin: 0; color: white; font-weight: bold;")
        ),
        div(
          class = "card-actions",
          actionButton(
            inputId = paste0("view_", gsub("[^A-Za-z0-9]", "", user$id)),
            label = "",
            icon = icon("eye"),
            class = "btn-card-action",
            onclick = paste0("$('#", modal_id, "').modal('show')")
          )
        )
      ),
      div(
        class = "card-body",
        h3(user$name, class = "user-name"),
        p(paste("ID:", user$id), class = "user-id"),
        p(user$profession, class = "user-profession"),
        if (user$company != "") {
          p(paste("at", user$company), class = "user-company")
        },
        div(
          class = "card-footer",
          div(
            class = "user-stats",
            span(
              paste(user$experience, "yrs exp"),
              class = "stat-badge"
            ),
            if (user$education != "") {
              span(
                user$education,
                class = "stat-badge"
              )
            }
          )
        )
      )
    ),
    # Modal for detailed view
    create_user_modal(user, modal_id)
  )
}

# Create user detail modal
create_user_modal <- function(user, modal_id) {
  modalDialog(
    title = div(
      h3(user$name, style = "margin: 0; color: #2c3e50;"),
      p(paste("ID:", user$id), style = "margin: 5px 0 0 0; color: #7f8c8d; font-size: 14px;")
    ),
    size = "l",
    easyClose = TRUE,
    div(
      class = "modal-content",
      fluidRow(
        column(6,
          div(
            class = "modal-section",
            h4("Personal Information", style = "color: #34495e; border-bottom: 2px solid #3498db; padding-bottom: 10px;"),
            div(
              class = "info-item",
              icon("envelope", style = "color: #3498db; margin-right: 10px;"),
              strong("Email: "),
              if (user$email != "") user$email else "Not provided"
            ),
            div(
              class = "info-item",
              icon("phone", style = "color: #3498db; margin-right: 10px;"),
              strong("Phone: "),
              if (user$phone != "") user$phone else "Not provided"
            ),
            div(
              class = "info-item",
              icon("calendar", style = "color: #3498db; margin-right: 10px;"),
              strong("Birth Date: "),
              if (user$birth_date != "") user$birth_date else "Not provided"
            ),
            div(
              class = "info-item",
              icon("venus-mars", style = "color: #3498db; margin-right: 10px;"),
              strong("Gender: "),
              if (user$gender != "") user$gender else "Not provided"
            ),
            if (user$address != "") {
              div(
                class = "info-item",
                icon("map-marker-alt", style = "color: #3498db; margin-right: 10px;"),
                strong("Address: "),
                user$address
              )
            }
          )
        ),
        column(6,
          div(
            class = "modal-section",
            h4("Professional Information", style = "color: #34495e; border-bottom: 2px solid #e74c3c; padding-bottom: 10px;"),
            div(
              class = "info-item",
              icon("briefcase", style = "color: #e74c3c; margin-right: 10px;"),
              strong("Profession: "),
              user$profession
            ),
            if (user$company != "") {
              div(
                class = "info-item",
                icon("building", style = "color: #e74c3c; margin-right: 10px;"),
                strong("Company: "),
                user$company
              )
            },
            if (user$position != "") {
              div(
                class = "info-item",
                icon("user-tie", style = "color: #e74c3c; margin-right: 10px;"),
                strong("Position: "),
                user$position
              )
            },
            div(
              class = "info-item",
              icon("clock", style = "color: #e74c3c; margin-right: 10px;"),
              strong("Experience: "),
              paste(user$experience, "years")
            ),
            if (user$education != "") {
              div(
                class = "info-item",
                icon("graduation-cap", style = "color: #e74c3c; margin-right: 10px;"),
                strong("Education: "),
                user$education
              )
            },
            if (user$linkedin != "") {
              div(
                class = "info-item",
                icon("linkedin", style = "color: #e74c3c; margin-right: 10px;"),
                strong("LinkedIn: "),
                tags$a(href = user$linkedin, target = "_blank", "View Profile")
              )
            }
          )
        )
      ),
      if (user$skills != "") {
        fluidRow(
          column(12,
            div(
              class = "modal-section",
              h4("Skills", style = "color: #34495e; border-bottom: 2px solid #2ecc71; padding-bottom: 10px;"),
              div(
                class = "skills-container",
                lapply(strsplit(user$skills, ",")[[1]], function(skill) {
                  span(
                    trimws(skill),
                    class = "skill-tag"
                  )
                })
              )
            )
          )
        )
      },
      if (user$bio != "") {
        fluidRow(
          column(12,
            div(
              class = "modal-section",
              h4("Bio", style = "color: #34495e; border-bottom: 2px solid #f39c12; padding-bottom: 10px;"),
              p(user$bio, style = "font-style: italic; color: #555; line-height: 1.6;")
            )
          )
        )
      },
      fluidRow(
        column(12,
          div(
            class = "modal-footer",
            p(paste("Registered on:", user$registration_date), 
              style = "color: #7f8c8d; font-size: 12px; margin: 0; text-align: right;")
          )
        )
      )
    )
  )
}

# Get profession-based colors
get_profession_colors <- function(profession) {
  color_schemes <- list(
    "Software Developer" = list(primary = "#3498db", secondary = "#2980b9"),
    "Data Scientist" = list(primary = "#e74c3c", secondary = "#c0392b"),
    "Designer" = list(primary = "#9b59b6", secondary = "#8e44ad"),
    "Manager" = list(primary = "#f39c12", secondary = "#e67e22"),
    "Analyst" = list(primary = "#2ecc71", secondary = "#27ae60"),
    "Consultant" = list(primary = "#1abc9c", secondary = "#16a085"),
    "Other" = list(primary = "#34495e", secondary = "#2c3e50")
  )
  
  if (profession %in% names(color_schemes)) {
    return(color_schemes[[profession]])
  } else {
    return(color_schemes[["Other"]])
  }
}

# Create empty state card
create_empty_state <- function() {
  div(
    class = "empty-state",
    div(
      class = "empty-state-content",
      icon("users", class = "fa-5x", style = "color: #bdc3c7; margin-bottom: 20px;"),
      h3("No Users Found", style = "color: #7f8c8d; margin-bottom: 10px;"),
      p("Add some users to see them in the dashboard", style = "color: #95a5a6;"),
      br(),
      actionButton(
        "go_to_add_user",
        "Add First User",
        class = "btn btn-primary btn-lg",
        onclick = "shinydashboard::updateTabItems(session, 'sidebar', 'add_user')"
      )
    )
  )
}

# Create user statistics cards
create_stats_cards <- function(user_data) {
  if (nrow(user_data) == 0) {
    return(NULL)
  }
  
  stats <- get_user_statistics(user_data)
  
  fluidRow(
    column(3,
      div(
        class = "stats-card",
        style = "background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);",
        div(
          class = "stats-content",
          h3(stats$total_users, style = "color: white; margin: 0; font-size: 2.5em;"),
          p("Total Users", style = "color: white; margin: 5px 0 0 0; font-size: 14px;")
        ),
        icon("users", style = "color: white; font-size: 3em; opacity: 0.3;")
      )
    ),
    column(3,
      div(
        class = "stats-card",
        style = "background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);",
        div(
          class = "stats-content",
          h3(stats$avg_experience, style = "color: white; margin: 0; font-size: 2.5em;"),
          p("Avg Experience", style = "color: white; margin: 5px 0 0 0; font-size: 14px;")
        ),
        icon("chart-line", style = "color: white; font-size: 3em; opacity: 0.3;")
      )
    ),
    column(3,
      div(
        class = "stats-card",
        style = "background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);",
        div(
          class = "stats-content",
          h3(length(stats$professions), style = "color: white; margin: 0; font-size: 2.5em;"),
          p("Professions", style = "color: white; margin: 5px 0 0 0; font-size: 14px;")
        ),
        icon("briefcase", style = "color: white; font-size: 3em; opacity: 0.3;")
      )
    ),
    column(3,
      div(
        class = "stats-card",
        style = "background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);",
        div(
          class = "stats-content",
          h3(stats$recent_registrations, style = "color: white; margin: 0; font-size: 2.5em;"),
          p("This Week", style = "color: white; margin: 5px 0 0 0; font-size: 14px;")
        ),
        icon("calendar-plus", style = "color: white; font-size: 3em; opacity: 0.3;")
      )
    )
  )
}
