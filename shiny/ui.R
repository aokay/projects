library(shiny)
library(markdown)


shinyUI(navbarPage("BikeShare",fluid=TRUE,
                   
tabPanel("Heatmap",
         # Generate a row with a sidebar
         sidebarLayout(fluid=TRUE,
           
           # Define the sidebar with one input
           sidebarPanel(
             selectInput("years", "Years:", 
                         choices=list("All","2011","2012")),
             selectInput("months", "Months:", 
                         choices=list("All","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),
             selectInput("days", "Days:", 
                         choices=list("All","Mon","Tues","Wed","Thur","Fri","Sat","Sun")),
             br(),
             dateInput('date',
                       label = 'Date input: yyyy-mm-dd',
                       min = "2011-01-01",
                       max = "2012-12-31",
                       value="2011-01-01",
                       
             ),
             actionButton("goButton", "Search Date"),
             hr(),
             helpText("Data from Washington DC https://www.capitalbikeshare.com/")

           ),

           # Create a spot for the barplot
           mainPanel(
             plotOutput("bikesharePlot")  
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
                          "Boxplot"="boxplot")),
           hr()         
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

