install.packages("shiny")
library("shiny")

source("ui.R")
source("server.R")
shinyApp(ui = ui, server = server)

intro_panel <- tabPanel(
  "[Tab Title]",
  
  titlePanel("[Page Title]"),
  
  img(src = "[img source]"),
  
  p("[Summary text for page]"),
  p(a(href = "[url]", "[Link text]"))
)
