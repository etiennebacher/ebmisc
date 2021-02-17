#' Detect if we are in a package environment
#'
#' @return Boolean
#' @export
#'

is_package <- function() {

  if (file.exists("DESCRIPTION")) {

    x <- paste(readLines("DESCRIPTION"), collapse = " ")
    first_cond <- grepl("Type: Package", x)
    second_cond <- grepl("Package:", x)

    if (first_cond || second_cond) {
      is_package <- TRUE
    } else {
      is_package <- FALSE
    }

  } else {
    is_package <- FALSE
  }

  return(is_package)
}
