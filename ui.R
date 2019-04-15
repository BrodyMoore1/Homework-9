library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    numericInput("sl", "Sepal Length",6),
    numericInput("sw", "Sepal Width",3),
    numericInput("pl", "Petal Length",4),
    numericInput("pw", "Petal Width",1)
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
