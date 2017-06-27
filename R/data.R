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


#' Names, year of publication, song, and song position for each Bob Dylan Album
#'
#' @format A data.frame with 1064 rows and 4 columns
#' \describe{
#'   \item{Albums}{Album name}
#'   \item{Year}{Year of publication}
#'   \item{Song}{Name of Song}
#'   \item{Position}{Ordinal position of song on album}
#'   }
#'  @source \url{http://www.bobdylan.com/}
"bd_albums"


#' Information about time, place and set list for Bob Dylan Concerts
#'
#' @format A data.frame with 54542 rows and 7 columns
#' \describe{
#'   \item{Date}{Date of concert}
#'   \item{Venue}{Name of venue}
#'   \item{City}{City location of venue}
#'   \item{State/Country}{The state (in in the USA) or country where venue is located}
#'   \item{Songs}{The name of a song played at the concert}
#'   \item{Position}{The ordinal position of the song in the set list}
#'   \item{OriginalLocation}{The unseparated City/State(Country) from the raw data}
#'   }
#' @source \url{http://www.bobdylan.com/}
"bd_concerts"

