### RUN ### 
# OSUICode::run_example( 
#  "css/selector-nested/ex1", 
#   package = "OSUICode" 
# ) 

### APP CODE ### 
library(shiny)

ui <- navbarPage(
  "App Title",
  tabPanel(
    "Plot",
    tags$style(
      "li a {
        font-size: 25px;
        font-weight: bold;
      }
    "
    ),
    tabsetPanel(
      tabPanel("Plot"),
      tabPanel("Summary"),
      tabPanel("Table")
    )
  ),
  tabPanel("Summary"),
  tabPanel("Table")
)

server <- function(input, output) {}

shinyApp(ui, server)

