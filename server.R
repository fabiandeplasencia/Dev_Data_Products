library(shiny)
library(datasets)
library(caret)
library(rpart)
library(e1071)
library(rpart.plot)
library(rattle)
data(iris)
fit <- train(Species ~ ., method="rpart", data=iris,trControl = trainControl(number=5))
shinyServer(
      function(input, output) {
            output$prediction <- renderPrint ({
                  Sepal.Length = input$Sepal.Length
                  Sepal.Width = input$Sepal.Width
                  Petal.Length = input$Petal.Length
                  Petal.Width = input$Petal.Width
                  as.character(predict(fit,data.frame(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)))
            })
            output$plength <- renderPlot({
                  plot(iris$Petal.Length,iris$Sepal.Length,col=iris$Species)
                  legend("topleft", c("setosa", "versicolor", "virginica"),pch=c(1),col=c("black","red","green"))
                  points(input$Petal.Length,input$Sepal.Length,pch=8,cex=2)
            })
            output$pwidth <- renderPlot({
                  plot(iris$Petal.Width,iris$Sepal.Width,col=iris$Species)
                  legend("topleft", c("setosa", "versicolor", "virginica"),pch=c(1),col=c("black","red","green"))
                  points(input$Petal.Width,input$Sepal.Width,pch=8,cex=2)
            })
            output$dtree <- renderPlot({
                  fancyRpartPlot(fit$finalModel)
            })
      }
)