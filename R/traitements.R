
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



#' Stemmatiser des mots
#'
#' @param mots Un vecteur de mots.
#'
#' @return Un vecteur de mots stemmatisés.
#' @export
#'
#' @examples
#' stemmatiser(c("les", "chats", "ont", "faim"))
stemmatiser <- function(mots) {
  if (is.list(mots)) {
    return(lapply(mots, stemmatiser))
  }
  stopifnot("stemmatiser: \'mots\' doit \u00eatre une cha\u00eene de caract\u00e8re" = is.character(mots))
  ctx <- v8_context()
  ctx$call(fun = "rutils.stem", list1(mots))
}



#' @title Traiter du texte
#'
#' @description Permet de [normaliser()], [tokeniser()] et [stemmatiser()] du texte.
#'
#' @param texte Une chaîne de caractère(s).
#' @param enlever_stopwords Enlever ou pas les mots stop.
#'
#' @return Une liste contenant les mots normalisés, tokenisés et stemmatisés.
#' @export
#'
#' @examples
#' traiter_texte(c("Les chats ont faim.", "Qui a laissé sortir les chiens ?"))
traiter_texte <- function(texte, enlever_stopwords = TRUE) {
  stopifnot("traiter_texte: \'texte\' doit \u00eatre une cha\u00eene de caract\u00e8re" = is.character(texte))
  ctx <- v8_context()
  ctx$assign("text", list1(texte))
  ctx$assign("stopwords", !enlever_stopwords)
  ctx$eval("result = rutils.tokenizeAndStem(text, stopwords);")
  lapply(ctx$get("result", simplifyVector = FALSE), unlist)
}

