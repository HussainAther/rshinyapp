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

sidebar_content <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Y Variable",
    choices = select_values,
    selected = "Speed"
  )
)
main_content <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "[Tab Title]",
  titlePanel("[Page Title]"),
  sidebarLayout(
    sidebar_content, main_content
  )
)
