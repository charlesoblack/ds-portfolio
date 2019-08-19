# Typing RPG

## Summary

I wrote a small role-playing game based on typing. It's somewhat similar in style to [the Final Fantasy](https://en.wikipedia.org/wiki/Final_Fantasy) series, but not as developed. The player must type words to deal damage to monsters. There are several classic RPG elements such as equipment and usable items. I wrote this game using the [PyGame](https://www.pygame.org/) library, which is essentially [SDL](https://en.wikipedia.org/wiki/Simple_DirectMedia_Layer) bindings for Python. The entire project can be viewed [here](https://github.com/charlesoblack/japanese-word-rpg).

## Approach

I took a classic "big project" approach when writing this game. The first thing I did was write the main mechanic: attacking monsters by typing. Whether a monster is hit or not depends on the accuracy of one's typing, as measured by `difflib.SequenceMatcher` which is an algorithm similar to Ratcliff-Obershelp. Equipped with a Trello board, I slowly but surely built on this core mechanic until I had a far more developed game. I learned a lot about how the PyGame library works through this project, as well as how development of a videogame works.

I still have a lot of ideas for things to add and things to improve in this game. The most important things to add are likely a more compelling storyline and more items. Coding-wise, the menuing system could be improved, as well as the battle maps, which are currently procedurally generated using a "drunkard's walk" algorithm.

## Results

Here are some screenshots of the development process:



And here are some screenshots of the current state:


