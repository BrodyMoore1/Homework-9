library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    numericInput("sl", "Sepal Length",1),
    numericInput("sw", "Sepal Width",2),
    numericInput("pl", "Petal Length",3),
    numericInput("pw", "Petal Width",4)
  ),
  dashboardBody(
    fluidRow(
    box(DT::dataTableOutput("predictions"))
    ),
    fluidRow(
      tabPanel('Plot', plotOutput('scatter'))
    ),
    fluidRow(
      tabPanel("Plot", plotOutput("den1"))
    ),
    fluidRow(
      tabPanel("Plot", plotOutput("den2"))
    ),
    fluidRow(
      tabPanel("Plot", plotOutput("den3"))
    ),
    fluidRow(
      tabPanel("Plot", plotOutput("den4"))
    )
  )
)
