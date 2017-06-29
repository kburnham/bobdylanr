

## create a list where the names are stems in the entire lyric data base and
## the values are a vector of song names that contain that stem

## create a master set of stems

all_stems <- bd_songs %>% pull(Stems) %>% unlist(recursive = FALSE)


stem_dict <- list()
for (i in seq(nrow(bd_songs))) {
  song_name <- bd_songs$Song[i]
  stems <- bd_songs$Stems[i] %>% unlist()
  for (stem in stems) {
    if (is.null(stem_dict[[stem]])) stem_dict[[stem]] <- as.character(song_name) else
      stem_dict[[stem]] <- c(stem_dict[[stem]], as.character(song_name))
  }
}

devtools::use_data(stem_dict, stem_dict, internal = TRUE)
