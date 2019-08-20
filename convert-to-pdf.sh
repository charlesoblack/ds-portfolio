#!/bin/bash

portfolio=$( cat *.md )

pandoc $portfolio \
    -o portfolio.pdf \
    -fmarkdown-implicit_figures \
    -V geometry:margin=2cm \
    --css pandoc.css
