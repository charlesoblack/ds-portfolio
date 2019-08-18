# Markov Model for *Dracula*

## Summary

I created a Markov model for the sentences in the first few chapters of *Dracula*, by Bram Stoker. It generates sample sentences that have the same vocabulary as the novel. The entire codebase can be found [here](https://github.com/charlesoblack/markov-sample).

## Approach

I took the first few chapters of *Dracula*, by Bram Stoker, from [Project Gutenberg](https://www.gutenberg.org) and placed them in a plaintext file. No cleaning was done in this step other than formatting. This file is the basis for a Markov model: each word has a list of following words, along with the probability of that word coming up next. This is done simply by counting the number of occurrences for each word. Sentence beginnings are counted separately so that the generated sentences always start similarly to original sentences. The generated sentences are then created with a weighted random choice.

## Results

Here are a few of the sample sentences:

- He had been a remarkable ruddiness showed more than living ring round the woman and almost outside.
- With red with four hours I would not know that one person to allow others wake that I became quite impregnable and there to strain and said I was very large number of the Red with an excited state I lay like a criminal s return to transfer to my host who would have taken with much that I soon we shall stay up a man was rank but my clothes were wolf or two great square boxes manifestly those red tongues of starting for everything and begin with it was emphasised by main object of the morning as a sick feeling that I said in a charming smile which held out.
- Great God keep my face was not but the roll of the palm.
- God s habit of my luggage inside and dried her heart.
- Something going and my smattering of such wrath and the blood their dress white sharp canine teeth these superstitions When he is his arms as outrider.
- I felt under my notes as the Count threw herself forward and again Oh young friend I have done and uncanny that way the local help me to the backs of an unknown man can boast a heavy old Quatre Face blood their menfolk away muffled sound as a long sleep as we wound on each side.
- It the trouble be served save superstition in with Mina before them.
- It to my mind occupied went into his seat and where of my face I must examine this conclusion when they would be dreaming when I can send a pile of my window somewhat less than the distance of the time putting down etc.
- He suddenly turned his anger.
- When all crossing himself in the beating of a deep between them.

It's clear that the Markov model does not yield sentences that make perfect sense. As expected, certain terms make sense in immediate context - e.g. "white sharp canine teeth", "I must examine this conclusion" - but not in the greater context of the sentence. This is an inherent weakness of the Markov model because the only context given to the model is the previous word - it does not use any of the other surrounding information for generating sentences, nor does it have any sort of language model in order to have proper grammar and sentence structure.

However, given the simplicity of the model, these results are more than satisfactory. Possible improvements to this project would include giving the model more training data to work with (i.e. more chapters of the book), better data cleaning (mostly in regards to punctuation and identifying sentence beginnings) and identifying words that almost always follow other words and giving them an individual context.
