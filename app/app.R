#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(shinydashboard)
library(DT)

ui <- dashboardPage(
  dashboardHeader(title = "Review of RStudio Datasets"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Data Table", tabName = "tables", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(title = "Controls",
                    sliderInput("bins",
                                "Number of bins:",
                                min = 1,
                                max = 50,
                                value = 30),
                    br(),
                    selectInput(inputId = "choices", label = "Cool Dropdown yall:",
                                choices = c("Old Faithful" = "faithful", 
                                            "BJSales" = "bjsales", 
                                            "Cars" = "cars", 
                                            "Iris" = "iris"),
                                selected = "faithful")
                    ),
                box(plotOutput("distPlot"))
              )
      ),
      tabItem(tabName = "tables",
                  dataTableOutput("rawdata")
      )
    )
  )
)

# Define UI for application that draws a histogram
#ui <- fluidPage(

    # Application title
#    titlePanel("Distribution of Various RStudio Datasets"),

    # Sidebar with a slider input for number of bins 
#    sidebarLayout(
#        sidebarPanel(
#            sliderInput("bins",
#                        "Number of bins:",
#                        min = 1,
#                        max = 50,
#                        value = 30),
#            br(),
#            selectInput(inputId = "choices", label = "Cool Dropdown yall:",
#                        choices = c("Old Faithful" = "faithful", 
#                                    "BJSales" = "bjsales", 
#                                    "Cars" = "cars", 
#                                    "Iris" = "iris"),
#                        selected = "faithful")
#        ),

        # Show a plot of the generated distribution
#        mainPanel(
#          tabsetPanel(type = "tabs",
#                 tabPanel("Plot",plotOutput("distPlot")),
#                 tabPanel("Data Table", dataTableOutput("rawdata")),
#                 tabPanel("Dataset Description")
#          )
#        )
#    )
#)

# Define server logic required to draw a histogram
server <- function(input, output) {

  
    x <- reactive({data.frame(rbind(data.frame(value = cars[,2],
                                        group = "cars"),
                             data.frame(value = faithful[,2],
                                        group = "faithful"),
                             data.frame(value = iris[,1],
                                        group = "iris"),
                             data.frame(value = BJsales,
                                        group = "bjsales")
                                      )
                                ) %>%
        filter(group == input$choices)
    })
    
    
    bins <- reactive({seq(min(x()[,1]), max(x()[,1]), length.out = input$bins + 1)})
    
  
    
    output$distPlot <- renderPlot({
        # draw the histogram with the specified number of bins
        hist(x()[,1], breaks = bins(), 
             col = 'darkgray', 
             border = 'white', 
             main = paste("Histogram of", input$choices, "Dataset"),
             xlab = "")
    })
    
    output$rawdata <- renderDataTable({x()})

}

# Run the application 
shinyApp(ui = ui, server = server)


