# tagcount.R
#
# counts occurrences of words in data files,
# one word per line
# 
# data files are specified at the top of the file
#
# TODO: accept data file(s) as parameters?

library("tidyverse")

boycott_tags = read_lines("../data/clean_boycottgillette_related_tags")
boycott_table = table(boycott_tags, deparse.level = 0)
boycott_sort = sort(boycott_table, decreasing = TRUE)
boycott_tibble = enframe(boycott_sort, name = "tag", value = "count")
boycott_tibble
