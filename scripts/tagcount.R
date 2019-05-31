# tagcount.R
#
# counts occurrences of words in data files,
# one word per line
# 
# data files are specified at the top of the file
#
# TODO: accept data file(s) as parameters?

library("tidyverse")
library("huxtable")

tagfile = read_lines("../data/clean_thebest_tags")

count_tags  <- function(tags) {
    tag_table  <- table(tags, deparse.level = 0)
    tag_tibble <-  enframe(tag_table, name = "tag", value = "count")
}

tags_counted  <- count_tags(tagfile) %>%
    top_n(10, count) %>%
    arrange(desc(count))

print(tags_counted)

tags_ht  <- as_hux(tags_counted) %>%
    set_latex_float('!h') %>%
    set_caption("De mest populære hashtags") %>%
    set_escape_contents(FALSE)


tags_ht$tag <- paste0("\\texttt{\\",tags_ht$tag,"}") 
    

tags_latex  <- write_file(to_latex(tags_ht),"../fig/tag_table.tex")

