#' Create a grid with projects cards (for Distill website)
#'
#' @param ... Cards to include with make_project_card
#'
#' @return HTML to create a grid
#' @export
#'

make_grid_project <- function(...) {

  shiny::tags$div(class = "grid-container", ...)

}



#' Create a project card (for Distill website)
#'
#' @param title
#' @param title_link
#' @param description
#' @param button
#' @param button_link
#'
#' @return HTML for a card
#' @export
#'

make_card_project <- function(
  title = NULL,
  title_link = NULL,
  description = NULL,
  button = "See more",
  button_link = NULL
) {

  shiny::withTags(
    div(class = "card",
        div(class = "card-text",
            h4(a(href = title_link, title)),
            div(class = "article-style",
                p(description)
              ),
            a(href = button_link, button)
           )
      )
  )

}
