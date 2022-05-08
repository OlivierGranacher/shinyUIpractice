library(shiny)
library(shinydashboard)
library(fresh)
# reference : https://dreamrs.github.io/fresh/articles/vars-shinydashboard.html
mainColor <- "#999" # grey
mytheme <- create_theme(
  adminlte_color(
    light_blue = mainColor
  ),
  adminlte_sidebar(
    width = "190px",
    dark_bg = mainColor,
    # dark_hover_bg = "#81A1C1",
    # dark_color = "#2E3440"
  ),
  adminlte_global(
    content_bg = "#FFF",
     box_bg = "#FFF", 
    # info_box_bg = "#D8DEE9"
  )
)
  


ui <- shinydashboard::dashboardPage(
  header = dashboardHeader(title = "shinydashoard with fresh"
                  ),
  sidebar = dashboardSidebar(
    shinydashboard::sidebarMenu(
      shinydashboard::menuItem("info boxes",
                               badgeLabel = "test",
                               tabName = "infobox"),
      shinydashboard::menuItem("value boxes",
                               badgeLabel = "test",
                               tabName = "valuebox")
    )
  ), 
  body = dashboardBody(
    use_theme(mytheme),
    shinydashboard::tabItems(
      
      shinydashboard::tabItem(tabName = "infobox",
        shinydashboard::infoBox(
          title = "info box",
          value = 1,
          fill = T,
          color = "light-blue" # default color for infoBoxes
          
        ),
        shinydashboard::infoBox(
          title = "info box (color red)",
          value = 2,
          fill = T,
          color = "red"
        )
      ), # end of tab 1
      shinydashboard::tabItem(tabName = "valuebox",
        shinydashboard::valueBox(
          subtitle = "value box",
          value = 1.5,
          color = "light-blue"
        )    
      ) # end of tab 2
    ) # end of tab items
  )
)
server <- function(input, output) {
  
}
shinyApp(ui, server)
