# User Dashboard Application
library(shiny)
library(shinydashboard)
library(DT)
library(shinyjs)
library(shinyWidgets)
library(plotly)
library(dplyr)
library(ggplot2)

source("user_data.R")
source("dashboard_cards.R")
source("styles.R")

# Load existing user data or initialize empty data
user_data <- load_user_data()
ui <- dashboardPage(
  dashboardHeader(
    title = "User Dashboard",
    titleWidth = 250,
    tags$li(
      class = "dropdown",
      tags$a(
        href = "#",
        icon("user-circle", class = "fa-2x"),
        style = "color: white; padding: 15px;"
      )
    )
  ),
  
  dashboardSidebar(
    width = 250,
    sidebarMenu(
      id = "sidebar",
      menuItem("Dashboard", tabName = "dashboard", icon = icon("tachometer-alt")),
      menuItem("Add User", tabName = "add_user", icon = icon("user-plus")),
      menuItem("User List", tabName = "user_list", icon = icon("list")),
      menuItem("Analytics", tabName = "analytics", icon = icon("chart-bar")),
      menuItem("Data Management", tabName = "data_mgmt", icon = icon("database")),
      br(),
      div(
        style = "padding: 20px;",
        h4("Quick Stats", style = "color: #2c3e50; font-weight: bold;"),
        div(
          style = "background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                   padding: 15px; border-radius: 10px; margin: 10px 0;",
          h5("Total Users", style = "color: white; margin: 0;"),
          h3(textOutput("total_users"), style = "color: white; margin: 5px 0;")
        ),
        div(
          style = "background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); 
                   padding: 15px; border-radius: 10px; margin: 10px 0;",
          h5("Active Users", style = "color: white; margin: 0;"),
          h3(textOutput("active_users"), style = "color: white; margin: 5px 0;")
        )
      )
    )
  ),
  
  dashboardBody(
    useShinyjs(),
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
      tags$style(HTML(custom_styles()))
    ),
    
    tabItems(
      # Dashboard Tab
      tabItem(
        tabName = "dashboard",
        fluidRow(
          column(12, h2("User Dashboard", style = "color: #2c3e50; margin-bottom: 30px;"))
        ),
        fluidRow(
          uiOutput("user_cards")
        )
      ),
      
      # Add User Tab
      tabItem(
        tabName = "add_user",
        fluidRow(
          column(12, h2("Add New User", style = "color: #2c3e50; margin-bottom: 30px;"))
        ),
        fluidRow(
          column(6,
            div(
              class = "form-container",
              h3("Personal Information", style = "color: #34495e; margin-bottom: 20px;"),
              textInput("user_name", "Full Name", placeholder = "Enter full name"),
              textInput("user_id", "User ID", placeholder = "Enter unique ID"),
              selectInput("profession", "Profession", 
                         choices = c("Software Developer", "Data Scientist", "Designer", 
                                   "Manager", "Analyst", "Consultant", "Other")),
              textInput("email", "Email", placeholder = "Enter email address"),
              textInput("phone", "Phone", placeholder = "Enter phone number"),
              dateInput("birth_date", "Birth Date"),
              selectInput("gender", "Gender", choices = c("Male", "Female", "Other")),
              textAreaInput("address", "Address", placeholder = "Enter full address", rows = 3)
            )
          ),
          column(6,
            div(
              class = "form-container",
              h3("Professional Information", style = "color: #34495e; margin-bottom: 20px;"),
              textInput("company", "Company", placeholder = "Enter company name"),
              textInput("position", "Position", placeholder = "Enter job position"),
              numericInput("experience", "Years of Experience", value = 0, min = 0, max = 50),
              textInput("skills", "Skills", placeholder = "Enter skills (comma separated)"),
              selectInput("education", "Education Level", 
                         choices = c("High School", "Bachelor's", "Master's", "PhD", "Other")),
              textInput("linkedin", "LinkedIn Profile", placeholder = "Enter LinkedIn URL"),
              textAreaInput("bio", "Bio", placeholder = "Tell us about yourself", rows = 4),
              br(),
              actionButton("add_user_btn", "Add User", 
                          class = "btn btn-primary btn-lg",
                          style = "width: 100%; padding: 15px; font-size: 16px;")
            )
          )
        )
      ),
      
      # User List Tab
      tabItem(
        tabName = "user_list",
        fluidRow(
          column(12, h2("User Management", style = "color: #2c3e50; margin-bottom: 30px;"))
        ),
        fluidRow(
          column(12,
            div(
              class = "table-container",
              DT::dataTableOutput("user_table")
            )
          )
        )
      ),
      
      # Analytics Tab
      tabItem(
        tabName = "analytics",
        fluidRow(
          column(12, h2("User Analytics", style = "color: #2c3e50; margin-bottom: 30px;"))
        ),
        fluidRow(
          column(6,
            div(
              class = "chart-container",
              h3("Profession Distribution", style = "color: #34495e;"),
              plotlyOutput("profession_chart")
            )
          ),
          column(6,
            div(
              class = "chart-container",
              h3("Experience Distribution", style = "color: #34495e;"),
              plotlyOutput("experience_chart")
            )
          )
        ),
        fluidRow(
          column(12,
            div(
              class = "chart-container",
              h3("User Registration Timeline", style = "color: #34495e;"),
              plotlyOutput("timeline_chart")
            )
          )
        )
      ),
      
      # Data Management Tab
      tabItem(
        tabName = "data_mgmt",
        fluidRow(
          column(12, h2("Data Management", style = "color: #2c3e50; margin-bottom: 30px;"))
        ),
        fluidRow(
          column(6,
            div(
              class = "form-container",
              h3("Data Operations", style = "color: #34495e; margin-bottom: 20px;"),
              br(),
              actionButton("save_data_btn", "Save Data Now", 
                         class = "btn btn-success btn-lg",
                         style = "width: 100%; padding: 15px; font-size: 16px; margin-bottom: 10px;"),
              br(),
              actionButton("load_sample_btn", "Load Sample Data", 
                         class = "btn btn-info btn-lg",
                         style = "width: 100%; padding: 15px; font-size: 16px; margin-bottom: 10px;"),
              br(),
              actionButton("export_data_btn", "Export Data", 
                         class = "btn btn-warning btn-lg",
                         style = "width: 100%; padding: 15px; font-size: 16px; margin-bottom: 10px;"),
              br(),
              div(
                style = "background: #f8f9fa; padding: 15px; border-radius: 5px; margin-top: 20px;",
                h4("Data Status", style = "color: #2c3e50; margin-bottom: 10px;"),
                p(textOutput("data_status"), style = "margin: 5px 0;"),
                p(textOutput("last_saved"), style = "margin: 5px 0;"),
                p(textOutput("total_records"), style = "margin: 5px 0;")
              )
            )
          ),
          column(6,
            div(
              class = "form-container",
              h3("Backup Management", style = "color: #34495e; margin-bottom: 20px;"),
              br(),
              actionButton("create_backup_btn", "Create Backup", 
                         class = "btn btn-primary btn-lg",
                         style = "width: 100%; padding: 15px; font-size: 16px; margin-bottom: 10px;"),
              br(),
              div(
                style = "background: #f8f9fa; padding: 15px; border-radius: 5px; margin-top: 20px;",
                h4("Available Backups", style = "color: #2c3e50; margin-bottom: 10px;"),
                DT::dataTableOutput("backup_table")
              )
            )
          )
        )
      )
    )
  )
)

