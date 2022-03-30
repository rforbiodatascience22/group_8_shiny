#' centraldogma UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_centraldogma_ui <- function(id){
  ns <- NS(id)
  tagList(

  )
}

#' centraldogma Server Functions
#'
#' @noRd
mod_centraldogma_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_centraldogma_ui("centraldogma_1")

## To be copied in the server
# mod_centraldogma_server("centraldogma_1")

if(FALSE){ # Testing
  golem::detach_all_attached
  golem::document_and_reload
  ui <- mod_centraldogma_ui("mod_centraldogma_ui") # replace name here
  server <- function( input,output,session){
    mod_centraldogma_server("mod_centraldogma_server") # and here
  }
  shinyApp(ui, server)
}
