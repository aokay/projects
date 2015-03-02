

shinyServer(function(input, output) {

  values <- reactiveValues()
  
  #print(isolate(values$a))
  #print(isolate(values$b))
  
 observe({
    if (input$goButton == 0) {
      return
    } else {
       isolate({
        # Your logic here
        values$n<-input$n
      })
    }
  })
  
  observe({
    if (input$goButton2 == 0) {
      return
    } else {
      isolate({
        # Your logic here
        values$n<-input$n2
      })
    }
  })

  output$nText <- renderText({
        output<-values$n
        print(output)
    })
  
})






