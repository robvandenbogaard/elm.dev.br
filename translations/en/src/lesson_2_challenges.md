# Lesson 2: Challenges

To consolidate what you learnt it is important to practice.


In this section we propose some challenges for you to try out
yourself. It's **sooooo** important that you try to
solve them before seeing the answers!

First, open the following address into a new tab in your browser:
<a href='https://elm-lang.org/try' target='_blank'>https://elm-lang.org/try</a>.  

Copy and execute the same code we saw in lesson 2:

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100 ]
```

Now, try to change the code to do the exercises below.
Don't be afraid to make mistakes!
Experiment, check, explore, make errors. The worst that can happen is that an error message will appear.

## CHALLENGE 1 (easy): Change the size of the circle.

Change the value of the size of the circle to a number you like.
It can be a value as small as 1 or 2, or a number quite big like 9999999.
Proceed by clicking *Rebuild* and inspect the result!

## CHALLENGE 2 (easy): Change the color of the circle.

Change the value of the color of the circle to a color you like.
Below is a list of the names of colors our *Playground* recognizes.

### List of colors:
red, orange, yellow, green, blue, purple, brown,
lightRed, lightOrange, lightYellow, lightGreen,
lightBlue, lightPurple, lightBrown, darkRed,
darkOrange, darkYellow, darkGreen, darkBlue,
darkPurple, darkBrown, white, lightGrey, grey,
darkGrey, lightCharcoal, charcoal, darkCharcoal,
black, lightGray, gray and darkGray.

## CHALLENGE 3 (advanced): Make 2 circles, one inside another.

Our *picture* currently only has one circle.
Try to add a second circle with a different color and
a bit smaller than the first one.

👩‍🏫 __Hints__:

- Remember that for making a list you need to use the symbols **[** and **]**. So the second circle needs to be inbetween those symbols.
- Think of a list as something similar to a shopping list, but instead of groceries our list will contain geometric shapes.
- Use a comma to indicate that you want to create a second circle inside the list of geometric shapes.
- Beware of the ordering! If the small circle is first in the list, it will be painted behind the bigger circle, and you would not be able to see it.

## CHALLENGE 4 (advanced): Make 4 circles, each one inside the others.

Just like the previous exercise, but this time we need to draw 4 circles, each one inside the others, with different sizes and colors.

## And now?

Could you do all of these challenges? Was it difficult to finish them?
Go to [the solutions to the challenges](/lesson_2_challenges_solutions.html)
to compare your answers.
