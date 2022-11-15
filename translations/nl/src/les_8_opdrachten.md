# Les 8: Opdrachten

## OPDRACHT 1 (eenvoudig): Verticaal bewegen

Verander onderstaande code zodat het vierkant
verticaal beweegt (van boven naar beneden). Dit doe je door de positie van het vierkant op de *y* -as te variëren tussen -100 en 100.  
De animatie moet 2 seconden duren om de cyclus te voltooien.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ square darkGreen 100 
        |> move -0 0
  ]
```

## OPDRACHT 2 (eenvoudig): Diagonaal (schuin) bewegen

Verander de code in opdracht 1 zodat het vierkant
diagonaal beweegt. De beweging moet beginnen op het 
punt -100, -100 en eindigen op 100, 100.

## OPDRACHT 3 (vrij): Mix de bewegingen

Teken met behulp van de functies *zigzag* en *wave* figuren
die over het scherm bewegen.  
Je kunt de wielen van een auto animeren, de ogen van een dier,
of gewoon verschillende figuren tekenen die verwoed bewegen
op het scherm! Gebruik je fantasie.

## En nu?

Is het je gelukt om alle oefeningen te doen? Had je moeite met een van hen?

Ga naar [antwoorden van de opdrachten](les_8_antwoorden.html) om de oplossing te zien.

