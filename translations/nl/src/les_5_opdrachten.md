# Les 5: Opdrachten

## OPDRACHT 1 (eenvoudig): Maak meer fruit

```haskell
import Playground exposing (..)

main =
  picture
    [ stam
    , bladeren
    , fruit 50 50
    , fruit -40 20
    , fruit -50 100
    , fruit 40 130
    ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren =
  circle green 150
    |> move 0 50

fruit x y =
  circle red 20
    |> move x y
```

Wijzig de hierboven gedefinieerde code en maak nog
drie vruchten in jouw boom.

## OPDRACHT 2 (gemiddeld): Het formaat van de bladeren instelbaar maken

Maak in dezelfde code als in opdracht 1 
een parameter voor de *bladeren* functie
om de grootte van de cirkel weer te geven.  
Probeer de grootte van de cirkel te vergroten en te verkleinen. 

👩🏫 __Tip__: Als je een waarde doorgeeft die te groot of te klein is, zal jouw boom er waarschijnlijk vreemd uitzien, omdat de bladeren de stam niet raken. Maak je hier voorlopig geen zorgen over.

## En nu?

Is het je gelukt om alle oefeningen te doen? Had je moeite met een van hen?

Ga naar [antwoorden van de opdrachten](les_5_antwoorden.html) om de oplossing te zien.
