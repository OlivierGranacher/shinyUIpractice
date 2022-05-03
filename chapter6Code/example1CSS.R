### RUN ### 
# OSUICode::run_example( 
#  "css/selector-basics", 
#   package = "OSUICode" 
# ) 

### APP CODE ### 
library(shiny)

ui <- fluidPage(
  tags$style(
    "p, div {
      color: red;
    }"
  ),
  p("Hello World"),
  div("A block")
)

server <- function(input, output) {}

shinyApp(ui, server)
