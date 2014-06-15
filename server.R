#
# Amperio, 2014-06-15
#
# Shiny App for the 'Developing Data Products' course in Coursera
#
# Server component
#
# The app allows the user to represent a power function (with exponent selected by the user) a selected interval
#

# Library dependencies:
library(shiny)

# Server function:
shinyServer(
   function(input, output) {
      output$myFunctionPowerPlot <- renderPlot({
         # Calculate interval extremes and values:
         lower_end <- min(input$int_ini, input$int_end)
         upper_end <- max(input$int_ini, input$int_end)
         interval <- seq(from = lower_end, to = upper_end, length.out = 10000)
         fun_power <- input$fun_power
         fun_color <- input$fun_color
         label_x <- input$lab_x
         label_y <- input$lab_y
      
         # If power is less than 0, check and correct for the existence of 0 in the interval:
         if ((input$fun_power < 0) && (lower_end <= 0)){
            interval[which(interval==0)] = 0.0001
         }
         
         # Make the actual plot:
         plot(interval, y = interval^fun_power, col = fun_color, type = "l", lwd = 2, xlab = "x", ylab = "y", main = "Representation of power functions")
         # Add reference axis:
         abline(h = 0, v = 0, lwd = 1, col = "gray", lty = 3)
         # Add the label in the position specified by the user:
         fun_label_ini <- "Power function: y = "
         fun_label <- substitute(ini ~ x^ ~ power, list(ini = fun_label_ini, power = fun_power))
         label_x_pos <- lower_end + (upper_end - lower_end) * label_x
         label_y_pos <- min(interval^fun_power) + (max(interval^fun_power) - min(interval^fun_power)) * label_y
         text(x = label_x_pos, y = label_y_pos, labels = bquote(.(fun_label)))
   }
)
    
  }
)