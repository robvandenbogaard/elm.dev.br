# Les 4: Opdrachten

## OPDRACHT 1 (eenvoudig): Maak de tekening van de auto af.

Hieronder staat een onvolledig stuk code voor het tekenen van een auto.  
Schrijf de drie ontbrekende functies
om de auto te tekenen.

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
```

## OPDRACHT 2 (eenvoudig): Teken fruit aan de boom.

De onderstaande code stelt een boom zonder fruit voor.

```haskell
import Playground exposing (..)

main =
  picture
    boom

boom =
  [ stam
  , bladeren
  ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren =
  circle green 150
    |> move 0 50
```

Voeg wat meer functies toe om 4 vruchten aan de boom weer te geven. De vruchten kunnen eenvoudige rode bollen zijn. 

👩‍🏫 __Tip__: De gemakkelijkste manier is om 4 nieuwe
functies te maken: fruit1, fruit2, fruit3 en fruit4. In de volgende les zullen we een betere manier zien
om dit soort problemen op te lossen. 

## En nu?

Is het je gelukt om alle oefeningen te doen? Had je moeite met een van hen?

Ga naar [antwoorden van de opdrachten](/les_4_antwoorden.html)
om de oplossing te zien.
