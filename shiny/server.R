
library(ggplot2)
library(splines)
library(plotly)



# Rely on the 'train.csv' dataset in the datasets for Bikeshare
# package (which generally comes preloaded).

shinyServer(function(input, output, session) {

  # Read .csv file for training set
  train_full<-read.csv('train.csv')
  
  # Break the datetime variable down
  train_full$day <- weekdays(as.Date(train_full$datetime))
  train_full$time<- strptime(train_full$datetime, format="%Y-%m-%d %H:%M:%S")
  train_full$month<- format(train_full$time,'%b')
  train_full$year<- format(train_full$time,'%y') 
  train_full$hour<- format(train_full$time,'%H') 
  
  bike_year_data<-train_full
  
    values <- reactiveValues()
    
    observe({
      
    if(input$goButton1==0){
      day_hour_counts <- as.data.frame(aggregate(bike_year_data[,"count"], list(bike_year_data$day, bike_year_data$time$hour), mean))
      l<-labs(title=paste("All Years, All Months, All Days",sep=""))
      
    } else {
      
    # Input for All years from 2011 to 2012
    if(input$years=="All") {
      bike_year_data
    } else {
      bike_year_data<-train_full[grep(substr(input$years,3,4),train_full$year),]
    }
    
    # Find the months from input field
    if(input$months=="All") {
      day_hour_counts <- as.data.frame(aggregate(bike_year_data[,"count"], list(bike_year_data$day, bike_year_data$time$hour), mean))
    }
    else {
      day_hour_counts <- as.data.frame(aggregate(bike_year_data[grep(input$months,bike_year_data$month),"count"], 
                                    list(bike_year_data[grep(input$months,bike_year_data$month),]$day, 
                                         bike_year_data[grep(input$months,bike_year_data$month),]$time$hour), 
                                    mean))
      bike_year_data<-bike_year_data[grep(input$months,bike_year_data$month),]
    }
    
    # Find the Days in the Week as input field
    if(input$days=="All" && input$months=="All") {
      day_hour_counts
    } else if(input$days=="All" && input$months!="All") {
      day_hour_counts
      bike_year_data<-bike_year_data[grep(input$months,bike_year_data$month),]
    } 
    else {
      day_hour_counts <- as.data.frame(day_hour_counts[grep(input$days,day_hour_counts$Group.1),])
      bike_year_data<-bike_year_data[grep(input$days,bike_year_data$day),]
    }
    
    l<-labs(title=
             
             if(input$months=="Jan") { paste("January ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Feb") { paste("Febuary ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Mar") { paste("March ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Apr") { paste("April ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="May") { paste("May ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Jun") { paste("June ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") }  
             else if(input$months=="Jul") { paste("July ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Aug") { paste("August ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Sep") { paste("September ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Oct") { paste("October ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Nov") { paste("November ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months=="Dec") { paste("December ", input$years,", ",if(input$days=="All"){"All Day's"} 
                                             else if(input$days=="Mon") {"Monday's"} else if(input$days=="Tues") {"Tuesday's"} 
                                             else if(input$days=="Wed") {"Wednesday's"} else if(input$days=="Thur") {"Thursday's"} 
                                             else if(input$days=="Fri") {"Fridays's"} else if(input$days=="Sat") {"Saturday's"}
                                             else {"Sunday's"},   sep="") } 
             else if(input$months!="All" && input$years=="All" && input$days=="All") { paste("All Years", 
                                             if(input$months=="Jan") {"January"} else if(input$days=="Feb") {"February"} 
                                             else if(input$days=="Mar") {"March"} else if(input$days=="Apr") {"April"} 
                                             else if(input$days=="May") {"May"} else if(input$days=="Jun") {"June"}
                                             else if(input$days=="Jul") {"July"} else if(input$days=="Aug") {"August"}
                                             else if(input$days=="Sep") {"September"} else if(input$days=="Oct") {"October"}
                                             else if(input$days=="Nov") {"November"}
                                             else {"December"},  "All Day's", sep="") } 
             else if(input$months=="All" && input$years=="All" && input$days=="All") { paste("2011-2012, All Month's, All day's", sep="")}
             else if(input$months=="All" && input$years=="All" && input$days!="All") { paste( if(input$days=="All"){"2011-2012, All Day's"} 
                                             else if(input$days=="Mon") {"2011-2012, All Months's, Monday's"} 
                                             else if(input$days=="Tues") {"2011-2012, All Months's, Tuesday's"} 
                                             else if(input$days=="Wed") {"2011-2012, All Months's, Wednesday's"} 
                                             else if(input$days=="Thur") {"2011-2012, All Months's, Thursday's"} 
                                             else if(input$days=="Fri") {"2011-2012, All Months's, Fridays's"} 
                                             else if(input$days=="Sat") {"2011-2012, All Months's, Saturday's"}
                                             else {"2011-2012, All Months's, Sunday's"},   sep="") }       
            else if(input$months=="All" && input$years!="All" && input$days!="All") {
              paste( if(input$years=="2011"){"2011, All Months, "} else {"2012, All Months, "}, 
                     if(input$days=="Mon") {"Monday"}
                     else if(input$days=="Tues") {"Tuesday"}       
                     else if(input$days=="Wed") {"Wednesday"}   
                     else if(input$days=="Thur") {"Thursday"} 
                     else if(input$days=="Fri") {"Friday"}
                     else if(input$days=="Sat") {"Saturday"}
              ,sep="")
            }

           )
        
         
        }
    
    
    # Factor function to encode a vector in categories 
    day_hour_counts$Group.1 <- factor(day_hour_counts$Group.1, ordered=TRUE, 
                                      levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
    
    day_hour_counts$hours <- as.numeric(as.character(day_hour_counts$Group.2))
    
    isolate({values$output<-day_hour_counts
             values$label<-l
             values$data<-bike_year_data
             })
    })

    
    observe({
      
      if(input$goButton2==0) {

        day_hour_counts <- as.data.frame(aggregate(bike_year_data[,"count"], list(bike_year_data$day, bike_year_data$time$hour), mean))
        l<-labs(title=paste("All Years, All Months, All Days",sep=""))
        
      } else {
      
      
        if(input$date == Sys.Date()) {
          bike_year_data<-train_full
          day_hour_counts <- as.data.frame(aggregate(bike_year_data[,"count"], list(bike_year_data$day, bike_year_data$time$hour), mean))
          
          l<-labs(title=paste("All Years, All Months, All Days",sep=""))
        } 

        else {
        # Fill in the spot we created for a plot    
          bike_year_data<-train_full[grep(input$date,train_full$time),]
          day_hour_counts <- as.data.frame(aggregate(bike_year_data[,"count"], list(bike_year_data$day, bike_year_data$time$hour), mean))
        
          l<-labs(title=paste(input$date,sep=""))
          
        }
        
      }
      
      
      # Factor function to encode a vector in categories 
      day_hour_counts$Group.1 <- factor(day_hour_counts$Group.1, ordered=TRUE, 
                                      levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
      
      day_hour_counts$hours <- as.numeric(as.character(day_hour_counts$Group.2))
      isolate({values$output<-day_hour_counts
               values$label<-l
               values$data<-bike_year_data
               })
    })
    
   
    
  # Fill in   the spot we created for a plot
  output$bikesharePlot <- renderPlot({   
    # Plot the heatmap graph
    # set hour as.factor()
    p<-ggplot(values$output, aes(x = as.factor(hours), y = Group.1)) + xlab("Hours")  + geom_tile(aes(fill = x)) + scale_fill_gradient(name="Average Counts", low="white", high="purple") + theme(axis.title.y = element_blank())
    p<-p+values$label
    
    print(p)   
  })
  
  
  plotInput <- reactive({
    p<-ggplot(values$output, aes(x = as.factor(hours), y = Group.1)) + xlab("Hours")  + geom_tile(aes(fill = x)) + scale_fill_gradient(name="Average Counts", low="white", high="purple") + theme(axis.title.y = element_blank())
    p<-p+values$label
  })
  
  
  # Save graphs/plot
  output$downloadPlot <- downloadHandler(
    filename = function() {"heatmap.png"},
    content = function(file) {
      #ggsave(plotInput,file)
      png(file)
      print(plotInput()) # Fixed solution with this link http://stackoverflow.com/questions/14810409/save-plots-made-in-a-shiny-app
      dev.off()
   }
  )
  
  # Summary Table creation
  output$table<-renderDataTable({
    
    values$data[2:12]
  },options = list(lengthMenu = c(10,25,50,100),pageLength=10)) # Set the lengthMenu and pageLength


  output$scatterPlot <- renderPlot({
    # Input for All years from 2011 to 2012
    if(input$years2=="All") {
      bike_year_data<-train_full
    } else {
      bike_year_data<-train_full[grep(substr(input$years2,3,4),train_full$year),]
    }
    # Find the months from input field
    if(input$months2=="All") {
      bike_year_data
    }
    else {
      bike_year_data<-bike_year_data[grep(input$months2,bike_year_data$month),]
    }
    
    # Find the Days in the Week as input field
    if(input$days2=="All" && input$months2=="All") {
      bike_year_data
    } else if(input$days2=="All" && input$months2!="All") {
      bike_year_data
    } else {
      bike_year_data <-bike_year_data[grep(input$days2,bike_year_data$day),]
    }
   
    # Deafult ggplot()
    m<-ggplot(bike_year_data,aes(x=hour,y=count,group=1))+ geom_point() 
   
    # Plot Scatter plot
    if(input$graph=="plot") {
     m<-m+ ggtitle("ScatterPlot BikeShare Count vs Hours")
    }
    # Standard Error
    else if(input$graph=="se") {
      m<-m+stat_smooth(method="gam",formula=y~s(x,k=23),size=1,se=TRUE) + ggtitle("Line Plot (Standard Error 95% CI)")
    }
    # Line using General Additive Method
    else if(input$graph=="line") {
      m<-m+stat_smooth(method="gam",formula=y~s(x,k=23),size=1,se=FALSE) + ggtitle("Line Plot")
     
    } 
    else if(input$graph=="boxplot") {
      m<-ggplot(bike_year_data,aes(x=factor(hour),y=count))+ geom_point() 
      m<-m + geom_boxplot(outlier.colour = "red") + ggtitle("Boxplot")  
    }
   
   m<-m+xlab("Hours") + ylab("Bikes Hired") 
   print(m)
})

output$plot <- renderUI({
  
  bike_year_data<-train_full
  # Input for All years from 2011 to 2012
  if(input$years3=="All") {
    bike_year_data
  } else {
    bike_year_data<-train_full[grep(substr(input$years3,3,4),train_full$year),]
  }
  # Find the months from input field
  if(input$months3=="All") {
    bike_year_data
  }
  else {
    bike_year_data<-bike_year_data[grep(input$months3,bike_year_data$month),]
  }
  
  # Find the Days in the Week as input field
  if(input$days3=="All" && input$months3=="All") {
    bike_year_data
  } else if(input$days3=="All" && input$months3!="All") {
    bike_year_data
  } else {
    bike_year_data <-bike_year_data[grep(input$days3,bike_year_data$day),]
  }
  
  bike_year_data<-bike_year_data[order(bike_year_data$hour),]
  # Deafult ggplot()
  m<-ggplot(bike_year_data,aes(factor(hour),count))+ geom_point() + xlab("Hours") + ylab("Bikes Hired")
  m<-m + geom_boxplot(outlier.colour = "red") + ggtitle("Interactive Boxplot") 

  # Use plotly data visualisation   
  py <- plotly("AOKAY", "rds4784d66", "https://plot.ly")  # Open Plotly connection  

  data <- list(
    list(
      y = c(bike_year_data$count), 
      x= factor(bike_year_data$hour),
      boxpoints = "all", 
      jitter = 0.3, 
      pointpos = -2.0, 
      type = "box"
    )
  )
  layout<-list(
    title="Washington DC BikeShare",
    yaxis=list(title="Bikes Hired"),
    xaxis=list(title="Hours in a day")
  )
    
  res<- py$plotly(data, kwargs=list(layout=layout,filename="box-plot-jitter", fileopt="overwrite",auto_open=FALSE))
  
  
  py <- plotly("AOKAY", "rds4784d66", "https://plot.ly")  # Open Plotly connection  
  
  #res <- py$ggplotly(m, kwargs=list(filename="Plotly in Shiny",
  #                                  fileopt="overwrite", # Overwrite plot in Plotly's website
  #                                  auto_open=FALSE))
  
  tags$iframe(src=res$url,seamless=NA,
              frameBorder="0",  # Some aesthetics
              height=500,
              width=750)
  
  })

})




