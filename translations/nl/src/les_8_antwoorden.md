# Les 8: Antwoorden van de opdrachten

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

### Antwoord

Stel gewoon de *x*-as altijd in op 0 en laat
de *y*-as variëren tussen -100 en 100 met behulp van de *zigzag*-functie.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ square darkGreen 100 
        |> move 0 (zigzag -100 100 2 time)
  ]
```

## OPDRACHT 2 (eenvoudig): Diagonaal (schuin) bewegen

Verander de code in opdracht 1 zodat het vierkant
diagonaal beweegt. De beweging moet beginnen op het 
punt -100, -100 en eindigen op 100, 100.

### Antwoord

Er zijn een paar manieren om deze oefening op te lossen.
De eenvoudigste manier is om dezelfde code, die we voor de *y*-as in de vorige opdracht gebruikten, ook te gebruiken voor de *x*-as. We verplaatsen dus de 2 assen altijd op dezelfde manier. Dit zorgt voor een diagonale beweging 

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ square darkGreen 100 
        |> move (zigzag -100 100 2 time) (zigzag -100 100 2 time)
  ]
```

## OPDRACHT 3 (vrij): Mix de bewegingen

Teken met behulp van de functies *zigzag* en *wave* figuren
die over het scherm bewegen.  
Je kunt de wielen van een auto animeren, de ogen van een dier,
of gewoon verschillende figuren tekenen die verwoed bewegen
op het scherm! Gebruik je fantasie.

### Antwoord

Vrije oefeningen hebben geen goede of foute antwoorden!
Het belangrijkste is om te oefenen en plezier te hebben.

## En nu?

Ga nu door met [Les 9](les_9.html), veel succes!

