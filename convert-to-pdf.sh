#!/bin/bash

cat projects/*.md > portfolio.md

pandoc portfolio.md \
    -o portfolio.pdf \
    -fmarkdown-implicit_figures \
    -V geometry:margin=2cm \
    --css pandoc.css

rm portfolio.md
