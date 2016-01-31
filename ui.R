# This is the user-interface definition of a Shiny web application.

library(shiny)

shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Oversimplified obesity prediction"),

  # Sidebar with inputs
  sidebarPanel(
      helpText("Please enter both your weight and height, either in the 'metrics units' area, either in the 'imperial units' area, then look at the obesity prediction in the right panel."),
      helpText(a("(Click here for the github repository)", href="https://github.com/Luc-Rogge/ShinyObesity", target="_blank")),
      h2("Using metric units:"),
      numericInput("kg",
                  "Your weight (kg):",
                  min = 1,
                  value = 60,
                  step = 1),
      numericInput("cm",
                   "Your height (cm):",
                   min = 1,
                   value = 160,
                   step = 1),
      h2("Using imperial units:"),
      numericInput("lbs",
                   "Your weight (lbs):",
                   min = 1,
                   value = 150,
                   step = 1),
      numericInput("feet",
                   "Your height (feet):",
                   min = 1,
                   value = 6,
                   step = 1),
      numericInput("inches",
                   "Your height (inches):",
                   min = 0,
                   value = 0,
                   step = 1)
  ),

    # Show results
    mainPanel(
      h3("Your weight:"),
      verbatimTextOutput("weight"),
      h3("Your height:"),
      verbatimTextOutput("height"),
      h3("Your body mass index:"),
      verbatimTextOutput("bmi"),
      h3("Likelihood to be obese:"),
      verbatimTextOutput("obesity")
    )
  )
)