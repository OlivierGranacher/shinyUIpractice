library(shiny)
library(shinydashboard)
library(fresh)
# reference : https://dreamrs.github.io/fresh/articles/vars-shinydashboard.html
mainColor <- "#999"
mytheme <- create_theme(
  adminlte_color(
    light_blue = mainColor
  ),
  adminlte_sidebar(
    width = "400px",
    dark_bg = mainColor,
    # dark_hover_bg = "#81A1C1",
    # dark_color = "#2E3440"
  ),
  adminlte_global(
    # content_bg = "#FFF",
    # box_bg = "#D8DEE9", 
    # info_box_bg = "#D8DEE9"
  )
)
  


ui <- shinydashboard::dashboardPage(
  header = dashboardHeader(title = "dashBoard"
                  ),
  sidebar = dashboardSidebar(), 
  body = dashboardBody(
    use_theme(mytheme),
    box(collapsible = T, background = "teal")
  )
)
server <- function(input, output) {
  
}
shinyApp(ui, server)
