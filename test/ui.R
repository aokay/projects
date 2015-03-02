library(shiny)
library(markdown)


shinyUI(pageWithSidebar(
  headerPanel("actionButton test"),
  sidebarPanel(
    numericInput("n", "N:", min = 0, max = 100, value = 50),
    br(),
    actionButton("goButton", "Go!"),
    p("Click the button to update the value displayed in the main panel."),
    br(),
    numericInput("n2", "N:", min = 0, max = 100, value = 111),
    br(),
    actionButton("goButton2", "Go2!"),
    p("Click the button to update the value displayed in the main panel.")
  ),
  mainPanel(
    verbatimTextOutput("nText")
  )
))



