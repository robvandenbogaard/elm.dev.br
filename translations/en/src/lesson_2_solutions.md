# Lesson 2: Answers to the challanges

Open the following address in a new tab in your browser:
<a href='https://elm-lang.org/try' target='_blank'>htts://elm-lang.org/try</a>.  

Copy the answer to each challenge below and try to understand what they will do before clicking on *Rebuild*.  

## CHALLENGE 1 (easy): Change the size of the circle.

Change the value of the size of the circle to a number you like.
It can be a value as small as 1 or 2, or a number quite big like 9999999.
Proceed by clicking *Rebuild* and inspect the result!

### Solution

This challenge is quite easy isn't it? You just need to change the value of the size of the circle.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 5 ]
```

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

### Solution

This one is also quite easy. You just have to change the first parameter of the *circle* to an other color.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle red 5 ]
```

## CHALLENGE 3 (advanced): Make 2 circles, one inside another.

Our *picture* currently only has one circle.
Try to add a second circle with a different color and
a bit smaller than the first one.

👩‍🏫 __Hints__:

- Remember that for making a list you need to use the symbols **[** and **]**. So the second circle needs to be inbetween those symbols.
- Think of a list as something similar to a shopping list, but instead of groceries our list will contain geometric shapes.
- Use a comma to indicate that you want to create a second circle inside the list of geometric shapes.
- Beware of the ordering! If the small circle is first in the list, it will be painted behind the bigger circle, and you would not be able to see it. 

### Solution

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100
    , circule red 50
    ]
```
You should read the code above in the following way:
Our program (*main*) is defined to consist of a drawing (*picture*) containing a list (indicated by the symbols **[** and **]**) of two shapes, two circles, in this case.

## CHALLENGE 4 (advanced): Make 4 circles, each one inside the others.

Just like the previous exercise, but this time we need to draw 4 circles, each one inside the others, with different sizes and colors.

### Solution

If challenges 3 and 4 were difficult for you, now that you have seen the solution to challenge 3, you can try to solve challenge 4 before looking at the solution below.

Before executing this code below, can you imagine what it will draw on the screen?
 
```haskell
import Playground exposing (..)

main =
  picture
    [ circle black 200
    , circle green 150
    , circle yellow 100
    , circle red 50
    ]
```

## And now?

Go to [Lesson 3](/lesson_3.html) and good luck!
