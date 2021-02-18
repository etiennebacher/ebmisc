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

  x <- shiny::withTags(
    div(class = "card",
        div(class = "card-text",
            h4(a(target="_blank")),
            div(class = "article-style",
                p(description)
              ),
            a(target="_blank")
           )
      )
  )

  # Can't add directly in a()

  x$children[[1]]$children[[1]]$children[[1]]$attribs[["href"]] <- title_link
  x$children[[1]]$children[[1]]$children[[1]]$children <- title

  x$children[[1]]$children[[3]]$attribs[["href"]] <- button_link
  x$children[[1]]$children[[3]]$children <- button

  return(x)
}
