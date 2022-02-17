
#' Analyse de sentiment
#'
#' @param texte Texte(s) sur lequel effectuer l'analyse de sentiment.
#' @param inclure_tokens Inclure les tokens extrait de `texte` dans la sortie.
#'
#' @return A `data.frame` with sentiment measure.
#' @export
#'
#' @name analyser-sentiment
#'
#' @examples
#' analyser_sentiment("J'aime beaucoup la choucroute !")
analyser_sentiment <- function(texte, inclure_tokens = FALSE) {
  stopifnot("analyser_sentiment: \'texte\' doit \u00eatre de longueur 1" = is.character(texte) & length(texte) == 1L)
  ctx <- v8_context()
  result <- ctx$call("rutils.analyzeSentiment", texte, await = TRUE)
  output <- as.data.frame(result$sentiment)
  if (isTRUE(inclure_tokens))
    output$tokens <- list(result$tokens)
  return(output)
}

#' @param retour Valeur de sortie : `"tout"` (un `data.frame` avec une ligne par `texte`),
#'  `"score"` (score obtenu par texte), `"vote"` (positive ou negative).
#' @export
#'
#' @rdname analyser-sentiment
analyser_sentiments <- function(texte, retour = c("tout", "score", "vote")) {
  retour <- match.arg(retour)
  if (retour == "tout")
    retour <- "all"
  stopifnot("analyser_sentiments: \'texte\' doit \u00eatre une cha\u00eene de caract\u00e8re" = is.character(texte))
  ctx <- v8_context()
  ctx$call(fun = "rutils.analyzeSentimentMap", list1(texte), retour, await = TRUE)
}




