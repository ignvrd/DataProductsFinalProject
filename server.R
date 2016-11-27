
library(shiny)
library(datasets)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  years <- c(1951,1956,1957,1958,1959,1960,1961)
  model <- reactive({lm(WorldPhones[ ,input$continent] ~ years)})
  output$distPlot <- renderPlot({
    
    xlab <- ifelse(input$x_axis,paste0("Years for: ",input$continent),"")
    ylab <- ifelse(input$y_axis,paste0("Number of phones for: ",input$continent),"")
    main <- ifelse(input$main_title,paste0("Regression Phones vs Years for: ",input$continent),"")
    # draw the histogram with the specified number of bins
    plot(WorldPhones[ ,input$continent] ~ years, xlab = xlab, ylab = ylab,main = main)
    abline(model())
  })
  
  output$prediction <- renderText({ ifelse(input$predict,model()$coefficients[1]+input$pre_year*model()$coefficients[2],"NA")
                                 })
  
})
