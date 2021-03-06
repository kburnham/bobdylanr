% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lyric_functions.R
\name{get_stem_match}
\alias{get_stem_match}
\title{Find the vector of songs containing the given stem}
\usage{
get_stem_match(stem)
}
\arguments{
\item{stem}{a stemmed word}
}
\value{
a vector of song names that include stem
}
\description{
Uses the internal stem_dict which matches all stems found in all Bob Dylan songs to a vector of
songs that include them.
}
\seealso{
Other lyric_functions: \code{\link{find_bd_lyrics}},
  \code{\link{find_line_matches}},
  \code{\link{find_stems}}, \code{\link{get_word_stems}},
  \code{\link{match_all_stems}}
}
