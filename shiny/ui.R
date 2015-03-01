library(shiny)
library(markdown)


shinyUI(navbarPage("BikeShare",fluid=TRUE,
tabPanel("Heatmap",
         # Generate a row with a sidebar
         sidebarLayout(fluid=TRUE,
           
           # Define the sidebar with one input
           sidebarPanel(
             # Partial example
             selectInput("years", "Years:", 
                         choices=list("All","2011","2012")),
             selectInput("months", "Months:", 
                         choices=list("All","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),
             selectInput("days", "Days:", 
                         choices=list("All","Mon","Tues","Wed","Thur","Fri","Sat","Sun")),
             #submitButton("Search"),
             actionButton("goButton1", "Search"),
             br(),
             hr(),
             br(),
             dateInput('date',
                       label = 'Date input: yyyy-mm-dd',
                       min = "2011-01-01",
                       max = "2012-12-31",
                       value="",
                       
             ),    
             actionButton("goButton2", "Search"),
             br(),
             hr(),
             br(),
             tags$a(href="https://www.kaggle.com/c/bike-sharing-demand","Kaggle Competition"),
             br(),
             tags$a(href="https://www.capitalbikeshare.com/","Washington DC BikeShare Website"),
             hr(),
             br(),
             br(),
             downloadButton('downloadPlot', 'Download Plot')
           ),

           # Create a spot for the barplot
           mainPanel(
             tabsetPanel(type="tabs",
                    tabPanel("Plot",plotOutput("bikesharePlot")),
                    tabPanel("Data Table",dataTableOutput(outputId="table"))
             )
           )
               
         )
         
        

),
tabPanel("Plot",
         sidebarLayout(fluid=TRUE,
         # Define the sidebar with one input
         sidebarPanel(
           selectInput("years2", "Years:", 
                       choices=list("All","2011","2012")),
           selectInput("months2", "Months:", 
                       choices=list("All","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),
           selectInput("days2", "Days:", 
                       choices=list("All","Mon","Tues","Wed","Thur","Fri","Sat","Sun")),
           radioButtons("graph", "Insight:",
                        c("Plot"="plot",
                          "Line" = "line",
                          "SE (95% CI)" = "se",
                          "Boxplot"="boxplot"))#,
           #hr(),
           #downloadButton('downloadPlot', 'Download Plot')
         ),
         mainPanel(width=8,
           plotOutput("scatterPlot")
         ) 
        )
  ),
tabPanel("Interactive Boxplot",
     sidebarLayout(fluid=TRUE,
     #pageWithSidebar(
       #headerPanel(title=HTML("Plotly in Shiny"), windowTitle="Plotly in Shiny"),
       sidebarPanel(
           selectInput("years3", "Years:", 
                       choices=list("All","2011","2012")),
           selectInput("months3", "Months:", 
                       choices=list("All","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),
           selectInput("days3", "Days:", 
                       choices=list("All","Mon","Tues","Wed","Thur","Fri","Sat","Sun")),
           hr() 
         ),
         mainPanel(
           htmlOutput("plot")
         ) 
     #)
     )
)
)
)

