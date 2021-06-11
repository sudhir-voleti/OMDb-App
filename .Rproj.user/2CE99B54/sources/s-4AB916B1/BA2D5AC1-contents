inputs_sort <- function(movie_name_ui="Batman",
                        imdb_id_ui = NA,
                        yyyy_ui = NA,
                        plot_ui = TRUE,
                        api_key_ui = '123456'){
  
  
  a00 = "http://www.omdbapi.com/?"  # first parse piece, hardcoded
  
  if (!is.na(movie_name_ui)){ 
    a0 = str_replace_all(movie_name_ui, " ", "+")
    a01 = paste0("s=", a0) 
  } else {
    a01 = paste0("i=", imdb_id_ui)
  }
  
  a02 = NULL
  if (!is.na(yyyy_ui)){ a02 = paste0("&y=", yyyy_ui)}
  if(plot_ui){a02 = paste0("&plot=full")}
  
  a03 = paste0("&apikey=", api_key_ui)
  
  search_string = paste0(a00, a01, a02, a03)
  
  return(search_string) }


omdb_func <- function(search_string){
  
  a = getURL(search_string); a
  x = jsonlite::fromJSON(a)
  x1 = as.data.frame(x)
  x1$Search.Poster <- paste0("<img src=","\'",x1$Search.Poster,"\'","height='200'></img>")
  
  return(x1) # display as HTML table. 
  
} # func ends

