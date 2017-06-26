#' Names and Lyrics of Bob Dylan Songs
#'
#' A dataset containing the names and lyrics of over 600 Bob Dylan songs. Very incomplete.
#'
#' @format A data.frame with 634 rows and 3 variables
#' \describe{
#'   \item{SongId}{Song id number}
#'   \item{Song}{Song name}
#'   \item{Lyrics}{A vector with line by line lyrics for the song}
#'   \item{Stems}{A vector of unique stems found in the song}
#'   \item{StemsByLine}{A list of vectors of stems, one per line of the song}
#'   }
#' @source \url{http://www.bobdylan.com/}
"bd_songs"
