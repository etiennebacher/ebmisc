#' Convert month name to month number
#'
#' @param month_name Month name or vector of month names (partial match authorized)
#'
#' @return An integer
#' @export
#'

month_to_number <- function(month_name) {

  list_conv <- data.frame(
    month_names = c("January", "February", "March", "April", "May",
                    "June", "July", "August", "September", "October",
                    "November", "December"),
    month_number = seq(1, 12, 1)
  )

  indices <- sapply(month_name, function(x) {
    which(grepl(x, list_conv$month_names))
  })

  return(list_conv[indices, 2])

}
