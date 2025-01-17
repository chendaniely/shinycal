#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    navbarPage(
      title = "shinycal",
      tabPanel(
        title = "Calendar",
        value = "calendar",
        h1("The Data Science StreamRs Calendar!"),
        shiny::includeMarkdown(app_sys("app", "www", "intro.md")),
        mod_cal_viewer_ui("cal_viewer_ui_1")
      ),
      tabPanel(
        title = "Entry",
        value = "entry",
        h1("The module goes here!"),
        mod_cal_entry_ui("cal_entry_ui_1")
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'shinycal'
    ),
    tags$script(src="https://player.twitch.tv/js/embed/v1.js")
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

