#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predicting MPG vs weight for cars"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons("cyls",
                        "Number of cylinders:",
                       c('Four' = 4, 'Six' = 6, 'Eight' = 8)
                       ),
            sliderInput('predwt','Pick weight (in thousands of tons) of car',0,10,value=5),
            h3('Predicted MPG: '),
            textOutput('pred')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3('MPG vs weight plot for cars'),
            plotOutput("carPlot"),
            h3('Predicted y-intercept: '),
            textOutput('intercept'),
            h3('Predicted slope: '),
            textOutput('slope'),
            h3('Documentation'),
            p('The following applications predicts the mpg 
              of a car given the number of cylinders and weight. 
              The user enters the number of cylinders using a
              radio button and the weight with a slider.
              In addition to weight prediction, the app provides
              the user with a plot of the model, as well as the 
              parameters (slope and y-intercept).')
        )
    )
))
