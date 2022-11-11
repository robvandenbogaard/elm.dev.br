# Listing: poppetje

Dit poppetje is opgebouwd uit de basisvormen `rectangle` en `square`. 

Zie je dat je een opmerking (zomaar een zinnetje) kunt typen als je er twee streepjes `--` voor typt?

```haskell
import Playground exposing (..)

main =
  picture
    [ square brown 100
      |> move 0 110
    , rectangle lightGreen 190 140
    , rectangle brown 100 35
      |> rotate 90
      |> move 77 -20
    , rectangle brown 35 100
--    , rectangle brown 100 35
--      |> rotate 90
      |> move -77 -20
    , rectangle blue 200 115
      |> rotate 90
      |> move 0 -170
    ]
```