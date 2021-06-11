shinyServer(function(input, output,session) {
  
  
s_string <- reactive({
  ss <- inputs_sort(movie_name_ui = input$movie_name,
              imdb_id_ui = input$imdb_id,
              yyyy_ui = input$year,
              plot_ui = input$full_plot,
              api_key_ui = input$api_key
                )
  ss
})

output$s_string <- renderPrint({
  s_string()
})

e1 <- eventReactive(input$ser_omdb,{
 # output$x1 <- DT::renderDataTable({
    x1 = omdb_func(s_string())
    x1
  #  DT::datatable(x1, escape = FALSE)
 # })
})

output$x1 <- DT::renderDataTable({
 DT::datatable(e1(), escape = FALSE)
})

})