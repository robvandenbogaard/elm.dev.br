# Les 3: Antwoorden van de opdrachten

## OPDRACHT 1 (eenvoudig): Teken een auto.

Gebruik een rechthoek die de auto moet voorstellen
en twee cirkels die zijn wielen moeten voorstellen.  
Gebruik de *move* instructie om de wielen te plaatsen.

### Antwoord

```haskell
import Playground exposing (..)

main =
  picture
    [ rectangle darkGreen 450 150
    , circle darkRed 60
        |> move -100 -100
    , circle darkRed 60
        |> move 100 -100
    ]
```

## OPDRACHT 2 (eenvoudig): Teken een boom.

Gebruik een bruine rechthoek die de stam moet voorstellen 
en een groene cirkel die de bladeren moeten voorstellen.

### Antwoord

```haskell
import Playground exposing (..)

main =
  picture
    [ rectangle darkBrown 60 250
        |> move 0 -150
    , circle green 150
        |> move 0 50
    ]
```

## OPDRACHT 3 (uitdagend): Teken een ster.

Gebruik driehoeken om een 6-puntige ster te tekenen.

### Antwoord

```haskell
import Playground exposing (..)

main =
   picture
     [ triangle blue 150
     , triangle blue 150
         |> rotate 180
     ]
```

## OPDRACHT 4 (uitdagend): Teken een bus.

Probeer ramen te plaatsen, de voorkant van de bus
en al het andere dat je maar wilt! Er is geen
fout antwoord. Gebruik je fantasie!

### Antwoord

```haskell
import Playground exposing (..)

main =
   picture
     [ circle black 40
         |> move -120 -90
     , circle gray 20
         |> move -120 -90
     , circle black 40
         |> move 120 -90
     , circle gray 20
         |> move 120 -90
     , rectangle yellow 500 180
     , square white 80
         |> move -190 0
     , square white 50
         |> move -100 0
     , square white 50
         |> move 0 0
     , square white 50
         |> move 100 0
     , square white 50
         |> move 200 0
     , square white 50
         |> move 200 0
     , rectangle black 15 10
         |> move -250 -85
     , square darkYellow 10
         |> move -250 -60
     , rectangle yellow 20 3
         |> move -270 -60
     , rectangle yellow 20 3
         |> move -270 -73
         |> rotate 40
     , rectangle yellow 20 3
         |> move -270 -47
         |> rotate -40
     ]
```

## En nu?

Ga nu door met [Les 4](/les_4.html), veel succes!
