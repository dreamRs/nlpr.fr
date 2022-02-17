
#' @title Deviner la langue
#'
#' @description Devenier la langue utilisé dans un texte.
#'
#' @param texte Une chaîne de caractère(s).
#'
#' @return Un `data.frame` de toutes les langues classées par ordre décroissant de leur score.
#' @export
#'
#' @importFrom V8 v8
#'
#' @examples
#' deviner_langue("Bonjour, une baguette pas trop cuite, s'il vous plaît !")
deviner_langue <- function(texte) {
  ctx <- v8()
  ctx$source(
    file = system.file("assets/nlp-bundle.js", package = "nlpr.fr")
  )
  ctx$assign("text", texte)
  ctx$eval("result = rutils.guess(text);")
  ctx$get("result")
}
