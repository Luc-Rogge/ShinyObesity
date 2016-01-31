
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


shinyServer(function(input, output) {
  weightAsText <- ""
  heightAsText <- ""
  bmiAsNumeric <- NA
  
  metric <- reactive({
    weightAsText <<- paste(input$kg, "kg")
    heightAsText <<- paste(input$cm, "cm")
    bmiAsNumeric <<- 10000 * input$kg / (input$cm * input$cm)
  })
  
  imperial <- reactive({
    weightAsText <<- paste(input$lbs, "lbs")
    heightAsText <<- paste(input$feet, "ft, ", input$inches, "in")
    height <- (input$feet * 12) + input$inches
    bmiAsNumeric <<- 703 * input$lbs / (height * height)
  })
  
  output$weight <- renderText({
    metric() # result not used, present just to trigger computation
    imperial() # result not used, present just to trigger computation
    weightAsText
    })
  
  output$height <- renderText({
    metric() # result not used, present just to trigger computation
    imperial() # result not used, present just to trigger computation
    heightAsText
  })
  
  output$bmi <- renderText({
    metric() # result not used, present just to trigger computation
    imperial() # result not used, present just to trigger computation
    paste(round(bmiAsNumeric,1), "kg/m²")
  })
  
  output$obesity <- renderText({
    metric() # result not used, present just to trigger computation
    imperial() # result not used, present just to trigger computation
    if (bmiAsNumeric > 30) "You possibly are obese, please ask a real doctor to make additional checks" else "You don't seem to be obese"
  })
})