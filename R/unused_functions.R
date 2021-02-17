#' Find unused functions
#'
#' @param files List of files in which to search. If NULL, all .R files are searched in.
#'
#' @return Names of unused functions
#' @export
#'
#' @examples
#' \dontrun{
#' unused_functions(files = c("some_file.R", "folder/another_file.R"))
#' }

unused_functions <- function(files = NULL) {

  # Get all function names
  if (is_package()) {
    x <- foreman::unpack(path = "R", warn = FALSE)
  } else {
    if (is.null(files)) {
      files <- list.files(pattern = ".R$", recursive = TRUE)
    } else {
      files <- files
    }

    x <- foreman::unpack(path = "R", warn = FALSE)
  }
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
