library(shiny)
library(ggplot2)
library(dplyr)

ui <- fluidPage(

    titlePanel("Data Wrangling Test"),

    sidebarLayout(
        sidebarPanel(
            
            selectInput(inputId="color",
                        label="Einfaerbung nach",
                         choices=list("Cylinders" = "cyl",
                           "Antriebsart" = "drv",
                           "Gruppe" = "class",
                           "Hersteller" = "manufacturer"),
                        selected = NULL,
                        multiple = FALSE
                        ),
            
            checkboxInput(inputId="oneSmooth",
                          "Eine Glaettung fuer alle?",
                          TRUE)
        ),
        
        mainPanel(
            
            h3(textOutput("caption")),
            
            plotOutput("distPlot")
            
        )
    )
)

server <- function(input, output) {

    formulaText <- reactive({
        paste0("color=", input$color)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$distPlot <- renderPlot({

        if (input$oneSmooth == TRUE){
            distPlot <- ggplot(data = mpg) + 
                geom_point(mapping = aes(x = displ, y = hwy, color = as.factor(.data[[input$color]]))) + 
                geom_smooth(mapping = aes(x = displ, y = hwy))
        }
        else {
            distPlot <- ggplot(data = mpg, aes(color = as.factor(.data[[input$color]]))) + 
                geom_point(mapping = aes(x = displ, y = hwy)) + 
                geom_smooth(mapping = aes(x = displ, y = hwy))
        }
        
        distPlot + 
            labs(x = "displ",
                 y = "hwy",
                 colour = input$color
                 #shape = "Transmission"
                )
    })
}

shinyApp(ui = ui, server = server)
