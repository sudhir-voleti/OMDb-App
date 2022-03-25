library(dplyr)

# Install / Load relevant packages
library("shiny")
library("httr")
library("RCurl")
library("jsonlite")
library("stringr")
library("imager")
library("DT")

shinyUI(fluidPage(
  
  title = "OMDb App",
  titlePanel(title=div(img(src="logo.png",align='right'),"OMDb App")),
  sidebarPanel(
    conditionalPanel(condition = "input.tabselected==1",
                     passwordInput("api_key","Enter API key"),
                     textInput("movie_name","Enter Movie Name",value = "Batman"),
                     #p("OR"),
                     #textInput("imdb_id","Enter IMDB id",value = NA),
                     #numericInput("year","Enter Year (yyyy)",min = 1900, max=2021,value = NA),
                     #checkboxInput("full_plot",label = "Show full plot",value = FALSE),
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
               #includeMarkdown("overview.md"),
               h3('Overview'),

              h3('OMDb (The Open Movie Database}'),

p('The OMDb API is a RESTful web service to obtain movie information, 
all content and images on the site are contributed and maintained by the users.'),
      
h3('How to use this App'),
p('- Go to [OMDb API sign-up](http://www.omdbapi.com/apikey.aspx) page',br(), 
'- Submit your details and you will get the API key in sometime',br(),
'- Once you have the API key, submit it from sidebar panel',br(),
'- Enter either movie name or IMDb id to fetch the dataset'),


p('Disclaimer: we are not storing any API key in background. Once the app is close you have to re-enter it next time.')


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

