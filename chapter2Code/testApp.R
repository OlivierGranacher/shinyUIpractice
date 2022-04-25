# test App
library(shiny)
library(htmltools)
tabSet <- lapply(1:3, FUN = function(i) {
  shiny::tabPanel(i, shiny::numericInput(i, i, i)) })
tabPanel <- bs4Dash::tabsetPanel(.list = tabSet)
tabPanel <- tagQuery(tabPanel)$
  find("a")$
  prepend(shiny::icon("flag"))
tt <- tagQuery(div(p(), p(), p()))$
  find("p")$
  each(function(x, i) {
    colors <- c("red", "blue", "green")
    x <- htmltools::tagAppendChildren(x, paste(colors[i]))
    x <- htmltools::tagAppendAttributes(x,
                                        style = paste("color :", colors[i], ";"))
    x
  })$allTags()

ui <- fluidPage(
  tabPanel$allTags(),
  tt
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)  
  
