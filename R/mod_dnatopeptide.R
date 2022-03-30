#' dnatopeptide UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dnatopeptide_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, uiOutput(ns("DNA"))),
      column(4, numericInput(
        inputId = ns("dna_length"),
        value = 6000,
        min = 3,
        max = 100000,
        step = 3,
        label = "Random DNA length"
      ),
      actionButton(
        inputId = ns("generate_dna"),
        label = "Generate random DNA", style = "margin-top: 18px;"
      ), "generate_dna_button")
    ),
    verbatimTextOutput(outputId = ns("peptide")) %>%
      tagAppendAttributes(style = "white-space: pre-wrap;")
  )
}

#' dnatopeptide Server Functions
#'
#' @noRd
mod_dnatopeptide_server <- function(id){
  moduleServer( id, function(input, output, session){
    dna <- reactiveVal()
    output$DNA <- renderUI({
      textAreaInput(
        inputId = ns("DNA"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )
    })
    observeEvent(input$generate_dna, {
      dna(
        Group8::clean_dna(input$dna_length)
      )
    })
    ns <- session$ns
    output$peptide <- renderText({
      if(is.null(input$DNA)){
        NULL
      } else if(nchar(input$DNA) < 3){
        NULL
      } else{
        input$DNA %>%
          toupper() %>%
          Group8::tforu() %>%
          Group8::finds_codons() %>%
          Group8::prot_synthesis()
      }
    })
  })
}

## To be copied in the UI
# mod_dnatopeptide_ui("dnatopeptide_1")

## To be copied in the server
# mod_dnatopeptide_server("dnatopeptide_1")
