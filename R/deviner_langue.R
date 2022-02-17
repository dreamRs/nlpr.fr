
#' @title Deviner la langue
#'
#' @description Deviner la langue utilisée dans un texte.
#'
#' @param texte Pour :
#' * `deviner_langue` : une chaîne de caractère de **longueur 1**.
#' * `deviner_langues` : une chaîne de caractère.
#'
#' @return
#' * `deviner_langue` : un `data.frame` de toutes les langues classées par ordre décroissant de leur score.
#' * `deviner_langues` : un vecteur `character` avec le meilleur résultat.
#' @export
#'
#' @name deviner-langage
#'
#' @importFrom V8 v8
#'
#' @examples
#'
#' deviner_langue("Bonjour, une baguette pas trop cuite, s'il vous plaît !")
#'
#' deviner_langues(c("Hello world!", "Salut la compagnie !"))
#' deviner_langues(c("Hello world!", "Salut la compagnie !"), retour = "alpha2")
deviner_langue <- function(texte) {
  stopifnot("deviner_langue: 'texte' doit être de longueur 1" = is.character(texte) & length(texte) == 1L)
  ctx <- v8()
  ctx$source(
    file = system.file("assets/nlp-bundle.js", package = "nlpr.fr")
  )
  ctx$assign("text", texte)
  ctx$eval("result = rutils.guess(text);")
  ctx$get("result")
}

#' @param retour Valeur à retourner en sortie : `"langue"` ("French"), `"alpha2"` ("fr") ou `"alpha3"` ("fra")
#' @export
#'
#' @rdname deviner-langage
deviner_langues <- function(texte, retour = c("langue", "alpha2", "alpha3")) {
  retour <- match.arg(retour)
  if (retour == "langue")
    retour <- "language"
  stopifnot("deviner_langues: 'texte' doit être une chaîne de caractère" = is.character(texte))
  if (length(texte) < 1)
    return(character(0))
  ctx <- v8()
  ctx$source(
    file = system.file("assets/nlp-bundle.js", package = "nlpr.fr")
  )
  ctx$assign("text", list1(texte))
  ctx$assign("value", retour)
  ctx$eval("result = rutils.guessMap(text, value);")
  ctx$get("result")
}

