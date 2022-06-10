
library(shiny)
library(tidyverse)
library(plotly)
library(ggplot2)

co2_df<- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# Define UI for application that draws a select input and slider input
ui <- fluidPage(
 h1("Global co2 Emmissions Throughout The Years "),
 h5("I chose a Bar graph because I think it does a really good job at visually representing the distribution of the global co2 emissions throughout the years to allow us to compare those two sets of data at a glance and show the relationships between the axes. As we can see there is a  gradual increase of Co2 emmissions as the years go on overall, showing a positive correlation.", align = "center"),
 sidebarLayout(
  sidebarPanel(
     selectInput(
      inputId = "Color", 
       label = "Choose color", 
       choices = c("Red", "Blue", "Green")
     ), 
     sliderInput(
       inputId = "Year",
       label = "Select Year",
       min =1800,
       max =2022,
       value =1910,
         
     )
),

mainPanel(
  plotOutput(outputId = "Distplot"),
  ),
 
     ),

)

# Define server logic required to draw a Bar graph
server <- function(input, output) {
  
  output$Distplot <- renderPlot({
    
    ggplot(co2_df, aes (x= year, y= co2))+
      geom_bar(fill=input$Color, stat="identity")
    
# Filter data to make sure the slider input extracts the years on the graph
    #filter_df<-filter(co2_df, year == input$Year)
  
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
