#' Convert a sentence, or list of sentences, into a bag of unique stems
#'
#' For a provided text, this function will:
#'  - convert the sentence to a vector of words
#'  - convert each word to lower case
#'  - replace ’ with '
#'  - remove all punctuation other that '
#'  - replace -in' with -ing
#'  - remove snowball stop words (using tidy_text stopwords)
#'  - stem the words with SnowballC::wordStem
#'  - convert to a unique vector
#'
#' @param sentence a space separated string of words, or a list of the same
#' @export
#' @family lyric_functions
#' @return a vector of unique stems found in sentence

library(tidytext)

get_word_stems <- function(sentence) {
  if (class(sentence) == "list") sentence <- sentence %>% unlist() %>% paste(collapse = " ")
  words <- tolower(unlist(str_split(sentence, pattern = " ", simplify = FALSE)))
  words <- unlist(str_split(words, "-"))
  # convert curly apostrophe to straight one so that  stop_words can recognize it
  words <- str_replace(words, "’", "'")
  # remove punctuation except the '
  words <- str_replace(words, "[^[:alnum:][:space:]']", "")
  # some hard_coded replacements
  words <- str_replace(words, "^I'd$", "I")
  words <- str_replace(words, "^An'^", "And")
  # the stemmer is confused by -in', so we replace with -ing
  words <- str_replace(words, "in'$", "ing")

  # clean up
  words <- words[words != ""]

  words <- words[!words %in% (tidytext::stop_words %>% filter(lexicon == "snowball") %>% pull(word))]
  stems <- wordStem(words) %>% unique()
  return(stems)
}

## there is a lot of other text processing that needs to occur
# - remove punctuation , . ? \" ! ”’ “ ‘ some words (esp names) seem to end with '
# - remove the a- at the beginning of some words
#- split words by - so that murder_mind becomes "murder" "mind"
# - check out words like ""worr'in’" - can they be converted to something reliably?
#         'til ev'ryth" should-a o-er it'd 'lectric ev'rybodi An’ (= And)
# what's with "3.\ti, 4.\ti etc


#' Find which stems in a given source text can be found in a given target text
#'
#' @export
#' @family lyric_functions

find_stems <- function(stems_to_search, stems_to_search_in) {
  return(stems_to_search[stems_to_search %in% stems_to_search_in])

}

#' Search for Bob Dylan Songs containing a given lyrical snippet
#'
#' @param lyrics a string of lyrics to search for
#'
#' @export
#' @family lyric_functions
#' @return a subset of bd_songs containing songs with at least one match with lyrics
#'


find_bd_lyrics <- function(lyrics) {
  search <- get_word_stems(lyrics)
  bd_songs$result <- unlist(map(bd_songs$Stems,
                                function(x) length(find_stems(get_word_stems(lyrics), x))))
  bd_songs %>% filter(result > 0) %>% arrange(desc(result)) %>% select(SongId, Song, Lyrics)
}


#' Given a lyric snippet and a song name, return vector of matches by line
#'
#' @param song String name of a song in bd_songs$Song
#' @param lyrics String of lyrics to search
#' @param return_values if TRUE return list of stem matches, otherwise return a vector of counts of matches
#' @export
#' @family lyric_functions
#' @return a vector of match counts or a list of matching stems
#'

find_line_matches <- function(song, lyrics, return_values = FALSE) {
  lines <- unlist(bd_songs %>% filter(Song == song) %>% pull(StemsByLine), recursive = FALSE)
  lyric_stems <- get_word_stems(lyrics)
  matches <- map(lines, function(x) {
    find_stems(lyric_stems, x)
  })
  if (!return_values) matches = map_int(matches, length)
  return(matches)
}



