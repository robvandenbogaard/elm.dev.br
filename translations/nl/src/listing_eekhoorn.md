# Listing: eekhoorn

Deze eekhoorn is opgebouwd uit de basisvormen `circle`, `oval` en `triangle`. Het beestje kijkt naar beneden - misschien kun je het in een andere richting laten kijken?

Zie je dat je een opmerking (zomaar een zinnetje) kunt typen als je er twee streepjes `--` voor typt?

```haskell
import Playground exposing (..)

main =
  picture
    [ rectangle gray 400 1 -- horizontale lijn op hoogte 0
    , oval darkBrown 100 150
      |> move 20 50
    , staart
      |> rotate 12
      |> move -45 100
    , poot
    , oval brown 100 40
      |> move 50 80
    , kop
    ]

staart =
  group
    [ circle brown 50
      |> move -26 60
    , oval brown 65 200
    ]

poot =
  group
    [ oval brown 80 100
    , oval brown 110 45
      |> rotate -10
      |> move 23 -35
    ]

kop =
  group
    [ circle brown 40
      |> move 20 150
    , triangle brown 20
      |> rotate 10
      |> move 5 190
    , oog (kijk NaarBeneden)
      |> move 40 170
    ]

oog transformatie =
  group
    [ circle white 10
    , circle black 5
      |> transformatie
    ]

type Richting
  = NaarBeneden
  | NaarBoven
  | NaarVoren

kijk richting =
  case richting of
    NaarBeneden -> move 5 -5
    NaarBoven -> move 5 5
    NaarVoren -> move 5 0
```