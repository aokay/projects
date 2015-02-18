library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  
  # Fill in the spot we created for a plot
  output$bikesharePlot <- renderPlot({
    
    train_full$day <- weekdays(as.Date(train_full$datetime))
    train_full$time<- strptime(train_full$datetime, format="%Y-%m-%d %H:%M:%S")
    train_full$month<-format(time,'%b')
    
    day_hour_counts <- as.data.frame(aggregate(train_full[grep(input$months,train_full$month),"count"], list(train_full[grep(input$months,train_full$month),]$day, train_full[grep(input$months,train_full$month),]$time$hour), mean))
    
    day_hour_counts$Group.1 <- factor(day_hour_counts$Group.1, ordered=TRUE, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
    
    day_hour_counts$hour <- as.numeric(as.character(day_hour_counts$Group.2))
    ggplot(day_hour_counts, aes(x = hour, y = Group.1)) + geom_tile(aes(fill = x)) + scale_fill_gradient(name="Average Counts", low="white", high="purple") + theme(axis.title.y = element_blank())
  })
})

