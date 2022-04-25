library(shiny)
library(htmltools)
myTag <- div(class = "divclass", 
             "Hello",
             h1(class ="hclass", 
                "You",
                tags$u("One"))
             
             )
myTag
str(myTag)
myTag$children
myTag$children[[2]]
myTag$children[[2]]$attribs

# Change Hello
myTag$children[[1]] <- "Bonjour"

# Change You
myTag$children[[2]]$children[[1]] <- "Not You"

# Remove h1 tag
myTag$children[[2]] <- myTag$children[[2]]$children[[1]]

# Add attribute
myTag <- tagAppendAttributes(myTag, id = "id2")

# Check attribute value
shiny::tagGetAttribute(myTag, "id")

# Nombre de children
length(myTag$children)
# Adds child
myTag <- shiny::tagAppendChild(myTag, div("added"))
length(myTag$children)

# Fonction to create tag with condition
buttonFn <- function(color = NULL)  {
  shiny::tags$button("Button",
                     type = "submit",
                      style = if (!is.null(color)) paste("color :", color)
                     )
}


# Use of %>% 
library(magrittr)
myTag %>% 
  tagAppendChild(p("added child"))

# Create tags programmatically

purrr::map(.x =1:5, .f = function(i) {span(i)}) %>% div()

## tagQuery
spans <- div(div(p(), lapply(1:5, function(i) span(i))))
str(spans)
spans$children[[1]]$children[[2]][[3]]$attribs$class <- "test"
spans

## Query Selectors
## 
tagQ <- tagQuery(spans)
tagQ
tagQ$find("p")
tagQ$length()
tagQ$children("div")$find("span")
tagQ$find("span")

# Create Tabset
tabSet <- lapply(1:3, FUN = function(i) {
  shiny::tabPanel(i, paste("T", i))
})

panels <- bs4Dash::tabsetPanel(.list = tabSet)
# Content of third panel
tagQuery(panels)$
  find("div.tab-pane")$ # div with class tab-pane
  filter(function(x, i) {htmltools::tagGetAttribute(x, "data-value") == 3})
# Adds fade class to tabs (BootStrap 4)
tagQuery(panels)$
  find("div.tab-pane")$
  addClass("fade")


shiny::icon("flag") # icon 
# Adds icon to tab 
newPanel <- tagQuery(panel)$
  find("a")$
  prepend(icon("flag"))
newPanel

# Test de changement de couleur
th <- div(h1("text"))
th <- tagQuery(th)$
  find("h1")$
  addAttr(style = "color : red;")$
  allTags()

##  Modify sequence of tags
tt <- div(p(), p(), p())
# adds class
tt1 <- tagQuery(tt)$
  find("p")$
  addClass("target")
# add text to each p
tt2 <- tagQuery(tt1)$
  filter(".target")$
  append("text")
tagQuery(tt2)$
  find('.target')$
  each( function(x, i) {
        colors <- c("red", "blue", "green")
        x <- htmltools::tagAppendChildren(x, paste(colors[i]))
        x
  }
  )

tagQuery(tt2)$
  find('.target')$
  each( function(x, i) {
        x <- htmltools::tagAppendChildren(x, paste(i))
        x
  }
  )
tagQuery(tt)$
  find("p")$
  each( function(x, i) {
        colors <- c("red", "blue", "green")
        x <- htmltools::tagAppendChildren(x, paste(colors[i]))

        x
  }
  )

tagQuery(tt)$
  find("p")$
  each(function(x, i) {
    colors <- c("red", "blue", "green")
    x <- htmltools::tagAppendChildren(x, paste(colors[i]))
    x <- htmltools::tagAppendAttributes(x,
                                        style = paste("color :", colors[i], ";"))
    x
  })
  

