#' Apply HTML highlighting to designated lines in a song
#'
#' This function is intended to be used exclusively with the BobDylan shiny app that uses this library.
#' It applies HTML hihglighing ('background-color: "#FFFF00') to lines of the song that match a given query.
#'
#' @param song name of a Bob Dylan song
#' @param match_results the return values from the function \code{find_line_natches()}
#' @return a single char string. Each line of the song is separated by </br>. Lines of the song that are indicated
#' @export
#' @family shiny_functions
#' as matches have the background color set to 'FFFF00'

highlight_matches <- function(song_name, match_results) {
  song <- bd_songs %>% filter(Song == song_name) %>% pull(Lyrics) %>% unlist(recursive = FALSE)
  rows_to_highlight <- which(match_results > 0)
  rows <- map_at(song, rows_to_highlight, function(x)
    paste("<span stlye = 'background-color: #FFFF00'>", x, "</span>"))
  text <- paste(rows, collapse = "</br>")
  return(text)
}
