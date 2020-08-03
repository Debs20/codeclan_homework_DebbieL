
library(shiny)
library(ggplot2)
library(CodeClanData)
library(shinythemes)
library(DT)
library(dplyr)


ui <- fluidPage(
    
    theme = shinytheme("superhero"),
    
    titlePanel(tags$h1("Game Sales")),
    
    column(4,
        selectInput("year", 
                    "what year was it released?", 
                    choices = unique(game_sales$year_of_release))
        ), 
    
    
    column(4, 
           selectInput("genre",
                       "which genre?",
                       choices = unique(game_sales$genre))
         ),
    
    column(4, 
           selectInput("platform",
                       "Which platform is the game for?",
                       choices = unique(game_sales$platform))
        ),
    
    mainPanel(
    
    DT::dataTableOutput("table_output"), 
    
    plotOutput("sales_plot"),
    
    plotOutput("platform_plot")
        
    )
 )


server <- function(input, output) {
    
    output$table_output <- DT::renderDataTable({
    
    game_sales %>%
        filter(year == input$year_of_release)%>%
        filter(genre == input$genre) %>%
        filter(platform == inpu$platform) %>%
        sort() 
})
    
    output$sales_plot <- renderPlot({
        
    game_sales %>%
        filter(year == input$year_of_release) %>%
        filter(genre == input$genre) %>%
        filter(platform == inpu$platform)  
 
    ggplot(game_sales) +
        aes(x = year_of_release, y = sales, colour = genre) +
        geom_point()
    
})
    
## This plot was chosed to show how the genre of games have done based on the year
#   they were realeased
    
    output$platform_plot <- renderPlot({
        
    game_sales %>%
        filter(year == input$year_of_release) %>%
        filter(genre == input$genre) %>%
        filter(platform == inpu$platform)
    
    ggplot(game_sales) +
        aes(x = platform, y = critic_score, fill = user_score) +
        geom_col() +
        scale_fill_distiller(palette = "Accent")
})    
## This plot was chosen to show the games that are on the platforms and that the critic
#   score as this is usually what gamers like to use to gauge how good a game is for buying
    
}
    
shinyApp(ui = ui, server = server) 