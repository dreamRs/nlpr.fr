
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nlpr.fr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/dreamRs/nlpr.fr/workflows/R-CMD-check/badge.svg)](https://github.com/dreamRs/nlpr.fr/actions)
<!-- badges: end -->

Quelques fonctionnalités de
[NLP.js](https://github.com/axa-group/nlp.js) intégrées en R pour
traiter et analyser du texte en français :fr:.

## Installation

Vous pouvez installer la version de développement de nlpr.fr depuis
[GitHub](https://github.com/dreamRs/nlpr.fr) avec:

``` r
# install.packages("devtools")
devtools::install_github("dreamRs/nlpr.fr")
```

## Exemples

### Langue utilisée

Deviner la langue utilisée dans un texte :

``` r
deviner_langue(
  "Dans la plaine rase, sous la nuit sans étoiles,
  d'une obscurité et d'une épaisseur d'encre,
  un homme suivait seul la grande route de Marchiennes à Montsou, 
  dix kilomètres de pavé coupant tout droit, à travers les champs de betteraves."
) |> head()
#>   alpha3 alpha2          language     score
#> 1    fra     fr            French 1.0000000
#> 2    hat     ht           Haitian 0.7361526
#> 3    cat     ca           Catalan 0.7334615
#> 4    nob     nb Bokmål, Norwegian 0.7228153
#> 5    dan     da            Danish 0.7158953
#> 6    spa     es           Spanish 0.7147124
```

Sur un vecteur de plusieurs textes :

``` r
deviner_langues(c(
  "Who let the dogs out? Well, the party was nice, the party was pumpin'.",
  "Faut qu'j'quitte la France, elle a fait la petite frange (ouh). C'est la kiffance, c'est la kiffance"
))
#> [1] "English" "French"
```

### Analyse de sentiments

Analyser les sentiments d’un texte :

``` r
analyser_sentiment(
  "Il pleure dans mon coeur
  Comme il pleut sur la ville ;
  Quelle est cette langueur
  Qui pénètre mon coeur ?
  
  Ô bruit doux de la pluie
  Par terre et sur les toits !
  Pour un coeur qui s’ennuie,
  Ô le chant de la pluie !
  
  Il pleure sans raison
  Dans ce coeur qui s’écoeure.
  Quoi ! nulle trahison ?…
  Ce deuil est sans raison.
  
  C’est bien la pire peine
  De ne savoir pourquoi
  Sans amour et sans haine
  Mon coeur a tant de peine !"
)
#>   score numWords numHits     average    type locale     vote
#> 1  0.45       83      17 0.005421687 pattern     fr positive
```

### Traitement de textes

Normaliser, tokeniser et stemmatiser du texte :

``` r
traiter_texte(c(
  "Avance sur ta route car elle n'existe que par ta marche.", 
  "Par la joie, la beauté du monde pénètre notre âme."
), enlever_stopwords = TRUE)
#> [[1]]
#> [1] "avanc" "rout"  "car"   "exist" "march"
#> 
#> [[2]]
#> [1] "joi"    "beaut"  "mond"   "pénetr" "âme"
```

Ou, étape par étape :

``` r
x <- c(
  "Avance sur ta route car elle n'existe que par ta marche.", 
  "Par la joie, la beauté du monde pénètre notre âme."
)
(x <- normaliser(x))
#> [1] "avance sur ta route car elle n'existe que par ta marche."
#> [2] "par la joie, la beauté du monde pénètre notre âme."
(x <- tokeniser(x))
#> [[1]]
#>  [1] "avance" "sur"    "ta"     "route"  "car"    "elle"   "n"      "existe"
#>  [9] "que"    "par"    "ta"     "marche"
#> 
#> [[2]]
#>  [1] "par"     "la"      "joie"    "la"      "beauté"  "du"      "monde"  
#>  [8] "pénètre" "notre"   "âme"
(x <- stemmatiser(x))
#> [[1]]
#>  [1] "avanc" "sur"   "ta"    "rout"  "car"   "elle"  "n"     "exist" "que"  
#> [10] "par"   "ta"    "march"
#> 
#> [[2]]
#>  [1] "par"    "la"     "joi"    "la"     "beaut"  "du"     "mond"   "pénetr"
#>  [9] "notr"   "âme"
```
