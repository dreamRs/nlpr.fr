.globals <- new.env(parent = emptyenv())

#' @importFrom V8 new_context
.onLoad <- function(libname, pkgname) {
  .globals$ctx <- v8_context()
}
