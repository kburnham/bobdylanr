% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shiny_functions.R
\name{highlight_matches}
\alias{highlight_matches}
\title{Apply HTML highlighting to designated lines in a song}
\usage{
highlight_matches(song_name, match_results)
}
\arguments{
\item{match_results}{the return values from the function \code{find_line_natches()}}

\item{song}{name of a Bob Dylan song}
}
\value{
a single char string. Each line of the song is separated by </br>. Lines of the song that are indicated
}
\description{
This function is intended to be used exclusively with the BobDylan shiny app that uses this library.
It applies HTML hihglighing ('background-color: "#FFFF00') to lines of the song that match a given query.
}
