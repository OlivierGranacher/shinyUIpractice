ui <- fluidPage(
  tags$style("p { color: red;}"),
  p("Hello World")
)

server <- function(input, output, session) {}

shinyApp(ui, server)
