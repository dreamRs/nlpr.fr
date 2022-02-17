
#' Normaliser un texte
#'
#' @param texte Une chaîne de caractère(s).
#'
#' @return Une chaîne de caractère(s) normalisée.
#' @export
#'
#' @examples
#' normaliser("Bonjour, comment allez-vous ?")
#' normaliser(c("Bonjour, comment allez-vous ?", "Salut ! Yes impeccable"))
normaliser <- function(texte) {
  stopifnot("normaliser: \'texte\' doit \u00eatre une cha\u00eene de caract\u00e8re" = is.character(texte))
  ctx <- v8_context()
  ctx$call(fun = "rutils.normalize", list1(texte))
}


#' Tokeniser un texte
#'
#' @param texte Une chaîne de caractère(s).
#' @param normaliser Normaliser le texte, voir [normaliser()].
#'
#' @return Une liste de tokens.
#' @export
#'
#' @examples
#' tokeniser(c("Bonjour, comment allez-vous ?", "Salut ! Yes impeccable"))
tokeniser <- function(texte, normaliser = TRUE) {
  stopifnot("tokeniser: \'texte\' doit \u00eatre une cha\u00eene de caract\u00e8re" = is.character(texte))
  ctx <- v8_context()
  ctx$assign("text", list1(texte))
  ctx$assign("normalize", normaliser)
  ctx$eval("result = rutils.tokenize(text, normalize);")
  lapply(ctx$get("result", simplifyVector = FALSE), unlist)
}
