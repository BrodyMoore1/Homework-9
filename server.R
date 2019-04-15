library(tidyverse)
library(shiny)
library(xgboost)

function(input, output){
  
  NP <- reactive({
    data.frame(
      Sepal.Length = input$sl,
      Sepal.Width = input$sw,
      Petal.Length = input$pl,
      Petal.Width = input$pw)
  })
  
  output$predictions <- DT::renderDataTable({
    data.frame(
      iris = c("setosa", "versicolor", "virginica"),
      Probs = predict(IrisModel, as.matrix(NP()))
    )
  })
  output$scatter <- renderPlot({
      plot(x =iris$Sepal.Length, y = iris$Sepal.Width, xlab ="Sepal Length", ylab = "Sepal Width", main = "Sepal Length-Width Scatter Plot")
      points(newPredict(), col="red", pch =20)
  })
  output$den1 <- renderPlot({
    d1 <- density(iris$Sepal.Width)
    hist(iris$Sepal.Width, breaks = 12, prob = TRUE, xlab = "Sepal Width", main = "Sepal Width Histogram / Density")
    lines(d1, lty = 3, col= "green")
    abline(v=NP()$Sepal.Width, col = "red")
  })
  output$den2 <- renderPlot({
    d2 <- density(iris$Sepal.Length)
    hist(iris$Sepal.Width, breaks = 12, prob = TRUE, xlab = "Sepal Length", main = "Sepal Length Histogram / Density")
    lines(d1, lty = 3, col= "green")
    abline(v=NP()$Sepal.Length, col = "red")
  })
  output$den3 <- renderPlot({
    d3 <- density(iris$Petal.Width)
    hist(iris$Petal.Width, breaks = 12, prob = TRUE, xlab = "Petal Width", main = "Petal Width Histogram / Density")
    lines(d3, lty = 3, col= "green")
    abline(v=NP()$Sepal.Width, col = "red")
  })
  output$den4 <- renderPlot({
    d4 <- density(iris$Petal.Length)
    hist(iris$Petal.Width, breaks = 12, prob = TRUE, xlab = "Petal Length", main = "Petal Length Histogram / Density")
    lines(d4, lty = 3, col= "green")
    abline(v=NP()$Petal.Length, col = "red")
  })
    
    
  
}