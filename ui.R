
library(shiny)
shinyUI (
      pageWithSidebar (
            # Application title
            headerPanel ("Species of plant prediction"),
            sidebarPanel (
                  p("This application first sets a decision tree model to predict the species of a 
                    given plant based on the iris dataset (please wait a few seconds). Then, checking the values introduced by 
                    the user, shows the result of the prediction, two plots with the Petal/Sepal
                    Length and Width, and finally plots the decision tree."),
                  numericInput('Petal.Length', 'Petal.Length', 4, min = 1, max= 8, step = 0.5),
                  numericInput('Sepal.Length', 'Sepal.Length', 5, min = 4, max= 9, step = 0.5),
                  numericInput('Petal.Width', 'Petal.Width', 1, min = 0.5, max= 3, step = 0.5),
                  numericInput('Sepal.Width', 'Sepal.Width', 3, min = 1, max= 6, step = 0.5)
                  #submitButton('Submit')
            ),
            mainPanel (
                  h3 ('Species predicted'),
                  textOutput("prediction"),
                  h3 ('Petal Length vs Sepal Length'),
                  plotOutput('plength', width = "90%", height = "250px"),
                  h3 ('Petal Width vs Sepal Width'),
                  plotOutput('pwidth', width = "90%", height = "250px"),
                  h3 ('Decision Tree'),
                  plotOutput('dtree', width = "90%", height = "300px")
            )
      )
)