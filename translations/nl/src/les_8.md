# Les 8 - Zigzagbewegingen maken

## Wat leer je in deze les?

1.  Hoe animeer je een figuur met een zigzagbeweging.   
1.1 De *zigzag* functie.  

## 1 - Hoe animeer je een figuur met een zigzagbeweging 

We beginnen met het tekenen van een cirkel op het scherm, en 
verplaatsen het een beetje naar links..

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue 100 
        |> move -200 0
  ]
```

Stel je voor dat je een animatie wilt maken op deze figuur,
waardoor deze "zigzagt" (zijn richting steeds afwisselt).

In het bovenstaande voorbeeld is de positie van de cirkel vastgesteld op -200 op de horizontale as en 0 op de verticale as.  
Om de "zigzag"-beweging te maken, moet deze waarde
veranderen naarmate de tijd verstrijkt (die variabele
_time_ waar je over geleerd hebt in de vorige les.

Om bijvoorbeeld een animatie te maken waarbij de cirkel
van links naar rechts beweegt, is het noodzakelijk om de positie ervan te wijzigen op de horizontale as.  Dat wil zeggen, vervang de waarde -200 door een waarde die lineair verandert in de tijd. 
En de **zigzag** functie vervult precies deze taak.

### 1.1 - De _zigzag_ functie

_zigzag_ is een functie die vergelijkbaar is met _wave_. 
Het ontvangt ook vier parameters, waarbij de eerste twee parameters de minimale en maximum waarden aangeven. De derde parameter geeft het aantal seconden aan dat de animatie nodig heeft om te voltooien.

Nu je de _zigzag_ functie en zijn doel kent, 
stel je dan het volgende voor: hoe zou de code eruit kunnen zien om een cirkel van links naar rechts te laten bewegen, tussen positie -200 en 200 met een interval van 5 seconden?

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue 100 
        |> move (zigzag -200 200 5 time) 0
  ]
```

Nogmaals, let op: je mag de haakjes niet vergeten, want
de eerste parameter van de functie _move_ moet het resultaat zijn
van de _zigzag_ functie. 
Om dit te doen, is het noodzakelijk om aan de computer door te geven (via het gebruik van haakjes) dat je eerst 
de waarde van de *zigzag*-functie wilt verwerken en berekenen om vervolgens de *move*-functie te verwerken.
En, kun je nu al de mogelijkheden voorstellen van het maken van complexere animaties en wie weet zelfs spelletjes met deze functies? 😃

## En nu?

Nu is het tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 8 opdrachten](les_8_opdrachten.html) en veel succes met oefenen!
