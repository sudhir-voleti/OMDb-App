library(dplyr)

# Install / Load relevant packages
if(!"pacman" %in% installed.packages()[,"Package"]) install.packages("pacman")
pacman::p_load(shiny,httr, RCurl, jsonlite, stringr,imager,markdown,DT,dplyr)
#pacman::p_load(DT)



shinyUI(fluidPage(
  
  title = "OMDb App",
  titlePanel(title=div(img(src="logo.png",align='right'),"OMDb App")),
  sidebarPanel(
    conditionalPanel(condition = "input.tabselected==1",
                     passwordInput("api_key","Enter API key"),
                     textInput("movie_name","Enter Movie Name",value = "Batman"),
                     p("OR"),
                     textInput("imdb_id","Enter IMDB id",value = NA),
                     numericInput("year","Enter Year (yyyy)",min = 1900, max=2021,value = NA),
                     checkboxInput("full_plot",label = "Show full plot",value = FALSE),
                     actionButton("ser_omdb","Search Omdb")
    ),
    conditionalPanel(condition="input.tabselected==3",
                    
    ),
    
    
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Overview", value=1, 
               includeMarkdown("overview.md"),
               # https://www.youtube.com/watch?v=NltUIbf5B_E
               HTML('<iframe width="560" height="315" src="https://www.youtube.com/watch?v=NltUIbf5B_E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')

      ),
      tabPanel("Result Table", value=1,
              h5("Search String"),
              verbatimTextOutput("s_string"),
              h5("Fetched Data"),
              DT::dataTableOutput("x1")
         
      ),
     
      id = "tabselected"
    )
  )
))

