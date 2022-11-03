# Les 4: Antwoorden van de opdrachten

## OPDRACHT 1 (eenvoudig): Maak de tekening van de auto af.

Schrijf de drie ontbrekende functies
om de auto te tekenen.

### Antwoord

```haskell
import Playground exposing (..)

main =
  picture
    auto

auto =
  [ carrosserie
  , voorwiel
  , achterwiel
  ]

carrosserie =
  rectangle darkGreen 450 150

voorwiel =
  circle darkRed 60
    |> move -100 -100

achterwiel =
  circle darkRed 60
     |> move 100 -100
```

## OPDRACHT 2 (eenvoudig): Teken fruit aan de boom.

### Antwoord

```haskell
import Playground exposing (..)

main =
  picture
    [ stam
    , bladeren
    , fruit1
    , fruit2
    , fruit3
    , fruit4
    ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren =
  circle green 150
    |> move 0 50

fruit1 =
  circle red 20
    |> move 50 50

fruit2 =
  circle red 20
    |> move -40 20

fruit3 =
  circle red 20
    |> move -50 100

fruit4 =
  circle red 20
    |> move 40 130
```

Makkelijk, niet? Maar misschien vraag je je af:
Wanneer moeten we een nieuwe functie creëren?
Begrijpen wanneer het een goed idee is om een
functie in verschillende kleine functies te "breken", is iets wat
we leren door ervaring.  
Over het algemeen is het een goed idee om een ​​functie in kleinere functies te "breken" wanneer de code verwarrend wordt en het moeilijk wordt om te onderscheiden welk deel van de code wat doet.

Binnenkort zullen we leren hoe we ditzelfde soort probleem op een elegantere manier kunnen oplossen: het is beter om de code opnieuw te gebruiken.

## En nu?

Ga nu door met [Les 5](/les_5.html), veel succes!
