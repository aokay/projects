library(shiny)
library(datasets)
library(markdown)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Bikeshare by Month"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("months", "Months:", 
                    choices=list("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),
        hr(),
        helpText("Data from Washington DC https://www.capitalbikeshare.com/")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("bikesharePlot")  
      ) 
    )
    


  )
)

