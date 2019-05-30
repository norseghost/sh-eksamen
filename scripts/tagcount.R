# tagcount.R
#
# counts occurrences of words in data files,
# one word per line
# 
# data files are specified at the top of the file
#
# TODO: accept data file(s) as parameters?

library("tidyverse")

tagfile = read_lines("../data/clean_bestmen_tags")

count_tags  <- function(tags) {
    tag_table  <- table(tags, deparse.level = 0)
    tag_tibble <-  enframe(tag_table, name = "tag", value = "count")
}

tags_counted  <- count_tags(tagfile) %>%
    top_n(10, count) %>%
    arrange(desc(count))

print(tags_counted)

