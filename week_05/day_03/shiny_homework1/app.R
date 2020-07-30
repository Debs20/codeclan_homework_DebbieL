library(shiny)
library(tidyverse)
library(CodeClanData)
library(shinythemes)



all_teams <- unique(olympics_overall_medals)



# UI Section
ui <- fluidPage(
    
    theme = shinytheme("darkly"),
    
    titlePanel(tags$i("Olympic Medals")),  
    
    navlistPanel(
        "Header A",
        tabPanel("Plot",
                 plotOutput("medal_plot")
                 # tags$a("Link to the Olympics website", href = "https:://.....")- This will create a link, so there is a link to a website if you want it  
                 
                 
        ),
        
        tabPanel("Which season?",
                 radioButtons("season",
                              tags$i("Summer or Winter Olympics?"),
                              choices = c("Summer", "Winter")
                 )
        ),
        
        tabPanel("Which team", 
                 selectInput("team",
                             "Which Team?",
                             choices = all_teams
                 )
        ),
        
        tabPanel("Link to website",
                 tags$a("The Olympics website", href = "https://www.Olympic.org/"))
    
    )
)
    

# Server section
server <- function(input, output) {
    
    output$medal_plot <- renderPlot({
        olympics_overall_medals %>%
            filter(team == input$team) %>%
            filter(season == input$season) %>%
            ggplot() +
            aes(x = medal, y = count, fill = medal) +
            geom_col() +
            scale_fill_brewer(palette = "Pastel1") +
            theme_classic() +
            theme(title = element_text(size = 18, face = "bold", colour = "blue"))
    })        
}

# Run the app
shinyApp(ui = ui, server = server)

