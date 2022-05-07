

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
     shiny::includeCSS("www/custom.css"),
     tags$style("#title { font-weight : bolder;}"),
     ## https://bulma.io/documentation/elements/button/
     tags$link(rel = "stylesheet", type="text/css", href="bulma.css"),
    # Application title
    titlePanel(h3("Test Bulma Button",
                  id = "title")
               ),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tags$button(class = "button is-large is-dark is-rounded", "Button")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
