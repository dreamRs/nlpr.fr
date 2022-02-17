
list1 <- function (x) {
  if (length(x) == 1) {
    list(x)
  } else {
    x
  }
}

#' @importFrom V8 new_context
v8_context <- function() {
  if (!is.null(.globals$ctx)) {
    return(.globals$ctx)
  } else {
    ctx <- V8::new_context()
    ctx$source(file = system.file("assets/nlp-bundle.js", package = "nlpr.fr"))
    return(ctx)
  }
}
