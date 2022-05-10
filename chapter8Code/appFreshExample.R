# https://dreamrs.github.io/fresh/articles/vars-shinydashboard.html
# Qpp from vignette

library(fresh)
# Create the theme
mytheme <- create_theme(
  adminlte_color(
    light_blue = "#333"
  ),
  adminlte_sidebar(
    width = "300px",
    dark_bg = "#333",
    dark_hover_bg = "#555",
    dark_color = "#555"
  ),
  adminlte_global(
    content_bg = "#666",
    box_bg = "#333", 
    info_box_bg = "#333"
  )
)


library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  header = dashboardHeader(title = "My dashboard"),
  sidebar = dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Settings", tabName = "settings", icon = icon("sliders"))
    )
  ),
  body = dashboardBody(
    
    use_theme(mytheme), # <-- use the theme
    
    tabItems(
      tabItem(
        "dashboard",
        
        # infoBoxes
        fluidRow(
          infoBox(
            "Orders", "123", "Subtitle", icon = icon("credit-card"),
            color = "light-blue"
          ),
          valueBox(
            5846, "New Orders", icon = icon("credit-card"),
            color = "light-blue"
          ),
          box(
            title = "A box", solidHeader = TRUE, width = 4,
            status = "primary",
            "Content of the box"
          )
        )
      )
    )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
