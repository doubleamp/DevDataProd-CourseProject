#
# Amperio, 2014-06-15
#
# Shiny App for the 'Developing Data Products' course in Coursera
#
# User Interface component
#
# The app allows the user to represent a power function (with exponent selected by the user) a selected interval
#

# Select the type of page template:
shinyUI(pageWithSidebar(
   
   # Define the title of the App:
   headerPanel("Representation of power functions", windowTitle = "Example Shiny App for the 'Developing Data Products' course"),
   
   # Establish the user inputs:
   sidebarPanel(
      # Instructions:
      h4("Help on using the app"),
      p("In the 'Main Inputs' section, select the order 'N' of the power function 'y = x^N' to be plotted, and then the interval in which to plot the function."),
      p("In the 'Minor plot adjustments' section, select the color of the plot and the position of the label presenting the function being plotted."),
      # Main inputs for the representation:
      h4("Main inputs"),
      numericInput('fun_power', label ="Select the power of the function:", value = 2, min = -25, max = 25, step = 1),
      sliderInput('int_ini', label = "Select the interval initial value:", value = -5, min = -100, max = 100, step = 1),
      sliderInput('int_end', label = "Select the interval end value:", value = 5, min = -100, max = 100, step = 1),
      # Additional controls for the representation:
   h4("Minor plot adjustments"),
      radioButtons('fun_color', label = "Select the color of the plot:",
                   choices = c("Black" = "black", "Green" = "green", "Blue" = "blue"), selected = "green"),
      sliderInput('lab_x', label = "Select the X position of the label:", value = 0.2, min = 0.0, max = 1, step = 0.05, format = "#%"),
      sliderInput('lab_y', label = "Select the Y position of the label:", value = 0.8, min = 0.0, max = 1, step = 0.05, format = "#%")
      ),
   
   # Present the resulting plot:
   mainPanel(
      plotOutput('myFunctionPowerPlot')
      )
   )
)
