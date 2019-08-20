
# Genetic Hello World

## Summary

I wrote a small program that uses a process similar to genetic evolution to come up with a sentence given by the user. From random strings of characters, it slowly optimizes a loss function and "selects" for genes, or substrings, that provide a lower loss. The entire codebase can be found [on my GitHub](https://github.com/charlesoblack/genetic-hello-world).

## Approach

I started out generating random strings of characters. These serve as the base population (the first instance of the `Generation` class). Each of these strings is then evaluated by how far they are from the target string given by the user. The loss function is simply a conversion to an ASCII table code point with `ord()` and its squared distance to the target string's `ord()` code point. The next `Generation` is given by the "children" of the top 5% of individuals (as measured by the loss function) from the previous `Generation`. These children are a random combination of the "genes" of their parents - substrings of the `Individual` strings.

The gene mutation mechanism is a random choice between:

- no change
- copying the character one character over
- copying the character two characters over
- adding/subtracting 1 from the `ord()` code point for the current character

This mechanism is repeated until one of the individuals is the target string. 

## Results

Overall, the genetic mutation mechanism works very well. It provides enough randomness to the individuals that they evolve relatively quickly. The main concern is with the degree of generation growth - in other words, how quickly the population grows. If the population grows too large, then there is too much variability in the top 5% of individuals for there to be a steady rate of evolution towards the target string; but if the population does not grow quickly enough, then there is too little variability for evolution towards the target string to occur rapidly. This does not play such a large role with small targets such as "Hello World!", but larger strings present the scalability issues.

Another important factor is choosing the top 5% of individuals. Initially, this was done with a list comprehension and sorting, but this proved to be too slow for large string populations. I decided to use the `heapq.nlargest()` and `heapq.nsmallest()` functions for this to improve speed, but this is still relatively slow. This is shown with the `profiling.py` file that shows exactly where on the script that the program spends the most time.

Possible improvements to this project would be a better loss function, a more complex gene mutation system, a better visualization (perhaps with the `Pillow` library?), and better speed for the selection of best `Individual`s.
