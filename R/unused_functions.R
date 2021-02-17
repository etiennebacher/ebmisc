#' Find unused functions
#'
#' @return Names of unused functions
#' @export
#'

unused_functions <- function() {

  if (is_package()) {

    # Get all function names
    x <- foreman::unpack(path = "R", warn = FALSE)
    function_names <- purrr::flatten_chr(lapply(x, names))

    # List functions that are called somewhere else
    is_called <- lapply(function_names, function(y) {
      called_by <- foreman::relationship(x, child = y)
      called_by <- called_by[-(length(called_by)+1)]
      if (length(called_by) == 0) {
        return(FALSE)
      } else {
        return(TRUE)
      }
    })

    # Get functions that are not called
    functions_not_called <- function_names[which(is_called == FALSE)]

    return(functions_not_called)

  }

}
