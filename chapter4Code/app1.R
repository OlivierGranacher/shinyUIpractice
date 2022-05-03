# Shiny App chapter 4
# Dependency is handled through a CDN address
library(shiny)
# we create the card function before
my_card <- function(...) {
  withTags(
    tags$div(
      class = "card",
      tags$div(
        class = "card-body",
        tags$h5(class = "card-title", "Card title"),
        tags$p(class = "card-text", "Card content"),
        tags$button(
          type = "button",
          class = "btn btn-primary",
          "Button"
        )
      )
    )
  )
}

### RUN ### 
# OSUICode::run_example( 
#  "htmltools/deps/card/ex1", 
#   package = "OSUICode" 
# ) 

### APP CODE ### 
#library(OSUICode)

mdb_cdn <- "https://cdnjs.cloudflare.com/ajax/libs/" # Content Delivery Network
mdb_css <- paste0(mdb_cdn, "mdb-ui-kit/3.6.0/mdb.min.css")

shinyApp(
  ui = fluidPage(
    tags$style("body {background: gainsboro;}"),
    # load the css code
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = mdb_css
      )
    ),
    fluidRow(
      column(
        width = 6,
        br(),
        my_card("Card Content")
      )
    )
  ),
  server = function(input, output) {}
)
