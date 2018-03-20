# Peg solitaire solver

Simple peg solitaire solver (aka the "IQ tester" game). I'd like to expand this to include other types of boards and searches.

See: [Wikipedia peg solitaire](https://en.wikipedia.org/wiki/Peg_solitaire "Wikipedia peg solitaire")

Sample runs:

   PS C:\Users\greg\Documents\ruby\peg-solitaire-solver> ruby main.rb
   start position:
   
        x
       x x
      o o o
     o o o x
    x o o x x
   
   no solution for this position
   PS C:\Users\greg\Documents\ruby\peg-solitaire-solver> ruby main.rb
   start position:
   
        x
       x x
      x o x
     x x x x
    x x x x x
   
   solved in 1.521377 seconds using 13 moves
   
        x
       x x
      x o x
     x x x x
    x x x x x
   
   
        x
       x x
      x x x
     x o x x
    x o x x x
   
   
        x
       x x
      x x x
     x x o o
    x o x x x
   
   
        x
       o x
      x o x
     x x x o
    x o x x x
   
   
        x
       x x
      o o x
     o x x o
    x o x x x
   
   
        o
       o x
      x o x
     o x x o
    x o x x x
   
   
        o
       o o
      x o o
     o x x x
    x o x x x
   
   
        o
       o o
      x o x
     o x x o
    x o x x o
   
   
        o
       o o
      x o x
     o x x o
    x x o o o
   
   
        o
       o o
      o o x
     o o x o
    x x x o o
   
   
        o
       o o
      o o x
     o o x o
    x o o x o
   
   
        o
       o o
      o o o
     o o o o
    x o x x o
   
   
        o
       o o
      o o o
     o o o o
    x x o o o
   
   
        o
       o o
      o o o
     o o o o
    o o x o o
   