# Server Logic
server <- function(input, output, session) {
  
  # Reactive values for user data
  users <- reactiveVal(user_data)
  
  # Update user data when new user is added
  observeEvent(input$add_user_btn, {
    if (input$user_name != "" && input$user_id != "") {
      new_user <- create_user(
        name = input$user_name,
        id = input$user_id,
        profession = input$profession,
        email = input$email,
        phone = input$phone,
        birth_date = as.character(input$birth_date),
        gender = input$gender,
        address = input$address,
        company = input$company,
        position = input$position,
        experience = input$experience,
        skills = input$skills,
        education = input$education,
        linkedin = input$linkedin,
        bio = input$bio
      )
      
      current_users <- users()
      current_users <- rbind(current_users, new_user)
      users(current_users)
      
      # Save data to file
      save_success <- auto_save_data(current_users)
      
      # Clear form
      lapply(c("user_name", "user_id", "email", "phone", "company", 
               "position", "skills", "linkedin", "bio"), function(x) {
        updateTextInput(session, x, value = "")
      })
      updateNumericInput(session, "experience", value = 0)
      
      if (save_success) {
        showNotification("User added and saved successfully!", type = "success")
      } else {
        showNotification("User added but failed to save data!", type = "warning")
      }
    } else {
      showNotification("Please fill in required fields (Name and ID)", type = "error")
    }
  })
  
  # Render user cards
  output$user_cards <- renderUI({
    user_data <- users()
    if (nrow(user_data) == 0) {
      div(
        class = "empty-state",
        h3("No users found"),
        p("Add some users to see them in the dashboard"),
        icon("users", class = "fa-5x", style = "color: #bdc3c7; margin: 20px;")
      )
    } else {
      create_user_cards(user_data)
    }
  })
  
  # Render user table
  output$user_table <- DT::renderDataTable({
    user_data <- users()
    if (nrow(user_data) > 0) {
      display_data <- user_data[, c("name", "id", "profession", "email", "company", "position")]
      DT::datatable(
        display_data,
        options = list(
          pageLength = 10,
          dom = 'Bfrtip',
          buttons = c('copy', 'csv', 'excel', 'pdf', 'print')
        ),
        extensions = 'Buttons',
        class = 'display nowrap compact',
        filter = 'top'
      )
    }
  })
  
  # Analytics charts
  output$profession_chart <- renderPlotly({
    user_data <- users()
    if (nrow(user_data) > 0) {
      profession_counts <- table(user_data$profession)
      plot_ly(
        x = names(profession_counts),
        y = as.numeric(profession_counts),
        type = "bar",
        marker = list(
          color = c("#3498db", "#e74c3c", "#2ecc71", "#f39c12", "#9b59b6", "#1abc9c", "#34495e"),
          line = list(color = "white", width = 2)
        )
      ) %>%
        layout(
          title = "",
          xaxis = list(title = "Profession"),
          yaxis = list(title = "Count"),
          margin = list(l = 50, r = 50, t = 50, b = 50)
        )
    }
  })
  
  output$experience_chart <- renderPlotly({
    user_data <- users()
    if (nrow(user_data) > 0) {
      plot_ly(
        x = user_data$experience,
        type = "histogram",
        marker = list(
          color = "#3498db",
          line = list(color = "white", width = 2)
        )
      ) %>%
        layout(
          title = "",
          xaxis = list(title = "Years of Experience"),
          yaxis = list(title = "Count"),
          margin = list(l = 50, r = 50, t = 50, b = 50)
        )
    }
  })
  
  output$timeline_chart <- renderPlotly({
    user_data <- users()
    if (nrow(user_data) > 0) {
      user_data$registration_date <- as.Date(user_data$registration_date)
      timeline_data <- user_data %>%
        group_by(registration_date) %>%
        summarise(count = n(), .groups = 'drop')
      
      plot_ly(
        data = timeline_data,
        x = ~registration_date,
        y = ~count,
        type = "scatter",
        mode = "lines+markers",
        line = list(color = "#e74c3c", width = 3),
        marker = list(color = "#e74c3c", size = 8)
      ) %>%
        layout(
          title = "",
          xaxis = list(title = "Date"),
          yaxis = list(title = "New Users"),
          margin = list(l = 50, r = 50, t = 50, b = 50)
        )
    }
  })
  
  # Statistics
  output$total_users <- renderText({
    nrow(users())
  })
  
  output$active_users <- renderText({
    nrow(users()) # Assuming all users are active for now
  })
  
  # Data Management Server Logic
  
  # Save data manually
  observeEvent(input$save_data_btn, {
    current_data <- users()
    save_success <- auto_save_data(current_data)
    if (save_success) {
      showNotification("Data saved successfully!", type = "success")
    } else {
      showNotification("Failed to save data!", type = "error")
    }
  })
  
  # Load sample data
  observeEvent(input$load_sample_btn, {
    sample_data <- generate_sample_data(5)
    current_data <- users()
    
    # Check for ID conflicts and adjust if needed
    existing_ids <- current_data$id
    for (i in 1:nrow(sample_data)) {
      while (sample_data$id[i] %in% existing_ids) {
        sample_data$id[i] <- paste0("USR", sprintf("%03d", as.numeric(substr(sample_data$id[i], 4, 6)) + 1))
      }
      existing_ids <- c(existing_ids, sample_data$id[i])
    }
    
    combined_data <- rbind(current_data, sample_data)
    users(combined_data)
    
    save_success <- auto_save_data(combined_data)
    if (save_success) {
      showNotification("Sample data loaded and saved successfully!", type = "success")
    } else {
      showNotification("Sample data loaded but failed to save!", type = "warning")
    }
  })
  
  # Export data
  observeEvent(input$export_data_btn, {
    current_data <- users()
    if (nrow(current_data) > 0) {
      filename <- export_user_data(current_data, "csv")
      showNotification(paste("Data exported to:", filename), type = "success")
    } else {
      showNotification("No data to export!", type = "warning")
    }
  })
  
  # Create backup
  observeEvent(input$create_backup_btn, {
    current_data <- users()
    save_success <- auto_save_data(current_data)
    if (save_success) {
      showNotification("Backup created successfully!", type = "success")
    } else {
      showNotification("Failed to create backup!", type = "error")
    }
  })
  
  # Data status outputs
  output$data_status <- renderText({
    if (file.exists("user_data.csv")) {
      "Data file exists"
    } else {
      "No data file found"
    }
  })
  
  output$last_saved <- renderText({
    if (file.exists("user_data.csv")) {
      file_info <- file.info("user_data.csv")
      paste("Last saved:", format(file_info$mtime, "%Y-%m-%d %H:%M:%S"))
    } else {
      "Never saved"
    }
  })
  
  output$total_records <- renderText({
    paste("Total records:", nrow(users()))
  })
  
  # Backup table
  output$backup_table <- DT::renderDataTable({
    backup_list <- list_backups()
    if (nrow(backup_list) > 0) {
      DT::datatable(
        backup_list,
        options = list(
          pageLength = 5,
          dom = 't',
          ordering = FALSE
        ),
        colnames = c("File", "Date", "Size (bytes)"),
        class = 'display compact'
      )
    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)
