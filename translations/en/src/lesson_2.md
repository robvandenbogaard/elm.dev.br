# Lesson 2 - Drawing on the computer screen

## What will you learn in this lesson?

1. What is an *import*?
2. Drawing a ball.
3. What does *main* mean?
4. The *picture*
  4.1 But what is a list?
5. The *circle*?

## 1- What is an *import*?

The first line of all programs we write during
this course should read:

```haskell
import Playground exposing (..)
```

The word *import* means that we will bring something into our program.
This line says that you can use the words defined in the  *Playground* package. In lesson 5 I will explain it in
more detail, but without it, drawing on the screen would not be possible.
That is why all programs in this course start with this line..

## 2- Drawing a ball.

It is time to program!
Let's draw a circle on the screen.
Open the site <a href='https://elm-lang.org/try' target='_blank'>https://elm-lang.org/try</a>
in another tab of your browser and paste the code below.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100 ]
```

Click *Rebuild* after pasting it and inspect the result of the program execution.
It should look like the image below:

![Desenhando um circulo](/resources/elm-lang-try-circulo.png)

But what's happening?!

## 3- What does *main* mean?

The word *main* is used to indicate where the
computer should start your program
That is why all your programs should contain
this line:

```haskell
main =
```

And the rest represents what you want the computer to do
for you.

🚨 __Beware__: there should not be any spaces before the
word *main*.

## 4- The *picture*

The *picture* contains your drawing.
You use it to indicate to the computer
that you want to draw something on screen.
Continue by creating a **list** (represented by
the symbols **[** and **]**) of geometric shapes the
*picture* will consist of. In this example the drawing
consists of only a single geometric shape: a circle.

### 4.1- But what is a list?

When I go shopping for groceries, I write down a list
of things I would like to buy. Something like:
- 5Kg rice
- 1Kg beans
- 3 big potatoes
- 2 mangos

The concept of a list in programming is very similar: it
is used to structure and relate a set of data.

To represent for instance the list of numbers from zero
to ten, we write:
```haskell
[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
```
And a list can be very big, it can have only one element
or could as well be empty!

#### Other examples of lists:

An empty list:
```haskell
[]
```
A list with only one element:
```haskell
[ 1 ]
```

A list of 3 elements:
```haskell
[ 8, 13, 311839 ]
```

An other list of 3 elements:
```haskell
[ "Potato", "Carrot", "Pumpkin" ]
```

Throughout this course we will create many lists!

## 5- The *circle*

Een list of geometric shapes can have circles,
rectangles, hexagons and many other shapes.
In the previous example a *circle* was used.
To draw a circle it is necessary to specify 2 **parameters**:
The first parameter defines which color it should be.
For instance, the color *green* is used.
The second parameter defines the diameter (the size) of the circle. 100, in this case.

## What's next?

Now is the time to get your hands dirty and practice a bit!
Move on to the [challenges of Lesson 2](/lesson_2_challenges.html) - you'll do great!
