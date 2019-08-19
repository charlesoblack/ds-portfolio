# Chess Pipeline

## Summary

I wrote a data processing pipeline for statistics on chess games from [lichess](http://lichess.org). The Python script fetches data from the [lichess API](https://lichess.org/api), processes it using the [`python-chess`](https://github.com/niklasf/python-chess) library, and finally uploads it to a [PostGreSQL](https://www.postgresql.org/) database. The entire infrastructure runs on a [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/). The codebase for this project is [can be found on my GitHub](https://github.com/charlesoblack/chess-pipeline).

## Approach

One of my former managers and I are very interested in chess. We both have online accounts on lichess. At some point, my manager got the feeling that player ratings are inflated on the weekend as compared to during the week, so I looked up the lichess API and pulled some data so that I could analyze it. Initially, I just used the [python-lichess](https://github.com/cyanfish/python-lichess) library, but then expanded to actually transform the data and manipulate it so that the columns I got from the simple PGN parsing made more sense for my purposes.

Eventually, I also realized I wanted a little bit more than just PGN headers, such as knowing whether a queen exchange happened or what side castling occurred. I delved into `python-chess` and its `Visitor`s and created my own subclasses of `BaseVisitor` in order to gather some of these stats. I also used them to gather the clock times and engine evaluations if they were available.

The actual orchestration of the scripts is done with the [`Luigi`](https://github.com/spotify/luigi) library, originally created by Spotify. It's essentially just a directed acyclic graph manager. The triggering of each task tree is done with simple `cron` calls.

As for the database, I set up PostGreSQL 9.6 because Raspbian does not support higher versions of PostGreSQL running on it. It's got a setup script in the repository for this project so that the correct users are created and the correct permissions are applied. There are also `.sql` files for creating the actual tables that hold information.

Finally, I set up a few dashboards using [Tableau](https://www.tableau.com/) and a few using [seaborn](https://seaborn.pydata.org/index.html), a visualization library in Python that is based on [Matplotlib](https://matplotlib.org/).

## Results

These are a few of the graphs I created using the data I gathered:



This project is still a work in progress, but I'm quite satisfied with what I've done so far.
