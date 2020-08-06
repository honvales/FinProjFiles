#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    set.seed(2020-08-06)
    data(mtcars)
    # generate plot data based on input$cyls from ui.R
    databuild <- reactive({
        numcyls <- input$cyls
        plotdata <- mtcars[mtcars$cyl==numcyls, ]
    })
    output$pred <- renderText({
        
        numcyls <- input$cyls
        plotdata <- mtcars[mtcars$cyl==numcyls, ]
        mod <- lm(mpg ~ wt,data=plotdata)
        predict(mod,newdata=data.frame(wt=input$predwt))
    })
    
    output$carPlot <- renderPlot({
        
        library(ggplot2)
        # draw interactive plot using data
        numcyls <- input$cyls
        plotdata <- mtcars[mtcars$cyl==numcyls, ]
        mod <- lm(mpg ~ wt,data=plotdata)
        ggplot(plotdata, aes(x=wt, y=mpg)) + geom_point(color='blue') +
            geom_smooth(method='lm',color = 'red')
    })
    
    output$intercept <- renderText({
        numcyls <- input$cyls
        plotdata <- mtcars[mtcars$cyl==numcyls, ]
        mod <- lm(mpg ~ wt,data=plotdata)
        mod$coefficients[[1]]
    })
    
    output$slope <- renderText({
        numcyls <- input$cyls
        plotdata <- mtcars[mtcars$cyl==numcyls, ]
        mod <- lm(mpg ~ wt,data=plotdata)
        mod$coefficients[[2]]
    })

})
