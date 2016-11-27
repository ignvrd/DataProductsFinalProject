
library(shiny)
library(datasets)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Prediction of the number of phones per continent"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
       selectInput("continent","Region:",choices=colnames(WorldPhones)),
       checkboxInput("main_title","Select if you want the title to appear",value=TRUE),
       checkboxInput("y_axis","check to show a legend in the y axis",value=TRUE),
       checkboxInput("x_axis","check to show a legend in the x axis",value=TRUE),
       checkboxInput("predict","check to predict the following year",value=TRUE),
       numericInput("pre_year","Predict the number of phones for the selected year:",value=1962,min=1962,max=2020,step=1)
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tabsetPanel(
            tabPanel("Documentation",h3("Introduction"),
                                     "This example shiny app has been though as an example to use plotting, text and reactive programming combinig together with as less requirements as possible.",
                                     "The app use the WorldPhone dataset which it is included by default in R. This dataset show from several years and regions the number of phones availables.",
                                     "The app will allow the user to select the region that the app will show. Additional the app will calculate a regression model and",
                                     "let the user use the model to predict the number of phones.",
                                     "The app has a tab with the documentation and another tab (called regression) with the results",
                                     h3("How to use it"),
                                     "The app expects several inputs to manipulate. The results appears in the result tab:",
                                     "The inputs are:",
                                     "1.The region from which the data will be loaded",
                                     "2.If the user requires prediction",
                                     "3.The yer of the prediction to use",
                                     "4.A set of visualization options, including the x and y axis and the title",
                                     h3("Technical details"),
                                     "Technicaly the app is a Shiny web app. The server part is based in the selection of particular data form the WorldPhone dataset and the construction of simple linear regression models upon these data. Based in the model an extrapolation is done with a specific year given by the user"
                     ),
            tabPanel("Regresion",h3("Basic Regresion Model:"),
                    plotOutput("distPlot"),
                    h3("Prediction:"),
                    "The Extrapolation for the number of phones in the year is:",
                    textOutput("prediction")))
    )
  )
))
