# Words

Laat wat woorden zien!

```haskell
import Playground exposing (..)

main =
  picture
    [ words black "Hello! How are you?"
    ]
```

Naam compleet geschreven of in losse letters zodat je die afzonderlijk kan aanpassen (color, shape, animate, ..)

## scale: 

Maak een vorm groter of kleiner. Dus, als je wilt dat sommige woorden groter zijn, zou je kunnen zeggen:


```haskell
import Playground exposing (..)

main =
  picture
    [ words black "Hello, nice to see you!"
        |> scale 3
    ]
```

## rotate: 

Draai vormen in graden.

```haskell
import Playground exposing (..)

main =
  picture
    [ words black "These words are tilted!"
        |> rotate 10
    ]
```


## fade:
Vervaag een vorm. Hiermee maak je vormen doorzichtig of zelfs helemaal onzichtbaar. Hier is een vorm die in en uit vervaagt:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ square orange 30
  , square blue 200
      |> fade (zigzag 0 1 3 time)
  ]
```

Het getal moet tussen 0 en 1 liggen, waarbij 0 volledig transparant is en 1 volledig solide is.
















source: https://package.elm-lang.org/packages/evancz/elm-playground/latest/Playground#scale