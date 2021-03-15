#' Convert month name to month number
#'
#' @param month_name Month name (partial match authorized)
#'
#' @return An integer
#' @export
#'

month_to_number <- function(month_name) {

  if (!is.character(month_name))
    stop("month_name must be the name of a month")

  list_conv <- data.frame(
    month_names = c("January", "February", "March", "April", "May",
                    "June", "July", "August", "September", "October",
                    "November", "December"),
    month_number = seq(1, 12, 1)
  )

  return(
    list_conv[
      which(grepl(month_name, list_conv$month_names)),
      2
    ]
  )

}
