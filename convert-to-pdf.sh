#!/bin/bash

for i in ./projects/*.md
do
    pandoc $i \
        -o ${i%.md}.pdf \
        -fmarkdown-implicit_figures \
        -V geometry:margin=2cm \
        --css pandoc.css
done