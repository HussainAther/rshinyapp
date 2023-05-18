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

ui <- navbarPage(
  "[Nav Bar Title]",
  intro_panel,
  second_panel
)

server <- function(input, output) {
  # assign values to `output` here
}

output$plot <- renderPlot({
    
   ggplot(data=characters, aes_string(x='Character', 
      y=input$y_var, fill="Class")) +
      geom_bar(stat="identity", width=0.8) +
      labs(x="Character", y=input$y_var) + coord_flip()
    
})
