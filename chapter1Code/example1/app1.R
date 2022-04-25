library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # script for changing colot of text
  tags$script("
    alert('click to change');
    // change text color
    function changeColor(color) {
    document.getElementById('hello').style.color = color;
    }
              "),


  tags$head(
    tags$style("p {color : red; font-size = 500px;}")
    ),
  p(id = "hello", onClick = "changeColor('blue')", "Hello World")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application
shinyApp(ui = ui, server = server)
