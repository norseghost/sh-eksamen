!#/bin/bash

# all hahtags, sequentially
rg '(?<=\s|^)#(\w*[A-Za-z_]+\w*)' --pcre2 -o --no-column --no-line-number --no-heading -I *.txt

# All hashtags, prefixed by line
rg '(?<=\s|^)#(\w*[A-Za-z_]+\w*)' --pcre2 -o --no-column --no-line-number --no-heading *.txt
