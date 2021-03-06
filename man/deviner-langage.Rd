% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deviner_langue.R
\name{deviner-langage}
\alias{deviner-langage}
\alias{deviner_langue}
\alias{deviner_langues}
\title{Deviner la langue}
\usage{
deviner_langue(texte)

deviner_langues(texte, retour = c("langue", "alpha2", "alpha3"))
}
\arguments{
\item{texte}{Pour :
\itemize{
\item \code{deviner_langue} : une chaîne de caractère de \strong{longueur 1}.
\item \code{deviner_langues} : une chaîne de caractère.
}}

\item{retour}{Valeur à retourner en sortie : \code{"langue"} ("French"), \code{"alpha2"} ("fr") ou \code{"alpha3"} ("fra")}
}
\value{
\itemize{
\item \code{deviner_langue} : un \code{data.frame} de toutes les langues classées par ordre décroissant de leur score.
\item \code{deviner_langues} : un vecteur \code{character} avec le meilleur résultat.
}
}
\description{
Deviner la langue utilisée dans un texte.
}
\examples{

deviner_langue("Bonjour, une baguette pas trop cuite, s'il vous plaît !")

deviner_langues(c("Hello world!", "Salut la compagnie !"))
deviner_langues(c("Hello world!", "Salut la compagnie !"), retour = "alpha2")
}
