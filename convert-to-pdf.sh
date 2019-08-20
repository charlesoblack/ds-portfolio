#!/bin/bash

touch portfolio.md

cat projects/chess-pipeline.md >> portfolio.md
cat projects/idac-predictor.md >> portfolio.md
cat projects/spotify-genre-playlists.md >> portfolio.md
cat projects/typing-rpg.md >> portfolio.md
cat projects/genetic-hello-world.md >> portfolio.md
cat projects/markov-dracula.md >> portfolio.md

pandoc portfolio.md \
    -o portfolio.pdf \
    -fmarkdown-implicit_figures \
    -V geometry:margin=2cm \
    --toc

rm portfolio.md
