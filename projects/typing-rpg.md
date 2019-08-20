
# Typing RPG

## Summary

I wrote a small role-playing game based on typing. It's somewhat similar in style to [the Final Fantasy](https://en.wikipedia.org/wiki/Final_Fantasy) series, but not as developed. The player must type words to deal damage to monsters. There are several classic RPG elements such as equipment and usable items. I wrote this game using the [PyGame](https://www.pygame.org/) library, which is essentially [SDL](https://en.wikipedia.org/wiki/Simple_DirectMedia_Layer) bindings for Python. The entire project can be viewed [here](https://github.com/charlesoblack/japanese-word-rpg).

## Approach

I took a classic "big project" approach when writing this game. The first thing I did was write the main mechanic: attacking monsters by typing. Whether a monster is hit or not depends on the accuracy of one's typing, as measured by `difflib.SequenceMatcher` which is an algorithm similar to Ratcliff-Obershelp. Equipped with a Trello board, I slowly but surely built on this core mechanic until I had a far more developed game. I learned a lot about how the PyGame library works through this project, as well as how development of a videogame works.

I still have a lot of ideas for things to add and things to improve in this game. The most important things to add are likely a more compelling storyline and more items. Coding-wise, the menuing system could be improved, as well as the battle maps, which are currently procedurally generated using a "drunkard's walk" algorithm.

## Results

Here are some screenshots of the development process:

![screenshot 1](./images/jwr-1.png) { margin: auto }

![screenshot 2](./images/jwr-2.png) { margin: auto }

![screenshot 3](./images/jwr-3.png) { margin: auto }

![screenshot 4](./images/jwr-4.png) { margin: auto }

![screenshot 5](./images/jwr-5.png) { margin: auto }

![screenshot 6](./images/jwr-6.png) { margin: auto }

![screenshot 7](./images/jwr-7.png) { margin: auto }

![screenshot 8](./images/jwr-8.png) { margin: auto }

![screenshot 9](./images/jwr-9.png) { margin: auto }

![screenshot 10](./images/jwr-10.png) { margin: auto }

![screenshot 11](./images/jwr-11.png) { margin: auto }

![screenshot 12](./images/jwr-12.png) { margin: auto }

![screenshot 13](./images/jwr-13.png) { margin: auto }

![screenshot 14](./images/jwr-14.png) { margin: auto }

And here are some screenshots of the current state:

![screenshot 15](./images/jwr-15.png) { margin: auto }

![screenshot 16](./images/jwr-16.png) { margin: auto }

![screenshot 17](./images/jwr-17.png) { margin: auto }

![screenshot 18](./images/jwr-18.png) { margin: auto }
